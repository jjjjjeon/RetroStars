class MainScene extends Phaser.Scene {
    constructor() {
        super({ key: "MainScene" });
        this.cursors;
        this.livesText;
        this.scoreText;
        this.timerText;
        this.gameOver = false;
    }

    init(){
        this.lives = 3;
        this.score = 0;
        this.timer = 0;
        this.invulnerable = false;
        this.gameOver = false;
    }

    preload() {
        this.load.atlas('female', '/gboard/game5/assets/images/female.png', '/gboard/game5/assets/images/female_atlas.json');
        this.load.animation('female_anim', '/gboard/game5/assets/images/female_anim.json');
        this.load.image('tiles', '/gboard/game5/assets/images/RPG Nature Tileset.png');
        this.load.tilemapTiledJSON('map', '/gboard/game5/assets/images/map.json');
        this.load.image('goal', '/gboard/game5/assets/images/Princess_Idle_1.png');
        this.load.image('enemy1', '/gboard/game5/assets/images/EliteKnight_Idle_1.png');
        this.load.image('enemy2', '/gboard/game5/assets/images/HeavyKnight_Idle_1.png');
        this.load.image('enemy3', '/gboard/game5/assets/images/LargeEliteKnight_Idle_1.png');
        this.load.image('enemy4', '/gboard/game5/assets/images/Mage_Idle_1.png');
        this.load.image('enemy5', '/gboard/game5/assets/images/Archer_Idle_1.png');
    }

    create() {
        const map = this.make.tilemap({ key: 'map' });
        const tileset = map.addTilesetImage('RPG Nature Tileset', 'tiles', 32, 32);
        const layer1 = map.createLayer('Tile Layer 1', tileset, 0, 0);

        this.player = this.matter.add.sprite(400, 300, 'female', 'townsfolk_f_idle_1');
        this.player.setFixedRotation();
        this.matter.world.setBounds(0, 0, map.widthInPixels, map.heightInPixels);

        this.time.delayedCall(30000, () => {
            const goalX = Phaser.Math.Between(0, map.widthInPixels);
            const goalY = Phaser.Math.Between(0, map.heightInPixels);
            this.goal = this.matter.add.sprite(goalX, goalY, 'goal').setStatic(true);
        });

        this.enemies = this.add.group();
        this.spawnEnemies();

        this.cursor = this.input.keyboard.createCursorKeys();

        this.livesText = this.add.text(16, 16, 'Lives: 3', { fontSize: '32px', fill: '#fff' });
        this.scoreText = this.add.text(16, 48, 'Score: 0', { fontSize: '32px', fill: '#fff' });
        this.timerText = this.add.text(16, 80, 'Time: 0', { fontSize: '32px', fill: '#fff' });

        this.time.addEvent({ delay: 10000, callback: this.increaseScore, callbackScope: this, loop: true });
        this.time.addEvent({ delay: Phaser.Math.Between(1000, 10000), callback: this.spawnEnemies, callbackScope: this, loop: true });
        this.time.addEvent({ delay: 1000, callback: this.updateTimer, callbackScope: this, loop: true });

        this.setupCollisions();
    }

    update() {
        if (this.gameOver) {
            return;
        }

        const speed = 2.5;
        let playerVelocity = new Phaser.Math.Vector2();

        if (this.cursor.left.isDown) {
            playerVelocity.x = -1;
        } else if (this.cursor.right.isDown) {
            playerVelocity.x = 1;
        }

        if (this.cursor.up.isDown) {
            playerVelocity.y = -1;
        } else if (this.cursor.down.isDown) {
            playerVelocity.y = 1;
        }

        playerVelocity.normalize();
        playerVelocity.scale(speed);
        this.player.setVelocity(playerVelocity.x, playerVelocity.y);

        this.enemies.getChildren().forEach(enemy => {
            if (enemy.followPlayer) {
                const direction = new Phaser.Math.Vector2(this.player.x - enemy.x, this.player.y - enemy.y);
                direction.normalize();
                enemy.setVelocity(direction.x * 1.5, direction.y * 1.5);
            } else {
                if (!enemy.moveTimer || enemy.moveTimer <= 0) {
                    enemy.moveDirection = new Phaser.Math.Vector2(Phaser.Math.Between(-1, 1), Phaser.Math.Between(-1, 1)).normalize();
                    enemy.moveTimer = Phaser.Math.Between(1000, 3000);
                } else {
                    enemy.moveTimer -= 16.67;
                }
                enemy.setVelocity(enemy.moveDirection.x * 1, enemy.moveDirection.y * 1);
            }
        });
    }

    spawnEnemies() {
        const numEnemies = Phaser.Math.Between(3, 6);
        const positions = [
            { x: 0, y: Phaser.Math.Between(0, 600) },
            { x: 800, y: Phaser.Math.Between(0, 600) },
            { x: Phaser.Math.Between(0, 800), y: 0 },
            { x: Phaser.Math.Between(0, 800), y: 600 },
        ];

        for (let i = 0; i < numEnemies; i++) {
            const pos = positions[Phaser.Math.Between(0, positions.length - 1)];
            const enemyKey = 'enemy' + Phaser.Math.Between(1, 5);
            const enemy = this.matter.add.sprite(pos.x, pos.y, enemyKey);
            enemy.setFixedRotation();
            enemy.followPlayer = Phaser.Math.Between(0, 1) === 0;
            this.enemies.add(enemy);

            enemy.setData('invulnerable', true);
            this.time.delayedCall(1000, () => {
                enemy.setData('invulnerable', false);
            });
        }
    }

    increaseScore() {
        this.score += 30;
        this.scoreText.setText('Score: ' + this.score);
    }

    updateTimer() {
        this.timer++;
        this.timerText.setText('Time: ' + this.timer);
    }

    setupCollisions() {
        this.matter.world.on('collisionstart', (event) => {
            event.pairs.forEach(pair => {
                const { bodyA, bodyB } = pair;

                const enemyA = this.enemies.getChildren().find(enemy => enemy.body === bodyA);
                const enemyB = this.enemies.getChildren().find(enemy => enemy.body === bodyB);

                if ((enemyA && !enemyA.getData('invulnerable')) || (enemyB && !enemyB.getData('invulnerable'))) {
                    if (bodyA === this.player.body || bodyB === this.player.body) {
                        this.handlePlayerEnemyCollision();
                    }
                }

                if (this.goal && ((bodyA === this.player.body && bodyB === this.goal.body) || (bodyB === this.player.body && bodyA === this.goal.body))) {
                    this.handlePlayerGoalCollision();
                }
            });
        });
    }

    handlePlayerEnemyCollision() {
        if (this.gameOver || this.invulnerable) {
            return;
        }

        this.lives--;
        this.livesText.setText('Lives: ' + this.lives);

        if (this.lives <= 0) {
            this.add.text(400, 300, 'Game Over', { fontSize: '64px', fill: '#ff0000' }).setOrigin(0.5);
            this.player.setVelocity(0, 0);
            this.player.setStatic(true);
            this.gameOver = true;
            this.time.delayedCall(2000, () => {
                this.sendGameOverData();
                this.scene.start('GameOver5');
            });
        } else {
            this.invulnerable = true;
            this.player.setVelocity(0, 0);
            this.time.delayedCall(2000, () => {
                this.invulnerable = false;
            });
        }
    }

    handlePlayerGoalCollision() {
        if (this.gameOver) {
            return;
        }

        this.add.text(400, 300, 'You Win!', { fontSize: '64px', fill: '#00ff00' }).setOrigin(0.5);
        this.player.setVelocity(0, 0);
        this.player.setStatic(true);
        this.gameOver = true;
        this.time.delayedCall(2000, () => {
            this.sendGameOverData();
            this.scene.start('GameOver5');
        });
    }

    sendGameOverData() {
        $.ajax({
            url: "/write.playrecord",
            type: "POST",
            data: {
                gameSeq: 5,
                score: this.score,
                playtime: this.timer
            }
        }).done(function(resp) {
            if (resp == "success") {
                console.log("게임 플레이 기록 전송 성공!");
            } else {
                console.log("게임 플레이 기록 전송 실패!");
            }
        }).fail(function() {
            console.log("게임 플레이 기록 전송 실패!");
        });
    }
}