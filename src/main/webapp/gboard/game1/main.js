const GRID_SIZE = 4;
const TILE_SIZE = 75;
const GAP = 10;


class Main extends Phaser.Scene {
    constructor() {
        super({ key: "Main" });

        this.board = []
        this.score = 0;
        this.bestScore = 0;
        this.frame = 0;
        this.timer = 0;
        this.isGameOver = false;
		this.gameSeq = 1;
        this.boardContainer = null;
        this.scoreText = null;
        this.bestScoreText = null;
    }

    preload() {
    }

    create() {
        const headingText = this.add.text(15, 50, "2048", {
            font: "bold 64px san-serif",
            color: "#645f59"
        });
        headingText.setOrigin(0, 0.5)

        const scoreContainer = this.add.container(250, 50);
        const scoreBg = this.add.rectangle(0, 0, 150, 75, 0xbaac9f);
        const scoreHeading = this.add.text(0, -15, "SCORE", {
            font: "20px sans-serif",
            color: "#e8dacd"
        });
        scoreHeading.setOrigin(0.5, 0.5);
        this.scoreText = this.add.text(0, 15, this.score, {
            font: "bolder 32px sans-serif",
            color: "#ffffff"
        });
        this.scoreText.setOrigin(0.5, 0.5);
        scoreContainer.add([scoreBg, scoreHeading, this.scoreText]);

        const bestScoreContainer = this.add.container(410, 50);
        const bestScoreBg = this.add.rectangle(0, 0, 150, 75, 0xbaac9f);
        const bestScoreHeading = this.add.text(0, -15, "Best Score", {
            font: "20px sans-serif",
            color: "#e8dacd"
        });
        bestScoreHeading.setOrigin(0.5, 0.5);
        this.bestScoreText = this.add.text(0, 15, this.bestScore, {
            font: "bolder 32px sans-serif",
            color: "#ffffff"
        });
        this.bestScoreText.setOrigin(0.5, 0.5);
        bestScoreContainer.add([bestScoreBg, bestScoreHeading, this.bestScoreText]);

        const newGameText = this.add.text(20, 120, "숫자 블럭을 합쳐 2048 타일을 만드세요!", {
            font: "bold 18px sans-serif",
            color: "#837c71"
        })
        newGameText.setOrigin(0, 0.5);

        const newGameButtonContainer = this.add.container(425, 120);
        const newGameButtonBg = this.add.rectangle(0, 0, 125, 50, 0x8e7968).setInteractive();
        const newGameButtonText = this.add.text(0, 0, "New Game", {
            font: "bold 18px sans-serif",
            color: "#ffffff"
        });
        newGameButtonText.setOrigin(0.5, 0.5);
        newGameButtonContainer.add([newGameButtonBg, newGameButtonText]);

        newGameButtonBg.on("pointerdown", () => {
            this.score = 0;
            this.frame = 0;
            this.timer = 0;
            this.board = [];
            this.isGameOver = false;
            this.scene.start("Main");
        });
        newGameButtonBg.on("pointerover", () => {
            newGameButtonContainer.setScale(1.1);

            this.game.canvas.style.cursor = "pointer";
        });
        newGameButtonBg.on("pointerout", () => {
            newGameButtonContainer.setScale(1);

            this.game.canvas.style.cursor = "default";
        });

        this.initBoard();

        this.boardContainer = this.add.container(this.game.config.width / 2, 340);
        const boardSize = (TILE_SIZE * GRID_SIZE) + GAP * (GRID_SIZE + 1);
        const boardBg = this.add.rectangle(0, 0, boardSize, boardSize, 0xbbada0);
        this.boardContainer.add(boardBg);

        for (let i = 0; i < GRID_SIZE; i++) {
            for (let j = 0; j < GRID_SIZE; j++) {
                const tileBg = this.add.rectangle(
                    j * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                    i * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                    TILE_SIZE,
                    TILE_SIZE,
                    0xcdc1b3
                );
                this.boardContainer.add(tileBg);
            }
        }

        this.createRandom2or4();
        this.updateBoard();

        const guideText = this.add.text(this.game.config.width / 2, 560, "게임방법 : 방향키로 타일을 움직이세요.\n같은 숫자를 가진 두 개의 타일이 만나면,\n하나의 타일로 합쳐지며 숫자가 더해집니다.", {
            font: "bold 18px sans-serif",
            color: "#837c71",
            align: "center"
        });
        guideText.setOrigin(0.5);
        guideText.setWordWrapWidth(460, true);

        // 방향키 조작
        let canPressKey = true;
        this.input.keyboard.on("keydown", (event) => {
            if (this.isGameOver || !canPressKey) {
                return;
            }

            const { keyCode } = event;
            switch (keyCode) {
                case 37:
                    this.moveLeft();
                    break;
                case 38:
                    this.moveUp();
                    break;
                case 39:
                    this.moveRight();
                    break;
                case 40:
                    this.moveDown();
                    break;
            }

            if (keyCode >= 37 && keyCode <= 40) {
                canPressKey = false;
                this.time.addEvent({
                    delay: 100,
                    callback: () => {
                        canPressKey = true;
                        this.createRandom2or4();
                        this.updateBoard();
                    },
                    callbackScope: this
                });
            }
        });
    }

