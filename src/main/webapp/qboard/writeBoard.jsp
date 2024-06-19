<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Q&Apage</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
				crossorigin="anonymous"></script>

			<style>
			
			body{
					background-image: url('/image/background.png');
					background-size:100% 100%;
					color:white;
				}
				
				nav{
					background-color: #323232;
					margin-bottom:50px;
				
				}
			
				

				* {
					box-sizing: border-box;
				}

				/*div {
					border: 1px solid black;
				}*/

				.row {
					display: flex;
				}

				.col {
					display: flex;
					flex-direction: column;
				}

				.center {
					display: flex;
					justify-content: center;
					align-items: center;
					
				}

				.container {
				    padding-bottom: 30px;
    				padding-top: 30px;
					background-color:#323232;
					width: 1100px;
					height: 750px;
					margin: auto;
				}

				.boardwritername_container {
					padding-left: 100px;
					padding-right: 100px;
					display: flex;
					align-items: center;
					font-size: larger;
				}

				#boardwriter_div {
					font-weight: bold;
				}

				.category_container {
					display: flex;
					justify-content: flex-end;
				}

				.dropdown {
					padding-left: 100px;
					padding-right: 100px;
				}

				.title_container {
					padding-left: 100px;
					padding-right: 100px;
					display: flex;
					align-items: center;
					justify-content: center;
				}

				.title_detail {
					width: 1000px;
					height: 35px;
				}
				
				.title_detailSpan{
					display: inline-block;
					border-bottom: 2px solid gray;
				}

				#title_input {
					color:white;
				    background-color: #323232;
    				margin-right: 5px
					border: none;
					width: 450px;
					text-align: center;
					border: none;
				}

				#contents_detail {
					color:white;
					position: relative;
					width: 880px;
					height: 500px;
					border: 2px solid gray;
				}

				#contents_detail::before {
					/*비어있을 때*/
					position: absolute;
					content: "내용을 입력하세요.";
					color: gray;
					top: 50%;
					left: 45%;
				}

				#contents_detail:not(:empty)::before {
					/*비어있지 않을 때*/
					display: none;
				}

				.btns_container {
					display: flex;
					padding-left: 50px;
					padding-right: 50px;
					justify-content: center;
					align-items: flex-end;
					padding-top:20px;
				}

				#back_btn {
					width: 120px;
					margin-right: 5px;
					border-radius: 0;
				}

				#insert_btn {
					width: 120px;
					border-radius: 0;
				}
			

        
				
		.footer {
			margin-top:50px;
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
		 <nav class="navbar navbar-expand-lg navbar-dark">
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
                        <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="color:white">
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
                        <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="color:white">
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
    <div class="container col">
        <div class="boardwritername_container row" style="flex: 1;color:white;">
            <div class="col" style="flex: 1; display: inline;">
                <span id="boardwriter_div" name="userId">${nickname}</span>
                <span>님의 글</span>
                <hr>
            </div>
        </div>
        <div class="category_container col" style="flex: 1; width: 100%;">
            <div class="dropdown">
                <button id="categoryToggle" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                    aria-expanded="false" style="border-radius:0 name="qBoardCategory">카테고리</button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item">게임문의</a></li>
                    <li><a class="dropdown-item">제휴문의</a></li>
                    <li><a class="dropdown-item">기타문의</a></li>
                </ul>
            </div>
        </div>
        <div class="title_container" style="flex: 1; width: 100%">
            <div class="title_detail">
                <div class="title_detailSpan">
                    <input name="qBoardTitle" type="text" id="title_input" style="margin-right: 5px;" placeholder="제목을 입력하세요.">
                </div>
                <label for="secret" style="color:white;"><input name="qBoardSecret" type="checkbox" id="secret" style="margin-right:10px;">비밀글</label>
            </div>
        </div>
        <div class="contents_container center" style="flex: 6; width: 100%;">
            <div id="contents_detail" contenteditable="true"></div>
            <input type="hidden" id="qBoardContent" name="qBoardContent">
        </div>
        <div class="btns_container" style="flex: 1; width: 100%;">
            <button id="back_btn" class="btn btn-secondary" type="button" onclick="location.href='/list.qboard'">취소</button>
            <button id="insert_btn" class="btn btn-primary" >등록</button>
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
			
			 $("#insert_btn").on("click", function () {
                   let form = $('<form>', {
                        action: '/insert.qboard',
                        method: 'post'
                   }); // 동적 form 생성
                   
                // 추가할 폼 데이터를 배열에 담습니다.
   				let formData = [ $('<input>', {
   					type : 'hidden',
   					name : 'boardWriterNicname',
   					value : $("#boardwriter_div").text()
   				}),$('<input>', {
   					type : 'hidden',
   					name : 'qBoardCategory',
   					value :$("#categoryToggle").text()
   				}), $('<input>', {
   					type : 'hidden',
   					name : 'qBoardTitle',
   					value :  $("#title_input").val().trim()
   				}),$('<input>', {
   					type : 'hidden',
   					name : 'qBoardContent',
   					value : $("#contents_detail").html().trim()
   				}), $('<input>', {
   					type : 'hidden',
   					name : 'qBoardSecret',
   					value : $('#secret').prop('checked')
   				}) ];
               
             		form.append(formData);
             		form.appendTo('body').submit();
                 
         	});
			 
			//드랍다운 선택시 카테고리 텍스트 변경 이벤트
			document.addEventListener("DOMContentLoaded", function () {
					// 모든 드롭다운 항목에 이벤트 리스너 추가
					let dropdownItems = document.querySelectorAll('.dropdown-item');
					dropdownItems.forEach(function (item) {
						item.addEventListener('click', function (event) {
							// 버튼 텍스트 변경
							let button = document.querySelector('#categoryToggle');
							button.textContent = event.target.textContent;
						});
					});
			})
			
			
		
		   // .dropdown-item을 클릭했을 때
	       $(".dropdown-item").on("click", function (e) {
	          e.preventDefault();
	          $("#categoryToggle").html($(this).html());
	       });
			
			//예외처리하기

				
	
			</script>

		</body>

		</html>