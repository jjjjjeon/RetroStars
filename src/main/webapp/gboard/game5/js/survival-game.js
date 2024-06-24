import MainScene from "./MainScene.js";

const config = {
    width: 800,
    height: 600,
    backgroundColor: '#333333',
    type: Phaser.AUTO,
    parent: 'survival-game',
    scene: [MainScene],
    scale: {
        zoom: 2,
    },
    physics: {
        default: 'matter',
        matter: {
            debug: false, // 디버그 표시 제거
            gravity: { y: 0 },
        }
    }
}

new Phaser.Game(config);
