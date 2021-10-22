document.addEventListener("DOMContentLoaded", onReady)

import PlayerType from "./gameCanvas_Player.js"
import AnimationType from "./gameCanvas_Animation.js"

function onReady() {

    const aBoard = document.getElementById("idGame"),
        aCanvas = document.createElement("canvas");

    aCanvas.setAttribute("id", "idCanvas")
    aCanvas.style.display = "none"
    aCanvas.width = "640"
    aCanvas.height = "480"
    aBoard.appendChild(aCanvas)

    const aContext = aCanvas.getContext("2d"),
        aBackground = new PlayerType({nWidth: 640, nHeight: 480}),
        aPlayer = new PlayerType({
            x: 140,
            y: 200,
            nWidth: 90,
            nHeight: 170
        }),
        aEnemy = new PlayerType({
            x: 400,
            y: 200,
            nWidth: 90,
            nHeight: 170,
            bFlipH: true
        }),
        aAnimBackground = new AnimationType({
            strURL: "images/game_background.jpg",
            context: aContext
        }),
        aAnimStand = new AnimationType({
            strURL: "images/game_sprite.png",
            context: aContext,
            nRate: 100
        }),
        aAnimStandEnemy = new AnimationType({
            strURL: "images/game_sprite.png",
            context: aContext,
            nRate: 350
        });

    aAnimBackground.appendFrame(0, 0)

    aAnimStand.appendFrame(20, 2)
    aAnimStand.appendFrame(98, 2)
    aAnimStand.appendFrame(176, 2)
    aAnimStand.appendFrame(250, 2)
    aAnimStand.appendFrame(325, 2)
    aAnimStand.appendFrame(395, 2)
    aAnimStand.appendFrame(465, 2)
    aAnimStand.appendFrame(538, 2)
    aAnimStand.appendFrame(608, 2)

    aAnimStandEnemy.appendFrame(1073, 308)
    aAnimStandEnemy.appendFrame(1193, 308)
    aAnimStandEnemy.appendFrame(1323, 308)
    aAnimStandEnemy.appendFrame(1473, 308)
    aAnimStandEnemy.appendFrame(1623, 308)

    aBackground.setAnimation(aAnimBackground)
    aPlayer.setAnimation(aAnimStand)
    aEnemy.setAnimation(aAnimStandEnemy)

    function gameLoop() {
        aBackground.draw()
        aEnemy.draw()
        aPlayer.draw()

        requestAnimationFrame(gameLoop)
    }

    aCanvas.style.display = "block"
    requestAnimationFrame(gameLoop)
}
