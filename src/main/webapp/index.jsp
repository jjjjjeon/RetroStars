
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
        integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">
       <style>
        * {
            box-sizing: border-box;
        }


        body {
            background-color: black;
            margin-bottom:0;
            padding:0;
        }

	.video-background{
		position : fixed;
		top : 0;
		left : 0;
		min-width : 100%;
		min-height : 100%;
		width: auto;
		height : auto;
		z-index: -1;
	}
    .navbar {
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
        height:70px;
    }
    
        /* 랭킹, 마이페이지 폰트 색상과 호버 효과 */
        .nav-link {
            color: white !important;
            /* margin-left: 20px; */
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 2000px;
            height: 900px;
            position: relative;

        }

        .container img {
            position: absolute;
            width: 100%;
            height: 100%;
            /* object-fit: cover; */
            /* filter: grayscale(30%); */

            z-index: 0;

        }

        .mainbox {
            width: 750px;
            height: 400px;
            background-color: rgb(52, 255, 147);
            z-index: 1;
            margin-top: 200px;
            border-radius: 20px;
            display: flex;
            margin-left: 60px;
            min-width: 750px;
            min-height: 400px;

            background-image: url(/image/introbg.jpg);
            background-size: cover;
            /* 이미지를 커버하도록 설정 */
            background-repeat: no-repeat;
            /* 이미지 반복 중지 */
            padding: 20px;

        }

        .gamelist {
            /* background-color: white; */
            flex: 4;
            border: 5px dashed white;
            margin: 20px;
            display: flex;
            flex-direction: column;
            height: 300px;
        }

        .zen-dots-regular {
            font-family: "Zen Dots", sans-serif;
            font-weight: 400;
            font-style: normal;
            font-size: 20px;
        }

        .gamelist div {
            flex: 1;
            /* border: 2px dashed white; */
            color: white;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
        	cursor: pointer;
        	transition: background-color 0.3s ease;
        }
        
    .gamelist .game:hover {
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 10px;
    }


        .gameintro {
            flex: 6;
            /* background-color: white; */
            display: flex;
            flex-direction: column;
        }

        .gameintro .playVideo {
            flex: 7;
            background-color: black;
            border-radius: 20px;
            margin: 20px;
        }

        .gameintro .startbtn {
            flex: 3;
            position: relative;

        }

        .startbtn img {
            /* position: absolute; */
            width: 60%;
            height: 100%;
            margin-top: -20px;
            margin-left: 90px;
        }




        .footer {
            width: 100%;
            background-color: #323232;
            postion:fixed; 
            bottom:0; 
            height: 150px;
            
        }
        .leftfooter{
        	color : white;
        	font-weight : bold;
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
            margin-left : 20px;
        }
    </style>
</head>
<body>
		<!-- Video Background -->
   		<video class="video-background" autoplay muted loop>
        	<source src="/image/video.mp4" type="video/mp4">
        	Your browser does not support the video tag.
    	</video>
    	
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
                            <li><a class="dropdown-item" href="">커뮤니티게시판</a></li>
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
                        <a class="nav-link" href="/mypage.member">마이페이지</a>
                    </li>
                   
                     
                    <i class="fa-solid fa-user"></i>        	
                   
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <img src="/image/1.png">

        <div class="mainbox">

            <div class="gamelist">
                <div class="listtitle zen-dots-regular">LIST</div>
                <div class = "game" id="listgame1">> game 1 <</div> 
                <div class = "game" id="listgame2">> game 2 <</div> 
                <div class = "game" id="listgame3">> game 3 <</div> 
                <div class = "game" id="listgame4">> game 4 <</div> 
                <div class = "game" id="listgame5">> game 5 <</div> 
            </div> 
            <div class="gameintro">
                <div class="playVideo">
                play 영상 영역
                </div>
                <div class="startbtn">
                    <a href="/gboard/mainBoard.jsp"><img src="/image/startbtn.png" alt=""></a>
                </div>
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
</body>

</html>