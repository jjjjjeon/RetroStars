<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Q&A page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5af4c0ec93.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
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
	background-size:100% 100%;
	color:white;
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
.row {
	display: flex;
}

.col {
	display: flex;
	flex-direction: column;
	color: white;
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
	background-color: #323232;
}

.navi_container {
	padding-right: 250px;
	padding-left: 250px;
	margin: 0;
}

.navi_container>div:hover {
	border-bottom: 2px solid white;
}

.navi_container a {
	text-decoration: none;
	color: white;
}

.search_container {
	padding-right: 50px;
	padding-left: 50px;
	margin: 0;
}

.search_col2 {
	display: flex;
	align-items: flex-end;
	justify-content: right;
}

.search_bar {
	padding-bottom: 2px;
	display: flex;
	align-items: center;
	width: 220px;
	height: 35px;
	border-bottom: 2px solid white;
}

.search_bar>#search_input {
	width: 100%;
	height: 100%;
	text-align: center;
	border: none;
	background-color: #323232;
	color: white;
}

.dropdown-toggle {
	height: 35px;
	border-radius: 0;
}

.list_container_row {
	padding-left: 50px;
	padding-right: 50px;
	margin: 0;
}

.list_container_col {
	border-bottom: 3px solid white;
	padding: 0;
}

.list_head {
	border-top: 3px solid white;
	border-bottom: 3px solid white;
	margin: 0;
}

.list_detail_box_row {
	margin: 0;
}

.list_detail_box_col {
	padding: 0;
}

.list_data_row {
	border-bottom: 1px solid lightgray;
	margin: 0;
}

		.list_data_writer {
			    width: 93px;
			    height: 48px;
    			overflow: hidden;
 				white-space: nowrap;
    			text-overflow: ellipsis;
    			display: inline-block;
    			line-height: 48px;
        }
        
        .list_data_title{
            	width: 335px;
			    height: 48px;
    			overflow: hidden;
 				white-space: nowrap;
    			text-overflow: ellipsis;
    			display: inline-block;
    			line-height: 48px; 
    			text-align:center;  
        }

.detailA {
	text-decoration: none;
	color: white;
}

.detailA:hover {
	color: black;
}

.btns_container {
	display: flex;
	padding-left: 50px;
	padding-right: 50px;
	justify-content: right;
	align-items: flex-end;
}

#ask_btn {
	width: 120px;
	border-radius: 0;
}

#page_navi a {
	display: inline-block;
	margin-right: 5px;
	text-decoration: none;
	color: white;
}

#page_navi a:hover {
	cursor: pointer;
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
</style>
</head>


