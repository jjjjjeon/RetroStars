class Game extends Phaser.Scene {
    constructor() {
        super({ key: "Game" });
        this.cursors;
        this.scoreText;
        this.livesText;
        this.timerEvent;
        this.time = 0;
        this.gameOver = false;
    }

    init(){
        this.bricks = null;
        this.score = 0;
        this.lives = 3;
        this.paddle;
        this.ball;
        this.gameOver = false;
        this.level = 1; // 레벨 추가
        this.timer = 0;
    }

    preload() {
        this.load.image('paddle', 'gboard/game2/paddle.png');
        this.load.image('ball', 'gboard/game2/ball.png');
        this.load.image('brick', 'gboard/game2/brick.png');
        this.load.image('background', 'gboard/game2/back.png');
    }

    create() {
        this.background = this.add.tileSprite(0, 0, 1080, 1080, 'background');
        this.background.setOrigin(0, 0);

        let scaleX = this.sys.game.config.width / this.background.width;
        let scaleY = this.sys.game.config.height / this.background.height;
        this.background.setScale(scaleX, scaleY);

        this.cameras.main.setBackgroundColor("#ffffff");

        // Initialize game objects
        this.createPaddle();
        this.createBall();
        this.createBricks();

        this.cursors = this.input.keyboard.createCursorKeys();

        this.scoreText = this.add.text(16, 16, 'Score: 0', { fontSize: '30px', fill: '#FFFFFF'});
        this.livesText = this.add.text(635, 16, 'Lives: 3', { fontSize: '30px', fill: '#FFFFFF'});
        // 타이머 출력
        //this.timerText = this.add.text(50,10,'0',{ fontSize:'32px',fill:'#FF0000' });

        this.startTimer();

        this.physics.world.setBoundsCollision(true, true, true, false);
    }

    update() {

        // this.frame++;
        // if(this.frame%60==0){
        //     this.timer++;
        //     this.timerText.setText(this.timer);
        // }
        

        if (this.cursors.left.isDown) {
            this.paddle.setVelocityX(-500);
        } else if (this.cursors.right.isDown) {
            this.paddle.setVelocityX(500);
        } else {
            this.paddle.setVelocityX(0);
        }

        if (this.ball.y > this.cameras.main.height) {
            this.loseLife();
        }
    }

    createPaddle() {
        this.paddle = this.physics.add.image(400, 550, 'paddle').setImmovable();
        this.paddle.body.allowGravity = false;
        this.paddle.setCollideWorldBounds(true);
    }

    createBall() {
        this.ball = this.physics.add.image(400, 530, 'ball');
        this.ball.setCollideWorldBounds(true);
        this.ball.setBounce(1);
        this.ball.setVelocity(250, -250);

        this.physics.add.collider(this.ball, this.paddle, this.hitPaddle, null, this);
        this.ball.setScale(20 / 77);
        this.paddle.setScale(100 / 329);
    }

    createBricks() {
        const patterns = [
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
            [1, 1, 0, 0, 1, 1, 0, 0, 1, 1],
            [1, 1, 1, 0, 0, 0, 1, 1, 1, 0],
            [1, 0, 0, 1, 1, 1, 0, 0, 1, 1]
        ];

        let pattern = patterns[this.level % patterns.length];

        // Initialize bricks group
        if (this.bricks) {
            this.bricks.clear(true, true);
        }
        this.bricks = this.physics.add.staticGroup();

        // Create bricks
        let scale = 0.6;
        let originalWidth = 126;
        let originalHeight = 51;
        let imageScaleRatio = scale;

        for (let i = 0; i < 5; i++) {
            for (let j = 0; j < 10; j++) {
                if (pattern[j] === 1) {
                    let brickX = 60 + j * 70;
                    let brickY = 100 + i * 35;
                    let brick = this.bricks.create(brickX, brickY, 'brick').setImmovable();

                    brick.setScale(imageScaleRatio);
                    let offsetX = (originalWidth - (originalWidth * imageScaleRatio)) / 2;
                    let offsetY = (originalHeight - (originalHeight * imageScaleRatio)) / 2;
                    brick.setSize(originalWidth * imageScaleRatio, originalHeight * imageScaleRatio);
                    brick.setOffset(offsetX, offsetY);
                }
            }
        }

        // Add collider
        this.physics.add.collider(this.ball, this.bricks, this.hitBrick, null, this);
    }

    hitPaddle(ball, paddle) {

        let diff = Math.abs(ball.x - paddle.x);
        ball.setVelocityX(5 * diff);

        // let ballPosition = ball.x;
        // let paddlePosition = paddle.x;
        // let angle = (ballPosition - paddlePosition) / (paddle.width / 2);

        // // Adjust bounce based on angle
        // ball.setVelocityX(200 * angle);

        // // If the ball is moving vertically (downwards), reverse its vertical direction
        // if (ball.body.velocity.y > 0) {
        //     ball.setVelocityY(-ball.body.velocity.y);
        // }

    }

    hitBrick(ball, brick) {
        brick.disableBody(true, true);
        this.score += 10;
        this.scoreText.setText('Score: ' + this.score);

        if (this.bricks.countActive() === 0) {
            this.levelUp();
        }
    }

    loseLife() {
        this.lives--;
        this.livesText.setText('Lives: ' + this.lives);

        if (this.lives === 0) {
            this.gameOver = true;
            
            if (this.gameOver) {
	             $.ajax({
                 url : "/write.playrecord",
                 data : {
                 id :  loginId,
                 gameSeq : gameSeq,
                 score : this.score,
                 playtime : this.timer
                 }
             }).done(function(resp){
                 if(resp == "success"){
                     console.log("게임 플레이 기록 전송 성공!");
                 }else{
                     console.log("게임 플레이 기록 전송 실패!");
                 }
             });
            return;
        }
        
            this.scoreText.setText('Game Over! Final Score: ' + this.score);
            this.scene.start("GameOver");
            
            
            //this.physics.pause();
        } else {
            this.resetBall();
        }
    }

    resetBall() {
        this.ball.setPosition(400, 530);
        this.ball.setVelocity(250, -250);
        this.paddle.setPosition(400, 550);
    }

    levelUp() {
        this.score += 500;
        this.scoreText.setText('Score: ' + this.score);
        this.level += 1;

        // Clear bricks group
        this.bricks.clear(true, true);

        // Create new set of bricks
        this.createBricks();

        // Reset ball and paddle
        this.resetBall();

    }

    startTimer() {
        this.timerEvent = this.time.addEvent({
            delay: 1000, // 1초마다
            callback: this.updateTimer,
            callbackScope: this,
            loop: true
        });
    }

    updateTimer() {
        this.timer++;
       // this.timerText.setText(this.timer);
    }
}
