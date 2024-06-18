<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 		
 		.navbar {
        	
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

        /*div{border:1px solid red;}*/

        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            background-image: url('/image/background.png');
            /* 우주 테마 배경 이미지 */
            background-size: cover;
            background-attachment: fixed;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            margin-top:24px;
            margin-bottom:25px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            height:650px;
        }
        
        .search{height:40px; width:100%; text-align:center;}

        h1 {text-align: center;margin-bottom: 20px; font-size:30px;}
        h3 {font-size:20px;}

        .tabs {overflow: hidden;border-bottom: 1px solid #ccc;}

        .tablink {
            background-color: #111;
            color: #fff;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            width: 25%;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        .tablink:hover { background-color: #575757;}

        .tabcontent {display: none;padding: 20px;animation: fadeEffect 0.5s;}

        @keyframes fadeEffect {
            from {opacity: 0;}
			to {opacity: 1;}
        }

        .faq {margin-top: 20px;}

        .faq-item {margin-bottom:20px;}

        .question {cursor: pointer;background-color: #444;padding: 10px;border-radius: 5px; margin-top:5px;}

        .answer {display: none; background-color: #333;border-radius: 5px; padding:10px;}
        
        
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
        
        .thumbnail{
        	border-radius: 20px;
        	width: 356px;
        	height: 230px;
        	object-fit: cover;
        }
        
        a {text-decoration: none !important;}
		a:link { color: white; text-decoration: none;}
		a:visited { color: white; text-decoration: none;}
		a:hover { color: white; text-decoration: underline;}
        
        
        
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index.jsp">홈으로</a>
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
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">자유게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">공략게시판</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">QA게시판</a></li>
                            <li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="/list.nboard">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                   

                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
				        <li class="nav-item">
				           <a class="nav-link" href="/mypage.member">
				               <img src="${sessionScope.profileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
				           </a>
				       </li>                  
                      <li class="nav-item">
                           <a class="nav-link" href="/mypage.member">마이페이지</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
                       </li>
                   </ul>                          
                   </c:when>
                   <c:otherwise>
                      <ul class="navbar-nav ms-auto">
                          <li class="nav-item">
                              <a class="nav-link" href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
                          </li>
                      </ul>
                   </c:otherwise>
                </c:choose>

            </div>
        </div>
    </nav>
	<div class="container">
        <h1>FAQ 게시판</h1>
        
        <div class="search">검색 기능 구현</div>
        
        <div class="tabs">
            <button class="tablink" onclick="openTab(event, 'all')">전체</button>
            <button class="tablink" onclick="openTab(event, 'game')">게임</button>
            <button class="tablink" onclick="openTab(event, 'board')">게시판</button>
            <button class="tablink" onclick="openTab(event, 'etc')">기타</button>
        </div>

        <div id="all" class="tabcontent">
            <h3>전체</h3>
            <div class="faq">
                <div class="faq-item">
                	<c:forEach var="fboardCate" items="${fboardCate}">
                    	<div class="question">${fboardCate.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate.fBoardAnswer}</div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="game" class="tabcontent">
            <h3>게임</h3>
            <div class="faq">
                <div class="faq-item">                   
               		 <c:forEach var="fboardCate1" items="${fboardCate1}">
                    	<div class="question">${fboardCate1.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate1.fBoardAnswer}</div>
                    </c:forEach>                   
                </div>
            </div>
        </div>

        <div id="board" class="tabcontent">
            <h3>게시판</h3>
            <div class="faq">
                <div class="faq-item">  
                    <c:forEach var="fboardCate2" items="${fboardCate2}">
                    	<div class="question">${fboardCate2.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate2.fBoardAnswer}</div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div id="etc" class="tabcontent">
            <h3>기타</h3>
            <div class="faq">
                <div class="faq-item">
                    <c:forEach var="fboardCate3" items="${fboardCate3}">
                    	<div class="question">${fboardCate3.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate3.fBoardAnswer}</div>
                    </c:forEach>
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

    <script>
        $(document).ready(function () {
            $(".question").click(function () {
                $(this).next(".answer").slideToggle();
                $(this).toggleClass("active");
            });

            $(".tablink").first().click(); // 첫 번째 탭을 기본으로 열기
        });

        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.style.backgroundColor = "#575757";
        }
    </script>
	
</body>
</html>