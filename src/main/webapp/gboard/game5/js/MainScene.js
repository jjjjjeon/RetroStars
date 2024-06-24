export default class MainScene extends Phaser.Scene {
    constructor() {
        super("MainScene");
        this.lives = 3;
        this.score = 0;
        this.timer = 0;
        this.gameOver = false;
        this.invulnerable = false; // 플레이어가 일시적으로 무적 상태인지 여부를 추적
    }

    preload() {
        this.load.atlas('female', 'assets/images/female.png', 'assets/images/female_atlas.json');
        this.load.animation('female_anim', 'assets/images/female_anim.json');
        this.load.image('tiles', 'assets/images/RPG Nature Tileset.png');
        this.load.tilemapTiledJSON('map', 'assets/images/map.json');
        this.load.image('goal', 'assets/images/Princess_Idle_1.png');
        this.load.image('enemy1', 'assets/images/EliteKnight_Idle_1.png');
        this.load.image('enemy2', 'assets/images/HeavyKnight_Idle_1.png');
        this.load.image('enemy3', 'assets/images/LargeEliteKnight_Idle_1.png');
        this.load.image('enemy4', 'assets/images/Mage_Idle_1.png');
        this.load.image('enemy5', 'assets/images/Archer_Idle_1.png');
    }

    create() {
        console.log("Creating map...");

        const map = this.make.tilemap({ key: 'map' });
        const tileset = map.addTilesetImage('RPG Nature Tileset', 'tiles', 32, 32);

        if (!tileset) {
            console.error("Tileset not loaded correctly. Check the tileset name and path.");
        }

        const layer1 = map.createLayer('Tile Layer 1', tileset, 0, 0);

        if (!layer1) {
            console.error("Layer not created correctly. Check the layer name in Tiled.");
        }

        this.player = this.matter.add.sprite(400, 300, 'female', 'townsfolk_f_idle_1');
        this.player.setFixedRotation();
        console.log("Player created:", this.player);

        // 맵 밖으로 나가지 않도록 설정
        this.matter.world.setBounds(0, 0, map.widthInPixels, map.heightInPixels);

        // 30초 후 목표 지점 생성
        this.time.delayedCall(30000, () => {
            const goalX = Phaser.Math.Between(0, map.widthInPixels);
            const goalY = Phaser.Math.Between(0, map.heightInPixels);
            this.goal = this.matter.add.sprite(goalX, goalY, 'goal').setStatic(true);
            console.log("Goal created:", this.goal);
        });

        this.enemies = this.add.group();
        this.spawnEnemies();

        this.cursor = this.input.keyboard.createCursorKeys();
        console.log("Cursor keys created:", this.cursor);

        // 목숨과 점수 표시
        this.livesText = this.add.text(16, 16, 'Lives: 3', { fontSize: '32px', fill: '#fff' });
        this.scoreText = this.add.text(16, 48, 'Score: 0', { fontSize: '32px', fill: '#fff' });
        this.timerText = this.add.text(16, 80, 'Time: 0', { fontSize: '32px', fill: '#fff' });

        // 10초마다 점수 증가
        this.time.addEvent({ delay: 10000, callback: this.increaseScore, callbackScope: this, loop: true });

        // 적들이 랜덤한 시간마다 생성
        this.time.addEvent({ delay: Phaser.Math.Between(1000, 10000), callback: this.spawnEnemies, callbackScope: this, loop: true });

        // 타이머 업데이트
        this.time.addEvent({ delay: 1000, callback: this.updateTimer, callbackScope: this, loop: true });

        // 충돌 감지 설정
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

        // 적들이 플레이어를 쫓아오도록 설정
        this.enemies.getChildren().forEach(enemy => {
            if (enemy.followPlayer) {
                const direction = new Phaser.Math.Vector2(this.player.x - enemy.x, this.player.y - enemy.y);
                direction.normalize();
                enemy.setVelocity(direction.x * 1.5, direction.y * 1.5);
            } else {
                // 자유롭게 돌아다니는 적들
                if (!enemy.moveTimer || enemy.moveTimer <= 0) {
                    enemy.moveDirection = new Phaser.Math.Vector2(Phaser.Math.Between(-1, 1), Phaser.Math.Between(-1, 1)).normalize();
                    enemy.moveTimer = Phaser.Math.Between(1000, 3000);
                } else {
                    enemy.moveTimer -= 16.67; // update는 약 60fps로 호출됨
                }
                enemy.setVelocity(enemy.moveDirection.x * 1, enemy.moveDirection.y * 1);
            }
        });
    }

    spawnEnemies() {
        const numEnemies = Phaser.Math.Between(3, 6); // 랜덤한 숫자(3~6) 적 생성
        const positions = [
            { x: 0, y: Phaser.Math.Between(0, 600) },
            { x: 800, y: Phaser.Math.Between(0, 600) },
            { x: Phaser.Math.Between(0, 800), y: 0 },
            { x: Phaser.Math.Between(0, 800), y: 600 },
        ];

        for (let i = 0; i < numEnemies; i++) {
            const pos = positions[Phaser.Math.Between(0, positions.length - 1)];
            const enemyKey = 'enemy' + Phaser.Math.Between(1, 5); // 랜덤한 적 이미지 선택
            const enemy = this.matter.add.sprite(pos.x, pos.y, enemyKey);
            enemy.setFixedRotation();
            enemy.followPlayer = Phaser.Math.Between(0, 1) === 0; // 랜덤하게 플레이어를 따라오도록 설정
            this.enemies.add(enemy);

            // 적이 생성된 후 1초 동안은 충돌하지 않도록 설정
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

                // 플레이어와 적의 충돌 감지
                if ((enemyA && !enemyA.getData('invulnerable')) || (enemyB && !enemyB.getData('invulnerable'))) {
                    if (bodyA === this.player.body || bodyB === this.player.body) {
                        this.handlePlayerEnemyCollision();
                    }
                }

                // 플레이어와 목표 지점의 충돌 감지
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
                this.sendGameOverData('Game Over');
            });
        } else {
            this.invulnerable = true; // 플레이어를 2초 동안 무적 상태로 설정
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
            this.sendGameOverData('You Win');
        });
    }

    sendGameOverData(result) {
        // jQuery AJAX 요청 사용
        $.ajax({
            url: "/write.playRecord",
            type: "POST",
            data: {
                id: loginId, // 실제 로그인 ID로 변경
                game_seq: gameSeq, // 실제 게임 시퀀스로 변경
                score: this.score,
                playtime: this.timer,
                result: result
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
