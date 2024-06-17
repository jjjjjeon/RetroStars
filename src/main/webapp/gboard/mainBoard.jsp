<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${game.gameTitle} - Steam</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <style>
        body {
            font-family: 'Georgia', serif;
            background-image: url('/image/background.png');
            background-position: center;
            background-size: 100% 100%;
            color: white;
            margin-bottom: 120px;
        }
        nav {
            background-color: #323232;
        }
        .footer {
            width: 100%;
            height: 120px;
            background-color: #323232;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .leftfooter {
            color: white;
            font-weight: bold;
            margin-top: 20px;
        }
        .rightfooter {
            display: flex;
            align-items: center;
        }
        .footerbox {
            width: 1000px;
            height: 100%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .iconbox {
            display: flex;
            align-items: center;
        }
        .iconbox a {
            margin: 0 10px;
            font-size: 50px;
            color: white;
        }
        .coinbox {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .coinbox img {
            width: 120px;
            height: 100px;
            margin-left: 20px;
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
        .community-button .gameBtn {
            background-color: #6fa720;
        }
        #gameBtn {
            background-color: #6fa720;
        }
        .main-content {
            display: flex;
            gap: 20px;
        }
        .review-content {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }
        .media-section {
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
        .media-container {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%;
            background-color: #000;
            margin-bottom: 20px;
        }
        .media-container iframe, .media-container img, .media-container video {
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
        .media-thumbnails .thumbnail {
            width: 100px;
            height: 56px;
            cursor: pointer;
            border: 2px solid transparent;
            object-fit: cover;
        }
        .media-thumbnails .thumbnail.active {
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">ICON</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게임
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">game1</a></li>
                            <li><a class="dropdown-item" href="#">game2</a></li>
                            <li><a class="dropdown-item" href="#">game3</a></li>
                            <li><a class="dropdown-item" href="#">game4</a></li>
                            <li><a class="dropdown-item" href="#">game5</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="#">자유게시판</a></li>
                            <li><a class="dropdown-item" href="#">공략게시판</a></li>
                            <li><a class="dropdown-item" href="#">QA게시판</a></li>
                            <li><a class="dropdown-item" href="#">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="#">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/member/login/login.jsp">로그인</a>
                    </li>

                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-user"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="nav-menu">
            <div class="game-title">${game.gameTitle}</div>
            <a href="/cboard/mainBoard.jsp" class="community-button">커뮤니티 허브</a>
        </div>
        <div class="main-content">
            <div class="media-section">
                <div class="media-container" id="media-container">
                    <c:choose>
                        <c:when test="${not empty videoUrl}">
                            <video src="${videoUrl}" controls autoplay muted></video>
                        </c:when>
                        <c:otherwise>
                            <img src="/image/default_image.jpg" alt="Game Image" id="main-media">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="media-thumbnails">
                    <c:forEach var="image" items="${images}">
                        <img src="${image}" alt="Thumbnail" class="thumbnail" data-type="image" data-media="${image}">
                    </c:forEach>
                    <c:if test="${not empty videoUrl}">
                        <video src="${videoUrl}" alt="Thumbnail Video" class="thumbnail" data-type="video" data-media="${videoUrl}"></video>
                    </c:if>
                </div>
            </div>
            <div class="description-section">
                <div class="media-container">
                    <img src="/image/hollow.jpg" alt="Game Description Image">
                </div>
                <p>${game.gameDesc}</p>
                <p>RELEASE DATE: <fmt:formatDate value="${game.releaseDate}" pattern="dd MMM, yyyy"/></p>
                <p>DEVELOPER: ${game.developer}</p>
                <div class="buttons">
                    <button class="btn community-button">찜하기</button>
                    <button class="btn community-button">팔로우</button>
                    <button class="btn community-button gameBtn" id="gameBtn">게임하기</button>
                </div>
            </div>
        </div>
        <div class="review-content">
            <div class="media-section">
                가장 평가가 많은 리뷰
            </div>
            <div class="description-section">
                <p>가장 최근에 게시된 리뷰</p>
                <p>RELEASE DATE: 14 June, 2024</p>
                <p>DEVELOPER: 팀 별빛</p>
                <p>PUBLISHER: 팀 별빛</p>
                <p>게임 장르: 무료 플레이, 픽셀 그래픽, RPG, 인디, 어드벤처</p>
                <div class="buttons">
                    <button class="btn community-button">찜하기</button>
                    <button class="btn community-button">팔로우</button>
                    <button class="btn community-button gameBtn" id="gameBtn">게임하기</button>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footerbox">
                <div class="leftfooter">
                    <p>회사명: 팀별빛</p>
                    <p>전화: 02-1234-5678</p>
                    <p>이메일: info@example.com</p>
                </div>
                <div class="rightfooter">
                    <div class="iconbox">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                    <div class="coinbox">
                        <img src="/image/coin.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.querySelectorAll('.thumbnail').forEach(thumbnail => {
            thumbnail.addEventListener('click', function() {
                document.querySelector('.thumbnail.active').classList.remove('active');
                this.classList.add('active');

                let mediaContainer = document.getElementById('media-container');
                mediaContainer.innerHTML = '';

                let mediaType = this.getAttribute('data-type');
                let mediaSrc = this.getAttribute('data-media');

                if (mediaType === 'image') {
                    let img = document.createElement('img');
                    img.src = mediaSrc;
                    img.alt = 'Game Image';
                    mediaContainer.appendChild(img);
                } else if (mediaType === 'video') {
                    let video = document.createElement('video');
                    video.src = mediaSrc;
                    video.controls = true;
                    video.autoplay = true;
                    mediaContainer.appendChild(video);
                }
            });
        });
    </script>
</body>
</html>