<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">ICON</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown"
				aria-controls="navbarNavDarkDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<button class="btn dropdown-toggle" data-bs-toggle="dropdown"
							aria-expanded="false" style="color: white">게임</button>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="#">game1</a></li>
							<li><a class="dropdown-item" href="#">game2</a></li>
							<li><a class="dropdown-item" href="#">game3</a></li>
							<li><a class="dropdown-item" href="#">game4</a></li>
							<li><a class="dropdown-item" href="#">game5</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<button class="btn dropdown-toggle" data-bs-toggle="dropdown"
							aria-expanded="false" style="color: white">게시판</button>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="#">커뮤니티게시판</a></li>
							<li><a class="dropdown-item" href="#">자유게시판</a></li>
							<li><a class="dropdown-item" href="#">공략게시판</a></li>
							<li><a class="dropdown-item" href="#">QA게시판</a></li>
							<li><a class="dropdown-item" href="#">FAQ게시판</a></li>
							<li><a class="dropdown-item" href="#">공지게시판</a></li>
						</ul>
					</li>
					<li class="nav-item"><a class="nav-link">랭킹</a></li>
					<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>


				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="fas fa-user"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container col center">
		<div class="col1 center" style="flex: 1; width: 100%;">
			<h4>
				질문과 답변 <i class="fa-brands fa-quinscape"></i>
			</h4>
		</div>
		<div class="col2 col" style="flex: 9; width: 100%;">
			<div class="navi_container row" style="flex: 0.7; width: 100%;">
				<div class="navi_total center" style="flex: 1;">
					<a href="" class="naviAn" data-categoryCode="0">전체</a>
				</div>
				<div class="navi_game center" style="flex: 1;">
					<a href="" class="naviAn" data-categoryCode="1">게임문의</a>
				</div>
				<div class="navi_collaboration center" style="flex: 1;">
					<a href="" class="naviAn" data-categoryCode="2">제휴문의</a>
				</div>
				<div class="navi_etc center" style="flex: 1;">
					<a href="" class="naviAn" data-categoryCode="3">기타문의</a>
				</div>
			</div>
			<div class="search_container row" style="flex: 1.0; width: 100%;">
				<div class="col1" style="flex: 1;"></div>
				<div class="search_col2" style="flex: 1; padding-bottom: 15px;">
					<div class="dropdown">
						<button id="searchToggle"
							class="btn btn-secondary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">분류</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#"
								data-searchBy="q_board_title">제목</a></li>
							<li><a class="dropdown-item" href="#"
								data-searchBy="q_board_content">내용</a></li>
						</ul>
					</div>
					<div class="search_bar center">
						<input id="search_input" type="text" placeholder="검색어를 입력하세요.">
						<i id="search_icon" class="fa-solid fa-magnifying-glass"></i>
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
					<div class="list_detail_box_row row" style="flex: 9; width: 100%;">
						<div class="list_detail_box_col col"
							style="flex: 1; height: 100%;">
							<!--여기에 리스트 출력-->
							<c:forEach var="dto" items="${list}">
								<a href="/detail.qboard?seq=${dto.qBoardSeq}" class="detailA">
									<div class="list_data_row row"
										style="height: 44px; width: 100%;">
										<div class="list_data_seq center" style="flex: 1;">${dto.qBoardSeq}</div>
										<div class="list_data_category center" style="flex: 1;">
											<c:choose>
												<c:when test="${dto.qBoardCategory==1}">
															게임문의
														</c:when>
												<c:when test="${dto.qBoardCategory==2}">
															제휴문의
														</c:when>
												<c:when test="${dto.qBoardCategory==3}">
															기타문의
														</c:when>
											</c:choose>
										</div>
										<div class="list_data_writer center" style="flex: 1;">${dto.qBoardUserNickname}</div>
										<div class="list_data_title center" style="flex: 4.5;">
											<span>${dto.qBoardTitle}</span>
											<c:choose>
												<c:when test="${dto.qBoardSecret eq 'N'}">
													<i class="fa-solid fa-lock-open" style="margin-left: 5px;"></i>
												</c:when>
												<c:when test="${dto.qBoardSecret eq 'Y'}">
													<i class="fa-solid fa-lock" style="margin-left: 5px;"></i>
												</c:when>
											</c:choose>
										</div>
										<div class="list_data_date center" style="flex: 1.5;">
											<fmt:formatDate value="${dto.qBoardDate}"
												pattern="yyyy.MM.dd"></fmt:formatDate>
										</div>
										<c:choose>
											<c:when test="${dto.qBoardAnswer eq 'N'}">
												<div class="list_data_answer center" style="flex: 1; color:orangered">
													답변예정
												</div>
											</c:when>
											<c:when test="${dto.qBoardAnswer eq 'Y'}">
												<div class="list_data_answer center" style="flex: 1; color:dodgerblue">
													답변완료
												</div>
											</c:when>
										</c:choose>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="btns_container" style="flex: 0.7; width: 100%;">
				<button id="ask_btn" class="btn btn-primary"
					onclick="location.href='/gowrite.qboard'">글쓰기</button>
			</div>
			<div id="page_navi" class="page_container center"
				style="flex: 0.7; width: 100%;"></div>
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
					<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a> <a href="#"><i
						class="fab fa-youtube"></i></a>
				</div>
				<div class="coinbox">
					<img src="/image/coin.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<script>
				let searchBy="0";
				let searchData="0";
				$(document).ready(function () {
					//url파싱 스트링값을 변수로 처리하는 문제를 해결하기 위해
					const currentUrl = window.location.href;
					const url = new URL(currentUrl);

					const protocol = url.protocol; // 예: "https:"
					const host = url.host; // 예: "example.com"
					const pathname = url.pathname; // 예: "/path"
					const searchParams = url.searchParams;

					searchBy = searchParams.get('searchBy');
					searchData = searchParams.get('searchData'); 

					if(searchBy==null){
						searchBy="0";
						searchData="0";
					}

					let category = ${ category };
					let cpage = ${ cpage };
					let record_total_count = ${ record_total_count };
					let record_count_per_page = ${ record_count_per_page };
					let navi_count_per_page = ${ navi_count_per_page };

					let page_total_count = 0;
					if (record_total_count % record_count_per_page > 0) {
						page_total_count = Math.floor(record_total_count / record_count_per_page) + 1;
					} else {
						page_total_count = Math.floor(record_total_count / record_count_per_page);
					}

					let startNavi = Math.floor((cpage - 1) / navi_count_per_page) * navi_count_per_page + 1;
					let endNavi = startNavi + navi_count_per_page - 1;
					if (endNavi > page_total_count) { endNavi = page_total_count; }

					let needNext = true;
					let needPrev = true;

					if (startNavi == 1) { needPrev = false; }
					if (endNavi == page_total_count) { needNext = false; }

					if (needPrev == true) {
						let needPreva = $("<a>").attr("href", "/list.qboard?cpage=" + (startNavi - 1) + "&category=" + category + "&searchBy=" + searchBy + "&searchData=" + searchData).html(" < ");
						$("#page_navi").append(needPreva);
					}

					for (let i = startNavi; i <= endNavi; i++) {
						let pagesa = $("<a>").attr("href", "/list.qboard?cpage=" + i + "&category=" + category + "&searchBy=" + searchBy + "&searchData=" + searchData).html(i + "&nbsp;");
						$("#page_navi").append(pagesa);
					}

					if (needNext == true) {
						let needNexta = $("<a>").attr("href", "/list.qboard?cpage=" + (endNavi + 1) + "&category=" + category + "&searchBy=" + searchBy + "&searchData=" + searchData).html(" > ");
						$("#page_navi").append(needNexta);
					}
					
					//현재 게시판 표시하기
					if(category==0){
						$(".navi_total").css("border-bottom","2px solid white");
					}else if(category==1){
						$(".navi_game").css("border-bottom","2px solid white");
					}else if(category==2){
						$(".navi_collaboration").css("border-bottom","2px solid white");
					}else if(category==3){
						$(".navi_etc").css("border-bottom","2px solid white");
					}
					
					
					 // .dropdown-item을 클릭했을 때
		            $(".dropdown-item").on("click", function (e) {
		                e.preventDefault();
		                $("#searchToggle").html($(this).html());
		                searchBy = $(this).attr("data-searchBy");
		                //console.log(searchBy);
		            });

		            function performSearch() {
		                if ($("#searchToggle").text().trim() == "분류") {
		                    alert("카테고리를 선택해주세요.");
		                    return false;
		                }

		                if ($("#search_input").val() == "") {
		                    alert("검색어를 입력해주세요.");
		                    return false;
		                }

		                let category = ${category};
		                window.location.href = "/list.qboard?cpage=1&category=" + category + "&searchBy=" + searchBy + "&searchData=" + $("#search_input").val();
		            }

		            // 돋보기 이미지를 클릭할 때
		            $("#search_icon").on("click", function () {
		                performSearch();
		            });

		            // 엔터 버튼을 누를 때
		            $("#search_input").on("keydown", function (e) {
		                if (e.key == "Enter") {
		                    performSearch();
		                }
		            });
		            
				});

				$(document).on('click', '.naviAn', function (e) {
					e.preventDefault();
					let category = $(this).attr('data-categoryCode');
					window.location.href = "/list.qboard?cpage=1&category=" + category;
				});
				
	          
				
				

				

		



			</script>

</body>


</html>