    initBoard() {
        for (let i = 0; i < GRID_SIZE; i++) {
            this.board[i] = [];
            for (let j = 0; j < GRID_SIZE; j++) {
                this.board[i][j] = 0;
            }
        }
    }

    createRandom2or4() {
        const emptyTiles = [];
        for (let i = 0; i < GRID_SIZE; i++) {
            for (let j = 0; j < GRID_SIZE; j++) {
                if (this.board[i][j] === 0) {
                    emptyTiles.push({
                        x: i,
                        y: j
                    });
                }
            }
        }

        if (emptyTiles.length === 0) {
            this.add.text(this.game.config.width / 2, 250, "Game Over!", {
                font: "bold 32px sans-serif",
                color: "black"
            }).setOrigin(0.5);
            this.isGameOver = true;

            if (this.score == this.bestScore){
                this.add.text(this.game.config.width / 2, 350, "Congratulations! \nYou got the Best Score!", {
                    font: "bold 28px sans-serif",
                    color: "black",
                    align : "center"
                }).setOrigin(0.5);
            }


             $.ajax({
                 url : "/write.playrecord",
                 data : {               
                 gameSeq : this.gameSeq,
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
        const chosenTile = Phaser.Utils.Array.GetRandom(emptyTiles);
        this.board[chosenTile.x][chosenTile.y] = Phaser.Math.Between(1, 2) * 2;

    }

    getBackgroundColor(value) {
        switch (value) {
            case 2:
                return 0xeee4da;
            case 4:
                return 0xede0c8;
            case 8:
                return 0xf2b179;
            case 16:
                return 0xf59563;
            case 32:
                return 0xf67c5f;
            case 64:
                return 0xf65e3b;
            case 128:
                return 0xedcf72;
            case 256:
                return 0xedcc61;
            case 512:
                return 0xedc850;
            case 1024:
                return 0xedc53f;
            case 2048:
                return 0xedc22e;
            default:
                return 0xff0000;
        }
    }

    getTextColor(value) {
        if (value <= 4) {
            return "#776e65";
        }
        return "#f9f6f2";
    }

    createTile(i, j) {
        const tileContainer = this.add.container(
            j * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
            i * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5)
        );
        const tileBg = this.add.rectangle(0, 0, TILE_SIZE, TILE_SIZE, this.getBackgroundColor(this.board[i][j]));
        const tileText = this.add.text(0, 0, this.board[i][j], {
            font: "bold 28px sans-serif",
            color: this.getTextColor(this.board[i][j])
        });
        tileText.setOrigin(0.5, 0.5);
        tileContainer.add([tileBg, tileText]);
        tileContainer.setName(`tile-${i}-${j}`);
        this.boardContainer.add(tileContainer);

        return tileContainer;
    }

    waitPromise(time) {
        return new Promise((resolve) => {
            this.time.addEvent({
                delay: time,
                callback: () => {
                    resolve();
                },
                callbackScope: this
            });
        });
    }

    moveLeft() {
        for (let i = 0; i < GRID_SIZE; i++) {
            for (let j = 1; j < GRID_SIZE; j++) {
                if (this.board[i][j] !== 0) {
                    let currentPlace = j;
                    for (let k = j - 1; k >= 0; k--) {
                        if (this.board[i][k] === 0) {
                            this.board[i][k] = this.board[i][currentPlace];
                            this.board[i][currentPlace] = 0;

                            const tile = this.boardContainer.getByName(`tile-${i}-${currentPlace}`);
                            tile.setName(`tile-${i}-${k}`);
                            this.tweens.add({
                                targets: tile,
                                x: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut"
                            });

                            currentPlace = k;
                        } else if (this.board[i][k] === this.board[i][currentPlace]) {
                            this.board[i][k] *= 2;
                            this.board[i][currentPlace] = 0;

                            const tile = this.boardContainer.getByName(`tile-${i}-${currentPlace}`);
                            const tile2 = this.boardContainer.getByName(`tile-${i}-${k}`);
                            tile2.destroy();
                            this.boardContainer.remove(tile2);
                            tile.setName(`tile-${i}-${k}`);

                            this.tweens.add({
                                targets: tile,
                                x: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut",
                                onComplete: () => {
                                    if (!tile || (tile && !tile.active)) return;
                                    tile.getAt(0).setFillStyle(this.getBackgroundColor(this.board[i][k]));
                                    tile.getAt(1).setText(this.board[i][k]);
                                    tile.getAt(1).setColor(this.getTextColor(this.board[i][k]));
                                }
                            });
                            break;
                        }
                    }
                }
            }
        }
    }

    moveRight() {
        for (let i = 0; i < GRID_SIZE; i++) {
            for (let j = GRID_SIZE - 2; j >= 0; j--) {
                if (this.board[i][j] !== 0) {
                    let currentPlace = j;
                    for (let k = j + 1; k < GRID_SIZE; k++) {
                        if (this.board[i][k] === 0) {
                            this.board[i][k] = this.board[i][currentPlace];
                            this.board[i][currentPlace] = 0;

                            const tile = this.boardContainer.getByName(`tile-${i}-${currentPlace}`);
                            tile.setName(`tile-${i}-${k}`);
                            this.tweens.add({
                                targets: tile,
                                x: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut"
                            });

                            currentPlace = k;
                        } else if (this.board[i][k] === this.board[i][currentPlace]) {
                            this.board[i][k] *= 2;
                            this.board[i][currentPlace] = 0;

                            const tile = this.boardContainer.getByName(`tile-${i}-${currentPlace}`);
                            const tile2 = this.boardContainer.getByName(`tile-${i}-${k}`);
                            tile2.destroy();
                            this.boardContainer.remove(tile2);
                            tile.setName(`tile-${i}-${k}`);

                            this.tweens.add({
                                targets: tile,
                                x: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut",
                                onComplete: () => {
                                    if (!tile || (tile && !tile.active)) return;
                                    tile.getAt(0).setFillStyle(this.getBackgroundColor(this.board[i][k]));
                                    tile.getAt(1).setText(this.board[i][k]);
                                    tile.getAt(1).setColor(this.getTextColor(this.board[i][k]));
                                }
                            });
                            break;
                        }
                    }
                }
            }
        }
    }

    moveUp() {
        for (let j = 0; j < GRID_SIZE; j++) {
            for (let i = 1; i < GRID_SIZE; i++) {
                if (this.board[i][j] !== 0) {
                    let currentPlace = i;
                    for (let k = i - 1; k >= 0; k--) {
                        if (currentPlace - 1 !== k) {
                            break;
                        }

                        if (this.board[k][j] === 0) {
                            this.board[k][j] = this.board[currentPlace][j];
                            this.board[currentPlace][j] = 0;

                            const tile = this.boardContainer.getByName(`tile-${currentPlace}-${j}`);
                            tile.setName(`tile-${k}-${j}`);
                            this.tweens.add({
                                targets: tile,
                                y: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut"
                            });

                            currentPlace = k;

                        } else if (this.board[k][j] === this.board[currentPlace][j]) {
                            this.board[k][j] *= 2;
                            this.board[currentPlace][j] = 0;

                            const tile = this.boardContainer.getByName(`tile-${currentPlace}-${j}`);
                            const tile2 = this.boardContainer.getByName(`tile-${k}-${j}`);
                            tile2.destroy();
                            this.boardContainer.remove(tile2);
                            tile.setName(`tile-${k}-${j}`);

                            this.tweens.add({
                                targets: tile,
                                y: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut",
                                onComplete: () => {
                                    if (!tile || (tile && !tile.active)) return;
                                    tile.getAt(0).setFillStyle(this.getBackgroundColor(this.board[k][j]));
                                    tile.getAt(1).setText(this.board[k][j]);
                                    tile.getAt(1).setColor(this.getTextColor(this.board[k][j]));
                                }
                            });
                            break;
                        }
                    }
                }
            }
        }
    }

    moveDown() {
        for (let j = 0; j < GRID_SIZE; j++) {
            for (let i = GRID_SIZE - 2; i >= 0; i--) {
                if (this.board[i][j] !== 0) {
                    let currentPlace = i;
                    for (let k = i + 1; k < GRID_SIZE; k++) {
                        if (this.board[k][j] === 0) {
                            this.board[k][j] = this.board[currentPlace][j];
                            this.board[currentPlace][j] = 0;

                            const tile = this.boardContainer.getByName(`tile-${currentPlace}-${j}`);
                            tile.setName(`tile-${k}-${j}`);
                            this.tweens.add({
                                targets: tile,
                                y: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut"
                            });

                            currentPlace = k;
                        } else if (this.board[k][j] === this.board[currentPlace][j]) {
                            this.board[k][j] *= 2;
                            this.board[currentPlace][j] = 0;

                            const tile = this.boardContainer.getByName(`tile-${currentPlace}-${j}`);
                            const tile2 = this.boardContainer.getByName(`tile-${k}-${j}`);
                            tile2.destroy();
                            this.boardContainer.remove(tile2);
                            tile.setName(`tile-${k}-${j}`);

                            this.tweens.add({
                                targets: tile,
                                y: k * (TILE_SIZE + GAP) + TILE_SIZE / 2 - (TILE_SIZE * GRID_SIZE / 2 + GAP * 1.5),
                                duration: 50,
                                ease: "Cubic.easeOut",
                                onComplete: () => {
                                    if (!tile || (tile && !tile.active)) return;
                                    tile.getAt(0).setFillStyle(this.getBackgroundColor(this.board[k][j]));
                                    tile.getAt(1).setText(this.board[k][j]);
                                    tile.getAt(1).setColor(this.getTextColor(this.board[k][j]));
                                }
                            });
                            break;
                        }
                    }
                }
            }
        }
    }

    updateBoard() {
        for (let i = 0; i < GRID_SIZE; i++) {
            for (let j = 0; j < GRID_SIZE; j++) {
                if (this.board[i][j] !== 0) {
                    const tile = this.boardContainer.getByName(`tile-${i}-${j}`);
                    if (!tile) {
                        const tileContainer = this.createTile(i, j);
                        tileContainer.setScale(0.5);

                        this.tweens.add({
                            targets: tileContainer,
                            scale: 1,
                            duration: 100,
                            ease: "Cubic.easeOut"
                        })
                    }
                }
            }
        }


        this.updateScore();
    }

    updateScore() {
        let score = 0;
        for (let i = 0; i < GRID_SIZE; i++) {
            for (let j = 0; j < GRID_SIZE; j++) {
                score += this.board[i][j];
            }
        }
        this.score = score;

        if (this.score > this.bestScore) {
            this.bestScore = this.score;
        }

        this.scoreText.setText(this.score);
        this.bestScoreText.setText(this.bestScore);
    }

    update() {
        this.frame++;

        if (this.frame % 60 == 0) {
            this.timer++;
        }
    }
   
	
			
		
	

    
//                 $.ajax({
//                 url : "/write.playRecord",
//                 data : {
//                 id : ${loginId},
//                 game_seq : ${gameSeq},
//                 score : this.score,
//                 playtime : this.timer
//                 }
//             }).done(function(resp){
//                 if(resp == "success"){
//                     console.log("게임 플레이 기록 전송 성공!");
//                 }else{
//                     console.log("게임 플레이 기록 전송 실패!");
//                 }
//             });

}



