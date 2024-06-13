<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Q&Apage</title>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://kit.fontawesome.com/5af4c0ec93.js" crossorigin="anonymous"></script>
			<style>
				* {
					box-sizing: border-box;
				}

				div {
					border: 1px solid red;
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
					height: 800px;
					margin: auto;
				}

				.navi_container {
					padding-right: 250px;
					padding-left: 250px;
				}

				.navi_container>div:hover {
					border-bottom: 2px solid black;
				}

				.navi_container a {
					text-decoration: none;
					color: black;
				}

				.search_container {
					padding-right: 50px;
					padding-left: 50px;
				}

				.search_col2 {
					display: flex;
					align-items: flex-end;
					justify-content: right;
				}

				#category1_select {
					height: 23px;
				}

				#category2_select {
					height: 23px;
				}

				.search_bar {
					padding-bottom: 2px;
					display: flex;
					align-items: flex-end;
					width: 190px;
					height: 30px;
					border-bottom: 2px solid black;
				}

				.search_bar>#search_input {
					width: 170px;
					text-align: center;
					border: none;
				}

				.list_container_row {
					padding-left: 50px;
					padding-right: 50px;
				}

				.list_container_col {
					border-bottom: 3px solid black;
				}

				.list_head {
					border-top: 3px solid black;
					border-bottom: 3px solid black;
				}

				.list_data_row {
					border-bottom: 1px solid lightgray;
				}

				.list_data_row>div {
					flex: 1;
				}

				.btns_container {
					display: flex;
					padding-left: 50px;
					padding-right: 50px;
					justify-content: right;
					align-items: flex-end;
				}

				#ask_btn {
					background-color: transparent;
				}

				#page_navi a {
					display: inline-block;
					margin-right: 5px;
					text-decoration: none;
					color: black;
				}
			</style>
		</head>


		<body>
			<div class="container col center">
				<div class="col1 center" style="flex: 1; width: 100%;">Q&Apage</div>
				<div class="col2 col" style="flex: 9; width: 100%;">
					<div class="navi_container row" style="flex: 0.7; width: 100%;">
						<div class="navi_total center" style="flex: 1;">
							<a href="">전체</a>
						</div>
						<div class="navi_game center" style="flex: 1;">
							<a href="">게임문의</a>
						</div>
						<div class="navi_collaboration center" style="flex: 1;">
							<a href="">제휴문의</a>
						</div>
						<div class="navi_etc center" style="flex: 1;">
							<a href="">기타문의</a>
						</div>
					</div>
					<div class="search_container row" style="flex: 1.0; width: 100%;">
						<div class="col1" style="flex: 1;"></div>
						<div class="search_col2" style="flex: 1; padding-bottom: 15px;">
							<select id="#category1_select" style="margin-right: 5px;">
								<option value="분류" selected disabled hidden>분류</option>
								<option value="제목">제목</option>
								<option value="내용">내용</option>
							</select> <select id="#category2_select" style="margin-right: 5px;">
								<option value="카테고리" selected disabled hidden>카테고리</option>
								<option value="전체">전체</option>
								<option value="게임문의">게임문의</option>
								<option value="게임문의">제휴문의</option>
								<option value="게임문의">기타문의</option>
							</select>
							<div class="search_bar center">
								<input id="search_input" type="text" placeholder="검색어를 입력하세요.">
								<i class="fa-solid fa-magnifying-glass"></i>
							</div>
						</div>
					</div>
					<div class="list_container_row row" style="flex: 6.9; width: 100%;">
						<div class="list_container_col col" style="flex: 1; height: 100%;">
							<div class="list_head row" style="flex: 1; width: 100%;">
								<div class="list_head_seq center" style="flex: 1;">번호</div>
								<div class="list_head_category center" style="flex: 1;">카테고리</div>
								<div class="list_head_writer center" style="flex: 1;">작성자</div>
								<div class="list_head_title center" style="flex: 4.5;">제목</div>
								<div class="list_head_write_date center" style="flex: 1.5;">작성일</div>
								<div class="list_head_answer center" style="flex: 1;">답변</div>
							</div>
							<div class="list_detail_box row" style="flex: 9; width: 100%;">
								<div class="list_detail_box col" style="flex: 1; height: 100%;">
									<!--얘포함 10개로 넣자
									<div class="list_data_row row" style="height: 44px; width: 100%;">
										<div class="list_data_seq center" style="flex: 1;">1</div>
										<div class="list_data_category center" style="flex: 1;">기타문의</div>
										<div class="list_data_writer center" style="flex: 1;">sami3013</div>
										<div class="list_data_title center" style="flex: 4.5;">이건
											예시데이터 입니다.</div>
										<div class="list_data_write_date center" style="flex: 1.5;">2024.06.09</div>
										<div class="list_data_answer center" style="flex: 1;">답변완료</div>
									</div>-->
								</div>
							</div>
						</div>
					</div>
					<div class="btns_container" style="flex: 0.7; width: 100%;">
						<button id="ask_btn" onclick="location.href='/qaboard/writeBoard.jsp'">문의하기</button>
					</div>
					<div id="page_navi" class="page_container center" style="flex: 0.7; width: 100%;"></div>
				</div>
			</div>

			<script>
				$(document).ready(
					function () {
						$.ajax({
							url: "/select.qboard",
							type: "POST",
							dataType: "json"
						}).done(function (data) {
							let cpage = data[0];
							console.log(cpage);
							let recordCountPerPage = data[1];
							let naviCountPerPage = data[2];
							let recordTotalCount = data[3];
							let list = data[4];

							let page_total_count = 0;
							if (recordTotalCount % recordCountPerPage > 0) {
								page_total_count = Math
									.floor(recordTotalCount
										/ recordCountPerPage) + 1;
							} else {
								page_total_count = Math
									.floor(recordTotalCount
										/ recordCountPerPage);
							}

							let startNavi = Math.floor((cpage - 1)
								/ naviCountPerPage)
								* naviCountPerPage + 1;

							let endNavi = startNavi + naviCountPerPage - 1;
							if (endNavi > page_total_count) {
								endNavi = page_total_count;
							}

							let needNext = true;
							let needPrev = true;

							if (startNavi == 1) {
								needPrev = false;
							}
							if (endNavi == page_total_count) {
								needNext = false;
							}

							$("#page_navi").empty(); // 기존에 있던 내용을 지우고 새로운 페이지네이션을 추가합니다.

							if (needPrev) {
								let needPreva = $("<a>").attr(
									"href",
									"/select.qboard?cpage="
									+ (startNavi - 1)).html(
										" < ");
								$("#page_navi").append(needPreva);
							}

							for (let i = startNavi; i <= endNavi; i++) {
								let pagesa = $("<a>").attr("href",
									"/select.qboard?cpage=" + i).html(
										i + "&nbsp;");
								$("#page_navi").append(pagesa);
							}

							if (needNext) {
								let needNexta = $("<a>").attr(
									"href",
									"/select.qboard?cpage="
									+ (endNavi + 1))
									.html(" > ");
								$("#page_navi").append(needNexta);
							}

							for (let dto of list) {
								let list_data_row = $("<div>").addClass("list_data_row row").css({
									"height": "44px",
									"width": "100%"
								});

								let list_data_seq = $("<div>").addClass("list_data_seq center").css("flex", "1").html(dto.qBoardSeq);
								let list_data_category = $("<div>").addClass("list_data_category center").css("flex", "1").html(dto.qBoardCategory);
								let list_data_writer = $("<div>").addClass("list_data_writer center").css("flex", "1").html(dto.userId);
								let list_data_title = $("<div>").addClass("list_data_title center").css("flex", "1").html(dto.qBoardTitle);
								let list_data_write_date = $("<div>").addClass("list_data_write_date center").css("flex", "1").html(dto.qBoardDate);
								let list_data_answer = $("<div>").addClass("list_data_answer center").css("flex", "1").html(dto.qBoardAnswer);

								list_data_row.append(list_data_seq, list_data_category, list_data_writer, list_data_title, list_data_write_date, list_data_answer);
								$(".list_detail_box").append(list_data_row);
							}
						});
					});
			</script>

		</body>


		</html>