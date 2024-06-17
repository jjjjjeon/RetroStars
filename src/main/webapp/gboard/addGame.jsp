<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게임 추가</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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
        .form-section {
            background-color: rgba(50, 71, 94, 0.8);
            padding: 20px;
            border: 1px solid #3a4b58;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-section label {
            color: white;
        }
        .form-section .btn {
            margin-top: 10px;
        }
        
       .gameBtn {
            background-color: #6fa720;
        }
    </style>
    <script>
        $(document).ready(function() {
            let imageIndex = 0;
            let videoIndex = 0;

            $('#addImage').click(function() {
                imageIndex++;
                $('#imageInputs').append(`
                    <div class="mb-3" id="imageGroup${imageIndex}">
                        <label for="gameImages${imageIndex}" class="form-label">게임 이미지 ${imageIndex + 1}</label>
                        <input type="file" class="form-control" id="gameImages${imageIndex}" name="gameImages" multiple required>
                        <button type="button" class="btn gameBtn" onclick="removeImage(${imageIndex})">삭제</button>
                    </div>
                `);
            });

            $('#addVideo').click(function() {
                videoIndex++;
                $('#videoInputs').append(`
                    <div class="mb-3" id="videoGroup${videoIndex}">
                        <label for="gameVideos${videoIndex}" class="form-label">게임 비디오 ${videoIndex + 1}</label>
                        <input type="file" class="form-control" id="gameVideos${videoIndex}" name="gameVideos" required>
                        <button type="button" class="btn gameBtn" onclick="removeVideo(${videoIndex})">삭제</button>
                    </div>
                `);
            });
        });

        function removeImage(index) {
            $('#imageGroup' + index).remove();
        }

        function removeVideo(index) {
            $('#videoGroup' + index).remove();
        }
    </script>
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
    <div class="form-section">
        <h1>게임 추가</h1>
        <form action="/addGame.game" method="post" enctype="multipart/form-data">
            <div>
                <label for="gameTitle" class="form-label">게임 제목</label>
                <input type="text" class="form-control" id="gameTitle" name="gameTitle" required>
            </div>
            <div>
                <label for="gameDesc" class="form-label">게임 설명</label>
                <textarea class="form-control" id="gameDesc" name="gameDesc" rows="3" required></textarea>
            </div>
            <div>
                <label for="developer" class="form-label">개발자</label>
                <input type="text" class="form-control" id="developer" name="developer" required>
            </div>
            <div id="imageInputs">
                <div>
                    <label for="gameImages" class="form-label">게임 이미지</label>
                    <input type="file" class="form-control" id="gameImages" name="gameImages" multiple required>
                </div>
            </div>
            <button type="button" id="addImage" class="btn gameBtn">이미지 추가</button>
            <div id="videoInputs">
                <div>
                    <label for="gameVideo" class="form-label">게임 비디오</label>
                    <input type="file" class="form-control" id="gameVideo" name="gameVideos" required>
                </div>
            </div>
            <button type="button" id="addVideo" class="btn gameBtn">비디오 추가</button>
            <button type="submit" class="btn gameBtn">게임 추가</button>
        </form>
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
</body>
</html>
