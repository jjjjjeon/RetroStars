<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Q&A detail page</title>
            <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://kit.fontawesome.com/5af4c0ec93.js" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <!-- Google Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap"
                rel="stylesheet">
            <style>
                body {
                    background-image: url('/image/background.png');
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    color: white;
                }

                nav {
                    background-color: #323232;

                }

                nav {
                    margin-bottom: 50px;
                }

                * {
                    box-sizing: border-box;
                }

                /*div {
                 border: 1px solid red;
             }*/

                .container {
                    width: 1100px;
                    height: 600px;
                    display: flex;
                    flex-direction: column;
                    margin: auto;
                    justify-content: center;
                    align-items: center;
                }

                .header {
                    width: 800px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex: 1;
                    padding: 1rem;
                    background: #323232;
                    text-align: center;
                    font-size: 2.5rem;
                    color: #00d4ff;
                    border-bottom: 2px solid #00d4ff;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
                }

                .main {
                    display: flex;
                    flex: 9;
                    justify-content: center;
                    align-items: center;
                    overflow: hidden;
                }

                .content {
                    height: 400px;
                    width: 800px;
                    background: #323232;
                    padding: 2rem;
                    border-radius: 15px;
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
                    backdrop-filter: blur(10px);
                    text-align: center;
                    color: #00d4ff;
                    display: flex;
                    flex-direction: column;
                    gap: 2rem;
                }

                .post-detail {
                    width: 100%;
                }

                .post-header {
                    padding: 1rem;
                    background: #272727;
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
                }

                #post-title {
                    font-size: 1.5rem;
                    margin: 0;
                    color: white;
                }

                .post-body {
                    margin-top: 15px;
                    height: 250px;
                    padding: 1.5rem;
                    background: #272727;
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
                    text-align: left;
                    line-height: 1.8;
                }

                #post-content {
                    font-size: 1.3rem;
                    margin: 0;
                    color: #ffffff;
                }



                .footer {
                    margin-top: 50px;
                }

                .footer {
                    width: 100%;
                    background-color: #323232;
                    bottom: 0;
                    height: 150px;

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

                .btnsdiv{
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .btnsdiv>button{
                    margin-right: 5px;
                }
            </style>
        </head>

        <body>
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">ICON</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                                    style="color:white">
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
                                <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                                    style="color:white">
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
                <div class="header">
                    <h3>글 작성하기</h3>
                </div>
                <main class="main">
                    <div class="content">
                        <div class="post-detail" id="post-detail">
                            <div class="post-header">
                                <div id="post-title" contenteditable="false">${dto.qBoardTitle}</div>
                            </div>
                            <div class="post-body">
                                <div id="post-content" contenteditable="false">${dto.qBoardContent}</div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div class="btnsdiv">
                <button class="backlist btn btn-secondary" type="button" onclick="location.href='/list.qboard'">목록으로</button>
                <c:choose>
                    <c:when test="${loginId eq dto.userId}">
                        <button class="btn btn-secondary" id="updatebtn">수정</button>
                        <button class="btn btn-secondary" id="deletebtn">삭제</button>
                    </c:when>
                </c:choose>
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
        <script>
		$("#updatebtn").on("click", function() {
			updatebtn = $(this);
			deletebtn = $(this).next();

			if (updatebtn.html() == "수정") {
				$("div[contenteditable]").attr("contenteditable", "true");
				updatebtn.html("완료");
				deletebtn.html("취소");

				$(".title").on("keypress", function(e) {
					if (e.key == "Enter") {
						return false;
					}
				});

				$(".contents").on("keypress", function(e) {
					if (e.key == "Enter") {
						return false;
					}
				});

			} else if (updatebtn.html() == "완료") {
				$("div[contenteditable]").attr("contenteditable", "false");

				let form = $('<form>', {
					action : '/update.qboard',
					method : 'post'
				}); // 동적  form 생성

	
				let formData = [ $('<input>', {
					type : 'hidden',
					name : 'seq',
					value : '${dto.qBoardSeq}'
				}), $('<input>', {
					type : 'hidden',
					name : 'title',
					value : $('#post-title').html().trim()
				}), $('<input>', {
					type : 'hidden',
					name : 'content',
					value : $('#post-content').html().trim()
				}) ];

				
				form.append(formData);
				form.appendTo('body').submit();
			}
		})

		$("#deletebtn").on("click", function() {
			updatebtn = $(this).prev();
			deletebtn = $(this);

			if (deletebtn.html() == "삭제") {
				let result = confirm("정말 삭제하시겠습니까?");
				if (result) {
					location.href = "/delete.qboard?seq=${dto.qBoardSeq}"
				}
			} else if (deletebtn.html() == "취소") {
				location.href = "/detail.qboard?seq=${dto.qBoardSeq}";
			}

		})
        </script>

        </html>