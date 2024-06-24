class Exam02 extends Phaser.Scene {
    constructor() {
        super({ key: "Exam02" });
        this.boxes = [];
        this.frame = 0;
        this.timer = 0;
        this.score=0;
    }

    init() {
        // scene이 start될 때마다 실행되는 함수
        // scene이 시작될 때 또는 다시 시작될 때 초기화 시켜주는 작업
        this.timer = 0;
        this.score=0;
    }

    preload() {
        this.load.image('player', '/gboard/game4/졸라맨.webp');
        this.load.image('box', '/gboard/game4/똥.png');
        this.load.image('background', '/gboard/game4/변기.png');
    }

    create() {
        this.cameras.main.setBackgroundColor("#ffffff");

        // 배경 이미지를 800x600 크기로 고정
        this.background = this.add.image(this.cameras.main.width / 2, this.cameras.main.height / 2, 'background');
        this.background.setDisplaySize(this.cameras.main.width, this.cameras.main.height);

        let bottomBoundary = this.add.rectangle(0, this.cameras.main.height + 30, this.cameras.main.width, 5, 0x000000);
        bottomBoundary.setOrigin(0, 0);

        let topBoundary = this.add.rectangle(0, -30, this.cameras.main.width, 5, 0x000000);
        topBoundary.setOrigin(0, 0);

        let leftBoundary = this.add.rectangle(-30, 0, 5, this.cameras.main.height, 0x000000);
        leftBoundary.setOrigin(0, 0);

        let rightBoundary = this.add.rectangle(this.cameras.main.width + 30, 0, 5, this.cameras.main.height, 0x000000);
        rightBoundary.setOrigin(0, 0);

        this.physics.add.existing(bottomBoundary, true);
        this.physics.add.collider(this.boxes, bottomBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.physics.add.existing(topBoundary, true);
        this.physics.add.collider(this.boxes, topBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.physics.add.existing(leftBoundary, true);
        this.physics.add.collider(this.boxes, leftBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.physics.add.existing(rightBoundary, true);
        this.physics.add.collider(this.boxes, rightBoundary, (box, boundary) => {
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1);
        });

        this.player = this.physics.add.sprite(this.cameras.main.width / 2, this.cameras.main.height / 2, 'player');
        this.player.setCollideWorldBounds(true);

        let playerScaleFactor = 35 / 512;
        this.player.setScale(playerScaleFactor);
        this.player.setSize(15 / playerScaleFactor, 15 / playerScaleFactor);

        this.physics.add.collider(this.boxes, this.player, (box, player) => {
			this.score = Math.floor(this.timer/10);
			
            	$.ajax({
					url:"/write.playrecord",
					data:{
//					id:loginId,
					gameSeq:4,
					score:this.score,
					playtime: this.timer
					}
				}).done(function(resp){
				if(resp=="success"){
					console.log("게임 플레이 기록 전송 성공!");
				} else{
					console.log("게임 플레이 기록 전송 실패!");
				}
				});
            	this.scene.start("GameOver",{score:this.score});
        });

        this.timerText = this.add.text(this.cameras.main.width - 50, 5, '0', {
            fontSize: '32px',
            fill: '#FF0000'
        });

        this.cursor = this.input.keyboard.createCursorKeys();
    }

    update() {
        this.frame++;

        if (this.frame % 60 == 0) { // 초 단위
            this.timer++;
            this.timerText.setText(this.timer);

            let box = this.physics.add.sprite(Math.random() * (480 - 20 + 1) + 20, 20, 'box');
            let boxScaleFactor = 70 / 512; // 더 큰 스케일로 조정
            box.setScale(boxScaleFactor);
            box.setSize(15 / boxScaleFactor, 15 / boxScaleFactor);
            box.setVelocityY(Math.random() * (200 - 100 + 1) + 100);
            this.boxes.push(box);
        }

        if (this.frame % 60 == 0 && Math.floor(this.timer) > 10) {
            let box = this.physics.add.sprite(Math.random() * (480 - 20 + 1) + 20, this.cameras.main.height, 'box');
            box.setVelocityY(-(Math.random() * (200 - 100 + 1) + 100));
            let boxScaleFactor = 70 / 512; // 더 큰 스케일로 조정
            box.setScale(boxScaleFactor);
            box.setSize(15 / boxScaleFactor, 15 / boxScaleFactor);
            this.boxes.push(box);
        }

        if (this.frame % 60 == 0 && Math.floor(this.timer) > 20) {
            let box = this.physics.add.sprite(this.cameras.main.height, Math.random() * (480 - 20 + 1) + 20, 'box');
            box.setVelocityX(-(Math.random() * (200 - 100 + 1) + 100));
            let boxScaleFactor = 70 / 512; // 더 큰 스케일로 조정
            box.setScale(boxScaleFactor);
            box.setSize(15 / boxScaleFactor, 15 / boxScaleFactor);
            this.boxes.push(box);
        }

        if (this.frame % 60 == 0 && Math.floor(this.timer) > 30) {
            let box = this.physics.add.sprite(0, Math.random() * (480 - 20 + 1) + 20, 'box');
            box.setVelocityX((Math.random() * (200 - 100 + 1) + 100));
            let boxScaleFactor = 70 / 512; // 더 큰 스케일로 조정
            box.setScale(boxScaleFactor);
            box.setSize(15 / boxScaleFactor, 15 / boxScaleFactor);
            this.boxes.push(box);
        }

        if (this.cursor.left.isDown) {
            this.player.setVelocityX(-200);
        } else if (this.cursor.right.isDown) {
            this.player.setVelocityX(200);
        } else {
            this.player.setVelocityX(0);
        }

        if (this.cursor.up.isDown) {
            this.player.setVelocityY(-200);
        } else if (this.cursor.down.isDown) {
            this.player.setVelocityY(200);
        } else {
            this.player.setVelocityY(0);
        }
        // 주기적으로 기록 전송
        if(this.timer%60 ===0){
			this.sendPlayRecord();
			
		}
    }

}
