<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Q&Apage 글 작성하기</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
				crossorigin="anonymous"></script>

			<style>
				

				* {
					box-sizing: border-box;
				}

				div {
					border: 1px solid black;
				}

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

				#title_input {
					border: none;
					width: 450px;
					text-align: center;
					border-bottom: 2px solid gray;
				}

				#contents_detail {
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
			</style>


		</head>


		<body>
			<form action="/insert.qboard" method="post" onsubmit="event.preventDefault(); sendData(); blackCheck()">
				<div class="container col">
					<div class="boardwritername_container row" style="flex: 1;">
						<div class="col" style="flex: 1; display: inline;">
							<span id="boardwriter_div">${nickname}</span>
							<span>님의 글</span>
							<hr>
						</div>
					</div>
					<div class="category_container col" style="flex: 1; width: 100%;">
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
								aria-expanded="false" style="border-radius:0">카테고리</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item">게임문의</a></li>
								<li><a class="dropdown-item">제휴문의</a></li>
								<li><a class="dropdown-item">기타문의</a></li>
							</ul>
						</div>
					</div>
					<div class="title_container" style="flex: 1; width: 100%">
						<div class="title_detail">
							<input type="text" id="title_input" style="margin-right: 5px;" placeholder="제목을 입력하세요.">
							<label for="secret"><input type="checkbox" id="secret">비밀글</label>
						</div>
					</div>
					<div class="contents_container center" style="flex: 6; width: 100%;">
						<div id="contents_detail" contenteditable="true"></div>
					</div>
					<div class="btns_container" style="flex: 1; width: 100%;">
						<button id="back_btn" class="btn btn-secondary" type="button"
							onclick="location.href='/list.qboard'">취소</button>
						<button id="insert_btn" class="btn btn-primary">등록</button>
					</div>
				</div>
			</form>
			<script>

				function blackCheck() {
					if ($(".dropdown-toggle").text() == "카테고리" || $("#title_input").val().trim() == "" || $("#contents_detail").html().trim() == "") {
						if ($(".dropdown-toggle").text() == "카테고리") {
							alert("카테고리를 선택하세요.");
						}else if($("#title_input").val().trim() == ""){
							alert("제목을 입력하세요.");
						}else if($("#contents_detail").html().trim() == ""){
							alert("내용을 입력하세요.");
						}
					}
					
				}

				//정보 내보내기
				//정보를 보내는 곳과 화면 전환하는 곳이 달라서 함수를 만듬
				function sendData() {
					$.ajax({
						url: "/insert.qboard",
						dataType: "json",
						data: {
							userId: $("#boardwriter_div").text(),
							qBoardCategory: $(".dropdown-toggle").text(),
							qBoardTitle: $("#title_input").val().trim(),
							qBoardContent: $("#contents_detail").html().trim(),
							qBoardSecret: $('#secret').prop('checked')
						}
					}).done(function () {
						//alret("질문이 등록되었습니다.");
						window.location.href = "/insert.qboard";

					})
				}

				//드랍다운 선택시 카테고리 텍스트 변경 이벤트
				document.addEventListener("DOMContentLoaded", function () {
					// 모든 드롭다운 항목에 이벤트 리스너 추가
					let dropdownItems = document.querySelectorAll('.dropdown-item');
					dropdownItems.forEach(function (item) {
						item.addEventListener('click', function (event) {
							// 버튼 텍스트 변경
							let button = document.querySelector('.dropdown-toggle');
							button.textContent = event.target.textContent;
						});
					});
				});
			</script>

		</body>

		</html>