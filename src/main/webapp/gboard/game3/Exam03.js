class Exam03 extends Phaser.Scene { // 신 타입
    constructor() { // 신에 사용할 변수나 함수를 초기화하는 곳
        super({ key: "Exam03" }); // 신 이름 , 화면 전환 시 사용 
        this.cnt = 0;
        this.boxes = [];
        this.frame = 0;
        this.timer = 0;
        this.score = 0;
    }

    init() {
        console.log("Exam03 init");
        this.timer = 0;
        this.cnt = 0;
        this.score = 0;
    }

    preload() { // 신에 사용될 자원 로딩(이미지, 음악, 영상) 램에 적재하기
        console.log("Exam03 preload");
        this.load.image('background', '/gboard/game3/back.jpg');
        this.load.image('ice', '/gboard/game3/ice.png');
        this.load.image('star', '/gboard/game3/star.png');
        this.load.spritesheet('cuby', '/gboard/game3/cuby.png', { frameWidth: 59, frameHeight: 60 });
    }

    create() { // 자원을 바탕으로 인스턴스 생성, 신에 나타남
        console.log("Exam03 create");
        this.cameras.main.setBackgroundColor("#ffffff");

        // 애니메이션 만들기
        this.anims.create({
            key: "run",
            frames: this.anims.generateFrameNumbers('cuby', { start: 10, end: 19 }),
            frameRate: 10,
            repeat: -1
        });

        this.anims.create({
            key: "jump",
            frames: this.anims.generateFrameNumbers('cuby', { frames: [12, 13, 14, 15, 16, 17] }),
            frameRate: 5, // 속도
            repeat: -1
        });

        // 배경 흐르게 하기
        this.background = this.add.tileSprite(0, 0, this.cameras.main.width, this.cameras.main.height, 'background');
        this.background.setOrigin(0, 0);

        // 아래 바운더리(x, y, 넓이, 높이)
        let floor = this.add.rectangle(0, 500, this.cameras.main.width, 5, 0x000000); // x 좌표는 물체의 가운데 
        floor.setOrigin(0, 0); // 맞추기
        this.physics.add.existing(floor, true); // immovable 상태로 만들기: 생성과 동시에 true: 안 움직이게 해준다 // 도형은 신에 추가하고 나서 물리 체계에 추가해야 한다.

        // 주인공
        this.player = this.physics.add.sprite(50, 400, 'cuby'); // 주인공 캐릭터
        this.player.setScale(1.3);
        this.player.anims.play({ key: "run" });
        this.player.setData("onFloor", true);
        this.player.setGravity(0, 1000);

        // 충돌 만들기 floor 에는 this 가 없다... 왜?
        this.physics.add.collider(this.player, floor, (player, floor) => {
            player.setData("onFloor", true);
        });

        // 커서
        this.cursor = this.input.keyboard.createCursorKeys();

        // 왼쪽 바운더리 만나면 없애기
        let leftBound = this.add.rectangle(0, 0, -10, this.cameras.main.height, 0x000000);  // x 좌표는 물체의 가운데 
        leftBound.setOrigin(0, 0); // 맞추기
        this.physics.add.existing(leftBound, true); // 생성과 동시에 true: 안 움직이게 해준다 // 도형은 신에 추가하고 나서 물리 체계에 추가해야 한다.
        this.physics.add.collider(this.boxes, leftBound, (box, bound) => { // arrow function 글로벌 변수가 이벤트 주체 콜백 함수 이벤트 주체가 this
            box.destroy();
            this.boxes.splice(this.boxes.indexOf(box), 1); // 배열에서도 제거해줘야 한다.
            this.score += 50; // 점수 추가
            this.scoreText.setText('Score: ' + this.score);
        });

        // 돌과 충돌할 시 씬 변경하기
        this.physics.add.collider(this.player, this.boxes, (player, boxes) => {
				  $.ajax({
	                 url : "/write.playrecord",
	                 data : {
	                 game_seq : 3,
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
	            this.scene.start("GameOver3");
	     });

        // 바닥과 star 가 충돌하도록 설정
        this.physics.add.collider(floor, this.boxes, (floor, box) => {
            if (box.texture.key === 'star') {
                box.setBounce(1);
                box.setVelocityY(-450); // 바닥에 닿을 때마다 위로 튕기기
            }
        });

        // 타이머 텍스트 설정
        this.timerText = this.add.text(this.cameras.main.width - 150, 5, 'Time: 0', {
            fontSize: '20px',
            fill: "#ff0000"
        });

        // 점수 텍스트 설정
        this.scoreText = this.add.text(this.cameras.main.width - 300, 5, 'Score: 0', {
            fontSize: '20px',
            fill: "#ff0000"
        });
    }

    update() { // 무한 루프를 반복하며 게임 내용 채우는 곳(기본 60 FPS)
        this.frame++;
        
        this.background.tilePositionX += 2;

        // 키 입력을 한번만 감지(누르고 있는 행동은 무시한다)
        if (Phaser.Input.Keyboard.JustDown(this.cursor.space)) {
            this.cnt++;
            if (this.cnt <= 2) {
                this.player.play("jump");
                this.player.setVelocityY(-500);
                this.player.setData("onFloor", false);
            }
        }

        if (this.player.getData("onFloor") && this.player.anims.currentAnim.key != "run") { // 런이 아니고 바닥과 충돌했을 때
            this.cnt = 0;
            this.player.play("run");
        }

        // ice 추가
        if (this.frame % 200 == 0) {
            let ice = this.physics.add.sprite(800, 465, 'ice');
            ice.setScale(150 / 512);
            ice.setBodySize(130, 130);
            ice.setVelocityX(-(Math.random() * (200 - 100 + 1) + 100));
            this.boxes.push(ice);
        }

        // star 추가
        if (this.frame % 900 == 0) {
            let star = this.physics.add.sprite(800, 300, 'star');
            star.setGravity(0, 350);
            star.setScale(100 / 512);
            star.setBodySize(50, 50);
            star.setVelocityX(-(Math.random() * (200 - 100 + 1) + 100));
            this.boxes.push(star);
        }

        // 매 프레임마다 60을 나눠서 1 초를 계산
        if (this.frame % 60 == 0) {
            this.timer++;
            this.timerText.setText('Time: ' + this.timer);
        }
    }
 
}
