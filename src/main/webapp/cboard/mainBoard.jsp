<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>유저게시판</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
}

body {
	background-color: #222;
}

div {
	/* border: 1px solid black; */
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	text-decoration: none;
	color: #d3d3d3;
}

input[type="text" i] {
	padding-block: 1px;
	padding-inline: 2px;
}

.header {
	height: 220px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: url('/image/background.png');
	background-size: cover;
}

.header .headerTitle {
	height: 150px;
	color: #ffffff;
	font-size: 32px;
	font-weight: bold;
	display: flex;
	align-items: center;
}

.header #headerTitle {
	margin-top: 70px;
}

.navi {
	position: relative;
	width: 100%;
	height: 80px;
	background: #111;
	border: 1px solid #5a5a64;
	border-left: 0;
	border-right: 0;
	text-align: center;
	font-size: 0;
}

.navi a {
	display: inline-block;
	margin: 0 25px;
	color: #898c92;
	font-size: 24px;
	line-height: 77px;
}

.navi .active {
	color: white;
	border-bottom: 2px solid white;
}

.content {
	position: relative;
	margin: 63px auto 0 auto;
	width: 1300px;
	min-height: 500px;
	background-color: #222;
	color: #d3d3d3;
}

.content h3 {
	font-size: 26px;
	line-height: 34px;
	font-weight: 500;
	color: white;
}

.community_header {
	position: relative;
	margin-top: 23px;
	width: 1300px;
	height: 58px;
	border-bottom: 1px solid #5a5a64;
}

.community_header select {
	width: 120px;
	height: 42px;
	background: #111;
	border: 1px solid #5a5a64;
	color: #d3d3d3;
	line-height: 39px;
	cursor: pointer;
	padding: 0 0 0 10px;
}

.community_header #searchInput {
	padding: 0;
	margin: 0;
	width: 200px;
	height: 42px;
	border: none;
	background: #111;
	color: #d3d3d3;
	border: 1px solid #5a5a64;
	border-right: 0;
	font-size: 14px;
	line-height: 53px;
	text-indent: 20px;
}

input:focus {
	outline: none;
}

select:focus {
	outline: none;
}

.community_header #searchForm {
	display: flex;
	justify-content: end;
	align-items: center;
}

.community_header #searchBtn {
	height: 42px;
	background: #111;
	color: #d3d3d3;
	border: 1px solid #5a5a64;
	border-left: 0;
}

.boardList {
	position: relative;
	width: 1300px;
	border-top: 1px solid #5a5a64;
	clear: both;
}

.boardList ul {
	display: flex;
	align-items: center;
	padding: 17px 0 16px 0;
	border-bottom: 1px solid #5a5a64;
	list-style-type: none;
	margin-bottom: 0;
}

.board_list ul li {
	color: #898c92;
	font-size: 14px;
	font-weight: 400;
}

.boardList ul li.category_type {
	margin: 0;
	width: 100px;
	font-weight: 500;
	text-align: center;
}

.boardList ul li.title {
	width: 680px;
	text-align: left;
	color: #36393f;
	font-size: 15px;
	cursor: pointer;
}

.boardList ul li.author {
	width: 180px;
}

.boardList ul li.date {
	width: 160px;
	text-align: center;
}

.boardList ul li.view {
	width: 110px;
	padding-left: 24px;
	text-align: left;
}

.boardList ul li.bookmark {
	width: 90px;
	padding-left: 21px;
	text-align: left;
}

.btnBox {
	margin-top: 30px;
	display: flex;
	justify-content: end;
}

.btnBox #writeBtn {
	width: 160px;
	height: 45px;
	background: #3392ff;
	color: white;
	border: 1px solid #1A6ED8;
	font-size: 13px;
	font-weight: bold;
}

.pageNavi {
	margin-top: 40px;
	display: flex;
	justify-content: center;
	"
	src
	/main/java/dao/CBoardDAO.java"
	font-size
	:
	20px;
}

.pageNavi a {
	display: inline-block;
	padding: 0 10px;
	min-width: 38px;
	height: 36px;
	line-height: 35px;
	font-size: 14px;
}

.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	height: 70px;
	background-color: #323232;
}

.navbar-brand {
	color: white;
}

.nav-link {
	color: white !important;
}

