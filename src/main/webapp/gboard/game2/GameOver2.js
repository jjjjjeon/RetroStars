class GameOver2 extends Phaser.Scene{

    constructor(){
        super({key:"GameOver2"})
    }

    preload(){}

    create(){

        this.add.text(this.cameras.main.width/2,this.cameras.main.height/2-30,"Game Over",{
            fontSize:"50px",
            fill : "#FF0000"

        }).setOrigin(0.5);

        let restartButton = this.add.text(this.cameras.main.width/2,this.cameras.main.height/2+50,"Restart",{
            fontSize:"35px",
            fill : "#FF0000"

        }).setOrigin(0.5).setInteractive();

        restartButton.on("pointerover",()=>{
            restartButton.setBackgroundColor("#0000FF");
            this.game.canvas.style.cursor = "pointer";
        })

        restartButton.on("pointerout",()=>{
            restartButton.setBackgroundColor("#000000");
            this.game.canvas.style.cursor = "default";
        })

        restartButton.on("pointerdown",()=>{
            this.scene.start("Game");
        })
    }

    update(){}
}
