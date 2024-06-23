class GameOver extends Phaser.Scene{

    constructor(){
        super({key:"GameOver"});

    }
    preload(){

    }

    create(){
        this.add.text(this.cameras.main.width/2,this.cameras.main.height/2-30,"Game Over", {
            fontSize:"50px",
            fill:"#ff0000"
        }).setOrigin(0.5);

        let restartButton=this.add.text(this.cameras.main.width/2,this.cameras.main.height/2+50,"Restart", {
            fontSize:"25px",
            fill:"#ff0000"
        }).setOrigin(0.5).setInteractive();

        restartButton.on("pointerdown",()=>{
            this.scene.start("Exam03");
        })

        restartButton.on("pointerover",()=>{
            restartButton.setBackgroundColor("#0000ff");
            this.game.canvas.style.cursor="pointer";
        })

        restartButton.on("pointerout",()=>{
            restartButton.setBackgroundColor("#000000");
            this.game.canvas.style.cursor="default";
        })


    }

    update(){

    }
}