.nav-link:hover {
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 10px;
}

.btn {
	color: white;
}

.btn:hover {
	color: white;
}

.dropdown-menu {
	background-color: #323232;
}

.dropdown-item {
	background-color: #323232;
	color: white;
}

.footer {
	height: 150px;
	margin-top: 160px;
	border-top: 1px solid #e0e2ec;
	background-color: #323232;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	bottom: 0;
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
	<div class="header">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">

				<a class="navbar-brand" href="/index.jsp"><img
					src="/image/headerlogo.png" alt=""
					style="width: 80px; height: 60px;"></a>
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
								aria-expanded="false">게임</button>

							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">game1</a></li>
								<li><a class="dropdown-item" href="#">game2</a></li>
								<li><a class="dropdown-item" href="#">game3</a></li>
								<li><a class="dropdown-item" href="#">game4</a></li>
								<li><a class="dropdown-item" href="#">game5</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<button class="btn dropdown-toggle" data-bs-toggle="dropdown"
								aria-expanded="false">게시판</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/list.nboard">공지사항</a></li>
								<li><a class="dropdown-item" href="/list.cboard">커뮤니티</a></li>
								<li><a class="dropdown-item" href="/list.review">게임리뷰</a></li>
								<li><a class="dropdown-item" href="/list.qboard">Q&A게시판</a></li>
								<li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>

							</ul>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/list.playrecord">랭킹</a></li>


					</ul>
					<c:choose>
						<c:when test="${not empty loginId}">
							<ul class="navbar-nav ms-auto">

								<c:if test="${isAdmin eq true}">
									<li class="nav-item"><a class="nav-link"
										href="/dashBoard.admin">관리자페이지</a></li>
								</c:if>
								<li class="nav-item"><a class="nav-link"
									href="/logout.member">로그아웃</a></li>

								<li class="nav-item"><a class="nav-link"
									href="/mypage.member"> <img
										src="/profile/${userProfileUrl}" class="rounded-circle"
										width="40" height="40" alt="Profile">
								</a></li>


							</ul>
						</c:when>
						<c:otherwise>
							<ul class="navbar-nav ms-auto">
								<li class="nav-item"><a class="nav-link"
									href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</nav>
		<div class="headerTitle">
			<p id="headerTitle">커뮤니티</p>
		</div>
	</div>
	<div class="navi">
		<a href="/list.cboard?category=0" id="viewAll">전체</a> <a
			href="/list.cboard?category=1" id="viewC1">자유</a> <a
			href="/list.cboard?category=2" id="viewC2">공략</a>
	</div>
	<div class="content">
		<h3 id="boardTitleH3">전체</h3>
		<div class="community_header">
			<form action="/searchList.cboard" id="searchForm">
				<select name="searchType" class="typeBox" id="searchType">
					<option value="">검색 유형</option>
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select> <input type="text" id="searchInput" name="searchInput"
					autocomplete="off">
				<button id="searchBtn">
					<i class="fa-solid fa-magnifying-glass" style="color: #d3d3d3;"></i>
				</button>
				<input type="hidden" name="category" id="srcCategoryInput">
			</form>
		</div>
		<div class="boardList" data-category="${category}">
			<c:choose>
				<c:when test="${fn:length(list) == 0}">
					<p style="text-align: center; margin-top: 10px;">표시될 내용이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="DTO" items="${list}">
						<ul class="post">
							<c:choose>
								<c:when test="${DTO.cBoardCategory == 1}">
									<li class="category_type">자유</li>
								</c:when>
								<c:otherwise>
									<li class="category_type">공략</li>
								</c:otherwise>
							</c:choose>
							<li class="title" data-no="1224"><a
								href="/detail.cboard?category=${category}&cpage=${cpage}&seq=${DTO.cBoardSeq}">${DTO.cBoardTitle}</a>
							</li>
							<li class="author">${DTO.userNickname}</li>
							<li class="date"><fmt:formatDate value="${DTO.cBoarDate}"
									pattern="yy. MM. dd" /></li>
							<li class="view"><i class="fa-regular fa-eye"
								style="color: #d3d3d3;"></i> ${DTO.cBoardView}</li>
							<li class="bookmark"><i class="fa-regular fa-bookmark"
								style="color: #d3d3d3;"></i> ${DTO.cBoardBookmark}</li>
						</ul>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="btnBox">
			<button type="button" id="writeBtn">글쓰기</button>
		</div>
		<div class="pageNavi"></div>
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
		$("#writeBtn").on("click", function(e){
			if(${loginId == null}){
				alert("로그인 후 이용해주세요!");
				e.preventDefault();
			}else{
				location.href = "/goWrite.cboard";
			}
		});
		
		$("#searchForm").on("submit", function(e){
			if($("#searchType").val() == ""){
				alert("검색 유형을 선택해주세요!");
				e.preventDefault();
			}else if($("#searchInput").val() == ""){
				alert("검색어를 입력해주세요!");
				e.preventDefault();
			}else{
				$("#srcCategoryInput").val($(".boardList").attr("data-category"));
			}
		});
		
		function getNaviString() {
			let currentPage = ${cpage}
			let recordTotalCount = ${record_total_count}
			let recordCountPerPage = ${record_count_per_page}
			let naviCountPerPage = ${navi_count_per_page}
			
			let pageTotalCount = 0;
			if (recordTotalCount % recordCountPerPage == 0) {
				pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage);
			} else {
				pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage) + 1;
			}
			
			let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
			let endNavi = startNavi + naviCountPerPage - 1;
			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			
			let needNext = true;
			let needPrev = true;
			
			if(pageTotalCount <= naviCountPerPage) {
				needPrev = false;
				needNext = false;
			}else if (startNavi == 1) {
				needPrev = false;
			} else if (endNavi == pageTotalCount) {
				needNext = false;
			}
			
			let naviString = "";
			if (needPrev) {
				if(${isSearchedList == 1}){
					naviString = naviString + "<a href = '/searchList.cboard?searchType=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=1'>《</a>";
					naviString = naviString + "<a href = '/searchList.cboard?searchType=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + (startNavi - 1) + "'>〈</a>";
				}else{
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=1'>《</a>";
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + (startNavi - 1) + "'>〈</a>";
				}				
			}
			for (let i = startNavi; i <= endNavi; i++) {
				if(${isSearchedList == 1}){
					if(i == currentPage){
						naviString = naviString + "<a class='text-reset fw-bold' href = '/searchList.cboard?searchType=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + i + "'>" + i + "</a> ";
					}else{
						naviString = naviString + "<a class='text-reset' href = '/searchList.cboard?searchType=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + i + "'>" + i + "</a> ";
					}
				}else{
					if(i == currentPage){
						naviString = naviString + "<a class='text-reset fw-bold' href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + i + "'>" + i + "</a> ";
					}else{
						naviString = naviString + "<a class='text-reset' href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + i + "'>" + i + "</a> ";
					}
				}
				
			}
			if (needNext) {
				if(${isSearchedList == 1}){
					naviString = naviString + "<a href = '/searchList.cboard?searchType=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + (endNavi + 1) + "'>〉</a>";
					naviString = naviString + "<a href = '/searchList.cboard?searchType=" + "${searchType}" + "&searchInput=" + "${searchInput}" + "&category=${category}" + "&cpage=" + pageTotalCount + "'>》</a>";
				}else{
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + (endNavi + 1) + "'>〉</a>";
					naviString = naviString + "<a href = '/list.cboard?" + "category="+ $(".boardList").attr("data-category") + "&cpage=" + pageTotalCount + "'>》</a>";
				}
			}
			
			return naviString;
		};
		
		$(document).ready(function(){
			let naviString = getNaviString();
			$(".pageNavi").html(naviString);
			
			if ($(".boardList").attr("data-category") == 1){
				$("#viewC1").addClass("active");
				$("#boardTitleH3").html("자유");
			}else if($(".boardList").attr("data-category") == 2){
				$("#viewC2").addClass("active");
				$("#boardTitleH3").html("공략");
			}else{
				$("#viewAll").addClass("active");
				$("#boardTitleH3").html("전체");
			}
			
			if(${searchType == "title"}){
				$("#searchType").val("title");
			}else if(${searchType == "writer"}){
				$("#searchType").val("writer");
			}
			$("#searchInput").val("${searchInput}");
		});
    </script>
</body>
</html>