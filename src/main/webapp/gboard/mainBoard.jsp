<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Grimm's Hollow - Steam</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <style>
        body {
            background-color: #1b2=/838;
            color: #c7d5e0;
            font-family: 'Georgia', serif;
        }
        .container {
            margin: 20px auto;
            width: 90%;
            
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .nav-menu {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .nav-menu .game-title {
            font-size: 24px;
            font-weight: bold;
        }
        .community-button {
            background-color: #2a475e;
            color: #c7d5e0;
            border: 1px solid #3a4b58;
            border-radius: 5px;
            padding: 5px 10px;
            text-decoration: none;
        }
        .community-button:hover {
            background-color: #3a4b58;
        }
        .main-content {
            display: flex;
            gap: 20px;
        }
        .media-section{
            flex: 9;
            background-color: #2a475e;
            padding: 20px;
            border: 1px solid #3a4b58;
            border-radius: 5px;
        }
        
        .description-section {
            flex: 1;
            background-color: #2a475e;
            padding: 20px;
            border: 1px solid #3a4b58;
            border-radius: 5px;
        }
        
        .media-container{
            position: relative;
            width: 100%;
            padding-bottom: 56.25%; 
            background-color: #000;
            margin-bottom: 20px;
        }
        

        .media-container iframe, .media-container img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .media-thumbnails {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .media-thumbnails img {
            width: 100px;
            height: 56px;
            cursor: pointer;
            border: 2px solid transparent;
        }
        .media-thumbnails img.active {
            border-color: #007bff;
        }
        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .buttons button {
            width: 100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav-menu">
            <div class="game-title">Grimm's Hollow</div>
            <a href="#" class="community-button">커뮤니티 허브</a>
        </div>
        <div class="main-content">
            <div class="media-section">
                <div class="media-container" id="media-container">
                    <img src=/image/male.png alt="Game Image" id="main-media">
                </div>
                <div class="media-thumbnails">
                    <img src="/image/male.png" alt="Thumbnail 1" class="thumbnail active" data-media="/image/male.png">
                    <img src="/image/female.png" alt="Thumbnail 2" class="thumbnail" data-media="/image/female.png">
                    <img src="/image/female.png" alt="Thumbnail 2" class="thumbnail" data-media="/image/female.png">
                    <img src="/image/male.png" alt="Thumbnail 4" class="thumbnail" data-media="/image/male.png">
                </div>
            </div>
            <div class="description-section">
                <div class="media-container">
                    <img src="/image/female.png" alt="Game Description Image">
                </div>
                <p>동생을 위해 사후 세계를 찾는 으스스한 프리웨어 RPG입니다. 죽음을 헤쳐나가는 여정에서 낫으로 유령을 처치하고, 유령이 나오는 동굴을 탐험하고, 유령이 주는 음식을 먹어보세요.
</p>
                <p>RELEASE DATE: 14 June, 2024</p>
                <p>DEVELOPER: 팀 별빛</p>
                <p>PUBLISHER: 팀 별빛</p>
                <p>게임 장르: 무료 플레이, 픽셀 그래픽, RPG, 인디, 어드벤처</p>
                <div class="buttons">
                    <button class="btn">찜하기</button>
                    <button class="btn">팔로우</button>
                    <button class="btn">게임하기</button>
                </div>
            </div>
        </div>
        <div class="footer">
        </div>
    </div>
    <script>
        document.querySelectorAll('.thumbnail').forEach(thumbnail => {
            thumbnail.addEventListener('click', function() {
                document.querySelector('.thumbnail.active').classList.remove('active');
                this.classList.add('active');
                if(document.getElementsByTagName('img')){
                	console.log("사진 확인1");
                	document.getElementById('main-media').src = this.getAttribute('data-media');
                }else if(document.getElementsByTagName('video')){
                	console.log("비디오 확인")
                	let myDiv = document.getElementById("main-media");
                	let parent = myDiv.parentElement;
                	parent.removeChild(myDiv)
                	$("<video>").src = this.getAttribute('data-media');

                	
                }
                
            });
        });
    </script>
</body>
</html>
