<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/image/background.png');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            color:white;	/*헤더 글자색 흰색으로 */
            font-family : 'DalseoHealing';
        }

      /*    navbar css */
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
      /*    end navbar css */

        .container {
            width: 800px;
            margin: 20px auto;
            background-color: #323232;
            border: none;
            color:white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius:20px;
        }
		#nBoardTitle{
			background-color: #323232;
			color:white;
		}
		#nBoardContent{
			background-color: #323232;
			color:white;
			height: 400px;
			resize:vertical;
			overflow: auto;
			border:1px solid white;
			border-radius:10px;
			padding:10px;
		}
        .header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group select,
        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .form-group textarea {
            height: 200px;
            resize: vertical;
        }

        .form-group input[type="file"] {
            float: left;
            margin-bottom: 10px;
        }

        .form-actions {
            text-align: right;
        }

        .form-actions button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 10px;
        }

        .form-actions a button {
            background-color: #6c757d;
        }
               /* footer */
        .footer {
        	position: fixed;
        	bottom: 0;
            width: 100%;
            height: 120px;
            background-color: #323232;
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
        #submit{
        	background-color:white;
        	color:#323232;
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
    <div class="container">
        <div class="header">
            공지게시판
        </div>

		<form action="/write.nboard" method="post">
		       <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="nBoardTitle" name="title" placeholder="글 제목을 입력하세요">
        </div>
        <div class="form-group">
            <label for="contents">내용</label>
            <input type="hidden" name="contents" id="hidden_content">
            <div id="nBoardContent" contenteditable="true"></div>
        </div>
        <div class="form-actions">
            <a href="/list.nboard"><button type="button">목록으로</button></a>
            <button id="submit" type="submit">작성 완료</button>
        </div>
		</form>
		

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
		$("#submit").on("click",function(){
			// 제목, 내용 공백 검사
			let title = $("#nBoardTitle").val().trim();
			let content = $("#nBoardContent").html();
			console.log(content);
			
			if(title==='' || content === ''){
				event.preventDefault();
			if(title===''){
					alert("제목은 필수 입력입니다.");
				}
			if(content === ''){
				alert("내용은 필수 입력입니다.");
				event.preventDefault();
			}

			
			}
			$("#hidden_content").val($("#nBoardContent").html());
		})
	</script>
</body>

</html>