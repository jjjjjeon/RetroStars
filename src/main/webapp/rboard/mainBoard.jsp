<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranking Page</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-image: url(/image/background.png);
            color: #333;
            background-size: cover;
            
            color:white; 
        }

.navbar {
           top: 0;
           width: 100%;
           z-index: 1000;
           height:70px;
           background-color : #323232;
       }
       .navbar-brand{
          color:white;
       }
       .nav-link {
            color: white !important;			
       }

       .nav-link:hover {
 			background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
       }
       .nav-item{
           align-items: center;
    	   display: flex;
       }

      .btn{
         color:white;
      }
 
      .btn:hover{
         color:white;
      }
      .dropdown-menu{
         background-color: #323232;
         text-align: center; /* 중앙 정렬을 위한 설정 */
         width: 100%; /* 너비를 100%로 설정 */
      }
      .dropdown-item{
         background-color: #323232;
         color:white;
      }


      a {
		  text-decoration: none !important;
	  }
	  
	  a:link { color: white; text-decoration: none;}
 	  a:visited { color: white; text-decoration: none;}
	  a:hover { color: white; text-decoration: underline;}

        .wrapper {
            width: 800px;
            margin: 20px auto;
            border-radius: 8px;
            overflow: hidden;
        }

        .highUserBox {
            display: flex;
            flex-direction: column;
        }

        .rankingimg {
            height: 400px;
            overflow: hidden;
            background-color: white;
        }

        .rankingimg img {
            width: 100%;
            height: 100%;
            padding: 25px 50px 0 50px;
        }

        .highContent {
            display: flex;
            justify-content: space-around;
            background-color:white;
        }

        .highScore.firstBox {
            background-color: #fdc4b5;
            margin-right: -20px;
            flex: 1;
        }

        .highScore.firstBox:hover {
            z-index: 2;
            transition: 0.3s;
            margin-right: -60px;

        }

        .highScore.firstBox img {
            margin-top: 30px;
        }

        .highScore.secondBox {
            background-color: #ffd97c;
            width: 300px;
            z-index: 1;
        }

        .highScore.secondBox img {
            width: 120px;
            height: 120px;

        }

        .highScore.thirdBox {
            background-color: #cee0f0;
            flex: 1;
            margin-left: -20px;
        }

        .highScore.thirdBox:hover {
            z-index: 1;
            transition: 0.3s;
            margin-left: -50px;
            filter: grayscale(0.4);
        }

        .highScore.thirdBox img {
            margin-top: 30px;
        }

        .highContent .highScore {
            display: flex;
            flex-direction: column;
            align-items: center;

            padding: 10px;

            border-radius: 8px;
            box-shadow: 0 7px 10px rgb(120 120 120);
        }

        .userimg {
            display: flex;
            justify-content: center;
        }

        .userimg img {
            width: 100px;
            height: 100px;
            border: 3px solid #ffffff;
            border-radius: 50%;
            margin-top: 5px;
            object-fit: cover;
        }

        .username,
        .userscore {
            margin-top: 10px;
            font-weight: bold;
            text-align: center;
        }

        .userscore {
            border: 2px solid white;
            padding: 8px;
            border-radius: 20px;
            font-size: 13px;
            color: white;
        }

        .lowUserBox {
            display: flex;
            flex-direction: column;
            padding: 10px;
            color: white;
            background-color: #323232;
        }

        .rankList {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #dee2e6;
        }

        .rankList:last-child {
            border-bottom: none;
        }

        .rankList .ranknum,
        .rankList .rankimg,
        .rankList .rankscore,
        .rankList .username {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .rankList .ranknum {
            flex: 1;
            font-size: 18px;
            font-weight: bold;
        }

        .rankList .rankimg {
            flex: 1;
        }

        .rankList .rankimg img {
            width: 50px;
            height: 50px;
            border-radius: 50px;
        }

        .rankList .rankscore {
            flex: 2;
        }

        .rankList .username {
            flex: 2;
        }

         .footer {
            width: 100%;
            background-color: #323232;
            position: relative;
            margin-top: auto;
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
        

        a {
          text-decoration: none !important;
      }
       a:link { color: white; text-decoration: none;}
       a:visited { color: white; text-decoration: none;}
       a:hover { color: white; text-decoration: underline;}


        #gamenav {
            width: 1000px;
            margin: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
        	
            <a class="navbar-brand" href="/index.jsp"><img src="/image/headerlogo.png" alt="" style="width: 80px; height: 60px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게임
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=1">2048</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=2">GOLD BREAK!</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=3">ICE CUBY</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=4">똥 피하기</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=5">탈출하기</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu">
                        	<li><a class="dropdown-item" href="/list.nboard">공지사항</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티</a></li>
							<li><a class="dropdown-item" href="/list.review">게임리뷰</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">Q&A게시판</a></li>
                            <li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
                            
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/list.playrecord">랭킹</a>
                    </li>
                   

                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
                   
                   <c:if test="${isAdmin eq true}">
                    	<li class="nav-item">
                           <a class="nav-link" href="/dashBoard.admin">관리자페이지</a>
                    	</li>
                   </c:if>	
                     <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
                     </li>
                     
                    <li class="nav-item">
                       <a class="nav-link" href="/mypage.member">
                           <img src="/profile/${userProfileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
                       </a>
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
    
    
    <nav class="nav nav-pills nav-fill" id="gamenav">
        <a class="nav-link" href="/list.playrecord?gameSeq=1">2048</a>
        <a class="nav-link" href="/list.playrecord?gameSeq=2">GOLD BREAK!</a>
        <a class="nav-link" href="/list.playrecord?gameSeq=3">ICE CUBY</a>
        <a class="nav-link" href="/list.playrecord?gameSeq=4">똥 피하기</a>
        <a class="nav-link" href="/list.playrecord?gameSeq=5">탈출하기</a>
    </nav>

    <div class="wrapper">
        <div class="highUserBox">
            <div class="rankingimg">
                <img src="/image/단상22.png" alt="ranking stage">
            </div>
            <div class="highContent">
                <div class="highScore firstBox">
                    <div class="userimg">
                        <img src="/profile/${ranks.get(2).url}" alt="user image">
                    </div>
                    <div class="username">${ranks.get(2).id}</div>
                    <div class="userscore">${ranks.get(2).score}</div>

                </div>
                <div class="highScore secondBox">
                    <div class="userimg">
                        <img src="/profile/${ranks.get(0).url}" alt="user image">
                    </div>
                    <div class="username">${ranks.get(0).id}</div>
                    <div class="userscore">${ranks.get(0).score}</div>
                </div>
                <div class="highScore thirdBox">
                    <div class="userimg">
                        <img src="/profile/${ranks.get(1).url}" alt="user image">
                    </div>
                    <div class="username">${ranks.get(1).id}</div>
                    <div class="userscore">${ranks.get(1).score}</div>
                </div>
            </div>
        </div>
        <div class="lowUserBox">
        
        <c:forEach var="rank" items="${ranks}" varStatus="status">
        <c:if test="${status.index >= 3 && status.index <= 10}">
            <div class="rankList">
                <div class="ranknum">${rank.rank}</div>
                <div class="rankimg">
                    <img src="/profile/${rank.url}" alt="ranking profile">
                </div>
                <div class="username">${rank.id}</div>
                <div class="rankscore">${rank.score}</div>
            </div>
        </c:if>
    </c:forEach>
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