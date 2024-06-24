class GameOver extends Phaser.Scene {
    constructor() {
        super({ key: "GameOver" });
    }

    init(data) {
        this.score = data.score; // 전달받은 score를 저장
    }

    preload() {

    }

    create() {
        this.cameras.main.setBackgroundColor("#87CEEB");

        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 60, "Game Over", {
            fontSize: "50px",
            fill: "#FF0000"
        }).setOrigin(0.5);


        let restartButton = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 60, "Restart", {
            fontSize: "35px",
            fill: "#FF0000"
        }).setOrigin(0.5).setInteractive();

        restartButton.on("pointerdown", () => {
            this.scene.start("Exam02");
        });

        restartButton.on("pointerover", () => {
            restartButton.setBackgroundColor("#0000FF");
            this.game.canvas.style.cursor = "pointer";
        });

        restartButton.on("pointerout", () => {
            restartButton.setBackgroundColor("#000000");
            this.game.canvas.style.cursor = "default";
        });
    }

    update() {

    }
}
