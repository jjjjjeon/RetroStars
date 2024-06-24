class Intro extends Phaser.Scene {
    constructor() {
        super({ key: "Intro" });
    }

    preload() {
        // 필요한 이미지나 리소스를 여기에 로드할 수 있습니다.
    }

    create() {
        this.cameras.main.setBackgroundColor("#87CEEB");

        let titleText = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 30, "똥 피하기!", {
            fontSize: "50px",
            fill: "#000000",
            padding: { top: 10, bottom: 10 } // 패딩 추가
        }).setOrigin(0.5);

        let startButton = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 50, "Start Game", {
            fontSize: "35px",
            fill: "#000000",
            padding: { top: 10, bottom: 10 } // 패딩 추가
        }).setOrigin(0.5).setInteractive();

        startButton.on("pointerdown", () => {
            this.scene.start("Exam02");
        });

        startButton.on("pointerover", () => {
            startButton.setStyle({ fill: "#FF0000" });
            this.game.canvas.style.cursor = "pointer";
        });

        startButton.on("pointerout", () => {
            startButton.setStyle({ fill: "#000000" });
            this.game.canvas.style.cursor = "default";
        });
    }

    update() {

    }
}
