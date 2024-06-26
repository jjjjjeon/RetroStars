<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${game.gameTitle}- Steam</title>
<link rel="stylesheet"
	href="https://webfontworld.github.io/daegu/DalseoHealing.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.80.1/phaser.min.js"></script>
<script src="/gboard/game1/main.js"></script>
<script src="/gboard/game2/Game.js"></script>
<script src="/gboard/game2/GameOver2.js"></script>
<script src="/gboard/game3/Exam03.js"></script>
<script src="/gboard/game3/GameOver3.js"></script>
<script src="/gboard/game4/Intro.js"></script>
<script src="/gboard/game4/Exam02.js"></script>
<script src="/gboard/game4/GameOver4.js"></script>
<script src="/gboard/game5/survival-game.js"></script>
<script src="/gboard/game5/MainScene.js"></script>
<script src="/gboard/game5/GameOver5.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	font-family: 'DalseoHealing';
	background-image: url('/image/background.png');
	background-position: center;
	background-size: 100% 100%;
	color: white;
	flex-direction: column;
	min-height: 100vh;
}

.navbar {
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

.nav-item {
	align-items: center;
	display: flex;
}

.btn {
	color: white;
}

.btn:hover {
	color: white;
}

.dropdown-menu {
	background-color: #323232;
	text-align: center; /* 중앙 정렬을 위한 설정 */
	width: 100%; /* 너비를 100%로 설정 */
}

.dropdown-item {
	background-color: #323232;
	color: white;
}

a {
	text-decoration: none !important;
}

a:link {
	color: white;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: white;
	text-decoration: underline;
}
/*    end navbar css */
.footer {
	width: 100%;
	background-color: #323232;
	position: relative;
	margin-top: auto;
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

.thumbnail {
	border-radius: 20px;
	width: 356px;
	height: 230px;
	object-fit: cover;
}

nav {
	background-color: #323232;
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

.container {
	margin: 20px auto;
	width: 90%;
	flex-grow: 1;
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

.nav-menu {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 5px;
}

.bookmark-menu {
	display: flex;
	justify-content: center;
	gap: -30px;
	padding: -10px 0;
	border-radiuse: 10px;
	margin-bottom: -40px;
	position: relative;
	top: -10px;
	z-index: 999;
}

.bookmark-item {
	padding: 10px 20px;
	background-color: #b86ded;
	border-radius: 30px 30px 0px 0px;
	color: white;
	border: 1px solid #3a4b58;
	cursor: pointer;
	position: relative;
	display: flex;
	align-items: center;
	height: 50px;
}

.bookmark-item:hover, .bookmark-item.active {
	background-color: #2a475e;
	border-color: #2a475e;
}

.bookmark-item:hover::before, .bookmark-item.active::before {
	background-color: #b86ded;
}

.community-button {
	background-color: #2a475e;
	color: #c7d5e0;
	border: 1px solid #3a4b58;
	border-radius: 5px;
	padding: 5px 10px;
	text-decoration: none;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.community-button .bookBtn {
	background-color: #c6d4df;
}

.community-button:hover {
	background-color: #3a4b58;
}

#addGameBookmarkBtn {
	background-color: #F4A261;
	opacity: 0.8;
	color: black;
	!
	important
}

#goToCBoard {
	color: black;
	background-color: #E9C46A;
}

#gameBtn {
	background-color: #6fa720;
}

.steamBtn {
	background-color: #6fa720;
}

.main-content {
	display: flex;
	gap: 20px;
	height: 750px
}

.review-content {
	display: flex;
	gap: 20px;
	margin-top: 20px;
}

.media-section {
	flex: 9;
	background-color: #2a475e;
	padding: 20px;
	border: 1px solid #3a4b58;
	border-radius: 5px;
}

.description-section {
	flex: 1;
	background-color: #2a475e;
	padding: 20px;
	border: 1px solid #3a4b58;
	border-radius: 5px;
}

.media-container {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
	background-color: #faf8f0;
	margin-bottom: 20px;
}

.media-container iframe, .media-container img, .media-container video,
	.media-container #game {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.media-thumbnails {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.media-thumbnails .thumbnail {
	width: 100px;
	height: 56px;
	cursor: pointer;
	border: 2px solid transparent;
	object-fit: cover;
}

.media-thumbnails .thumbnail.active {
	border-color: #007bff;
}

.buttons {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 20px;
}

.buttons button {
	width: 100px;
}

a {
	text-decoration: none !important;
}

.modal-dialog {
    max-width: 60%;
    margin: 15rem auto;
}

.modal-content {
    color: black;
    background-color: #2a475e;
    color: white;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #3a4b58;
    border-bottom: 1px solid #dee2e6;
    padding: 1rem 1rem;
    border-top-left-radius: 0.3rem;
    border-top-right-radius: 0.3rem;
    color: white;
}

.modal-body {
    position: relative;
    flex: 1 1 auto;
    padding: 1rem;
}

.bookmark-active {
	background-color: yellow;
	color: black;
}

#gameBtnBehind {
	margin-bottom: 30px;
}

.review {
	margin-top: 20px;
	margin-left: 20px;
}

.like-button, .dislike-button {
	cursor: pointer;
}

.button-container {
	text-align: center;
	margin : 0 auto;
	margin-top: 70px; 
}
</style>
</head>
<body>
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
							<li><a class="dropdown-item"
								href="/viewGame.gboard?gameSeq=1">2048</a></li>
							<li><a class="dropdown-item"
								href="/viewGame.gboard?gameSeq=2">GOLD BREAK!</a></li>
							<li><a class="dropdown-item"
								href="/viewGame.gboard?gameSeq=3">ICE CUBY</a></li>
							<li><a class="dropdown-item"
								href="/viewGame.gboard?gameSeq=4">똥 피하기</a></li>
							<li><a class="dropdown-item"
								href="/viewGame.gboard?gameSeq=5">탈출하기</a></li>
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
								href="/mypage.member"> <img src="/profile/${userProfileUrl}"
									class="rounded-circle" width="40" height="40" alt="Profile">
							</a></li>


						</ul>
					</c:when>
					<c:otherwise>
						<ul class="navbar-nav ms-auto">
							<li class="nav-item"><a class="nav-link"
								href="/member/login/login.jsp"><i class="fas fa-user"></i></a></li>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</nav>

	<div class="container">
		<div class="nav-menu">
			<div class="bookmark-menu">
				<c:forEach var="gameItem" items="${listGame}">
					<div
						class="bookmark-item ${gameItem.gameSeq == game.gameSeq ? 'active' : ''}"
						data-game-seq="${gameItem.gameSeq}">${gameItem.gameTitle}</div>
				</c:forEach>
			</div>
			<a href="/list.cboard?category=1" class="community-button">커뮤니티</a>
		</div>
		<div class="main-content">
			<div class="media-section">
				<div class="media-container" id="media-container">
					<c:choose>
						<c:when test="${not empty videoUrl}">
							<video src="/upload/${videoUrl}" controls autoplay muted loop></video>
						</c:when>
						<c:otherwise>
							<img src="/image/default_image.jpg" alt="Game Image"
								id="main-media">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="media-thumbnails">
					<c:forEach var="image" items="${images}">
						<img src="/upload/${image}" alt="Thumbnail" class="thumbnail"
							data-type="image" data-media="/upload/${image}">
					</c:forEach>
					<c:if test="${not empty videoUrl}">
						<video src="/upload/${videoUrl}" alt="Thumbnail Video"
							class="thumbnail" data-type="video"
							data-media="/upload/${videoUrl}"></video>
					</c:if>

				</div>
				<div class="button-container">
					<button id="writeReviewBtn" class="btn steamBtn">리뷰 작성</button>
					<button id="viewReviewBtn" class="btn steamBtn"
						onclick="window.location.href='/list.review?gameSeq=${game.gameSeq}'">리뷰
						보러가기</button>
				</div>
			</div>
			<div id="description" class="description-section">
				<div class="media-container">
					<img src="/upload/${images.get(0)}" alt="Game Description Image">
				</div>
				<p>${game.gameDesc}</p>
				<p>
					RELEASE DATE:
					<fmt:formatDate value="${game.releaseDate}" pattern="dd MMM, yyyy" />
				</p>
				<p>DEVELOPER: ${game.developer}</p>
				<div id="gameBtnBehind" class="buttons">
					<button class="btn community-button bookBtn"
						id="addGameBookmarkBtn">${isBookmarked ? '★' : '찜하기'}</button>
					<a href="/list.cboard?category=2"><button
							class="btn community-button" id="goToCBoard">공략보기</button></a>
					<button class="btn community-button gameBtn" id="gameBtn">게임하기</button>
				</div>
				<p style="color: #c0c0c0">가장 평가가 많은 리뷰
				<p>
			</div>
		</div>
		<!--         <div class="review-content"> -->
		<!--             <div class="media-section" id="mostLikedReviewSection">가장 평가가 많은 리뷰</div> -->
		<!--             <div class="description-section"> -->
		<!--                 <p>가장 최근에 게시된 리뷰</p> -->
		<!--                 <p>RELEASE DATE: 14 June, 2024</p> -->
		<!--                 <p>DEVELOPER: 팀 별빛</p> -->
		<!--                 <p>PUBLISHER: 팀 별빛</p> -->
		<!--                 <p>게임 장르: 무료 플레이, 픽셀 그래픽, RPG, 인디, 어드벤처</p> -->
		<!--                 <div class="buttons"> -->
		<!--                     <button class="btn community-button">찜하기</button> -->
		<!--                     <button class="btn community-button">팔로우</button> -->
		<!--                     <button class="btn community-button gameBtn" id="gameBtn">게임하기</button> -->
		<!--                 </div> -->
		<!--             </div> -->
		<!--         </div> -->
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

    <div class="modal fade" id="reviewModal" tabindex="-1"
        aria-labelledby="reviewModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reviewModalLabel">리뷰 작성</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="reviewForm">
                        <div class="mb-3">
                            <label for="reviewContent" class="form-label">리뷰 내용</label>
                            <textarea class="form-control" id="reviewContent" rows="5" placeholder="리뷰 작성은 한글, 영어로 30자까지만 가능합니다."></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" style="float: right;">작성 완료</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<script>
        $(document).ready(function() {
        
        	let loginId = '${loginId}';
        	console.log(loginId);
        	
            function updateReviewLike(reviewSeq, type) {
                if (loginId === '') {
                    alert("로그인 해주세요.");
                } else {
                    $.ajax({
                        url: "/updateReviewLike.review",
                        method: "POST",
                        data: { reviewSeq: reviewSeq, type: type },
                        dataType: "json"
                    }).done(function(response) {
                        if (response.result === "success") {
                            let countSpan = $("#" + type + "-count-" + reviewSeq);
                            countSpan.text(parseInt(countSpan.text()) + 1);
                            alert("리뷰가 성공적으로 업데이트 되었습니다.");
                        } else if (response.result === "duplicate") {
                            alert("이미 해당 리뷰를 평가하셨습니다.");
                        } else {
                            alert("리뷰 업데이트에 실패했습니다.");
                        }
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.error("에러: " + textStatus, errorThrown);
                        alert("리뷰 업데이트 중 오류가 발생했습니다.");
                    });
                }
            }
        	
            function loadReviews() {
                $.ajax({
                    url: "/mostLiked.review",
                    method: "GET",
                    dataType: "json",
                    data: {
                        gameSeq: ${game.gameSeq}
                    }
                }).done(function(data) {
                    console.log(data);
                    console.log("Profile URL: ", data.profileUrl);
                    let description = $('#description');
                    let gameBtnBehind = $('#gameBtnBehind');
                    let mostLikedReviewSection = $('#mostLikedReviewSection');
                    let icon = '';

                    if (data.reviewLike >= data.reviewDislike && data.reviewLike >= data.reviewFunny) {
                        icon = '<i class="fas fa-thumbs-up"></i>';
                    } else if (data.reviewDislike > data.reviewLike && data.reviewDislike >= data.reviewFunny) {
                        icon = '<i class="fas fa-thumbs-down"></i>';
                    } 
					
                    let reviewDiv = $('<div>').addClass('review');

                    let reviewHeaderDiv = $('<div>').addClass('review-header');
                    let reviewUserInfoDiv = $('<div>').addClass('review-user-info');
                    let userProfileImg = $('<img>').attr({
                    	src: `/profile/`${data.profileUrl},
                        class: 'rounded-circle',
                        width: 40,
                        height: 40,
                        alt: 'Profile'
                    });
                    let userNicknameDiv = $('<div>').text(data.userNickname);

                    reviewUserInfoDiv.append(userProfileImg, userNicknameDiv);
                    let reviewIconDiv = $('<div>').addClass('review-icon').html(icon);

                    reviewHeaderDiv.append(reviewUserInfoDiv, reviewIconDiv);

                    let reviewDateDiv = $('<div>').addClass('review-date').text(data.reviewDate);
                    let reviewContentDiv = $('<div>').addClass('review-content').text(data.reviewContent);

                    let reviewHelpfulDiv = $('<div>').addClass('review-helpful').html('리뷰가 도움이 되었나요?');


                    reviewDiv.append(reviewHeaderDiv, reviewDateDiv, reviewContentDiv, reviewHelpfulDiv);

                    description.append(reviewDiv);
                });


            }

            loadReviews();

            $(document).on('click', '.bookmark-item', function() {
                let gameSeq = $(this).data('game-seq');
                window.location.href = "/viewGame.gboard?gameSeq=" + gameSeq;
            });

            $(document).on('click', '.thumbnail', function() {
                $('.thumbnail.active').removeClass('active');
                $(this).addClass('active');

                let mediaContainer = $('#media-container');
                mediaContainer.empty();

                let mediaType = $(this).data('type');
                let mediaSrc = $(this).data('media');

                if (mediaType === 'image') {
                    let img = $('<img>').attr('src', mediaSrc).attr('alt', 'Game Image');
                    mediaContainer.append(img);
                } else if (mediaType === 'video') {
                    let video = $('<video>').attr('src', mediaSrc).attr('controls', true).attr('autoplay', true);
                    mediaContainer.append(video);
                }
            });

            $("#addGameBookmarkBtn").on("click", function() {
                if (loginId === '') {
                    alert("로그인 해주세요.");
                } else {
                    $.ajax({
                        url: "/toggleGameBookmark.gboard",
                        method: "POST",
                        data: {
                            gameSeq: ${game.gameSeq}
                        }
                    }).done(function(response) {
                        if (response === "added") {
                            $("#addGameBookmarkBtn").addClass("bookmark-active").text('★');
                        } else if (response === "removed") {
                            if (confirm("북마크를 취소하시겠습니까?")) {
                                $("#addGameBookmarkBtn").removeClass("bookmark-active").text('찜하기');
                                alert("북마크 취소 완료.");
                            } else {
                               
                                $.ajax({
                                    url: "/toggleGameBookmark.gboard",
                                    method: "POST",
                                    data: {
                                        gameSeq: ${game.gameSeq}
                                    }
                                }).done(function() {
                                    $("#addGameBookmarkBtn").addClass("bookmark-active").text('★');
                                    alert("북마크가 유지되었습니다.");
                                });
                            }
                        }
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.error("에러: " + textStatus, errorThrown);
                        alert("북마크 추가 중 오류가 발생했습니다.");
                    });
                }
            });

            $("#writeReviewBtn").on("click", function(){
                if (loginId === '') {
                    alert("로그인 해주세요.");
                } else {
                    $("#reviewModal").modal("show");
                }
            });

            $("#reviewForm").on("submit", function(e) {
                e.preventDefault();
                let reviewContent = $("#reviewContent").val();
                if (reviewContent.length > 30) {
                    alert("리뷰는 30자까지만 작성해주세요.");
                } else {
                    $.ajax({
                        url: "/addReview.review",
                        method: "POST",
                        dataType: "json",
                        data: {
                            gameSeq: ${game.gameSeq},
                            reviewContent: reviewContent
                        }
                    }).done(function(response) {
                        if(response.result === "success") {
                            alert("리뷰가 성공적으로 등록되었습니다.");
                            $("#reviewModal").modal("hide");
                        } else {
                            alert("리뷰 등록에 실패했습니다.");
                        }
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.error("에러: " + textStatus, errorThrown);
                        alert("리뷰 등록 중 오류가 발생했습니다.");
                    });
                }
            });
            


            let game;
            
            

            $("#gameBtn").on("click", function() {
                if (loginId === '') {
                    alert("로그인 해주세요.");
                } else {
                	
                
                let mediaContainer = $('#media-container');
                mediaContainer.empty();
                mediaContainer.append('<div id="game" style="padding-bottom: 20px;"></div>');

                let containerWidth = mediaContainer.width();
                let containerHeight = mediaContainer.height();
                console.log(containerWidth);
                console.log(containerHeight);

                if (!containerWidth || containerWidth <= 0) {
                    containerWidth = 500;  
                }
                if (!containerHeight || containerHeight <= 0) {
                    containerHeight = 600; 
                }

                let config = {
                    type: Phaser.AUTO,
                    width: containerWidth,
                    height: containerHeight,
                    parent: "game",
                    backgroundColor: "#faf8f0",
                    scene: []
                };

                switch (${game.gameSeq}) {
                    case 1:
                    	$("#media-container").css("padding-bottom", "");
                    	$("#media-container").css("height", "600px");
                    	$("#game").css("position", "static");
                    	$("#game").css("top", "");
                    	$("#game").css("left", "");
                    	$("#game").css("width", "500px");
                    	$("#game").css("height", "600px");
                    	$("#game").css("margin", "auto");
                    	
                        config = {
                            type: Phaser.AUTO,
                            width: 500,
                            height: 600,
                            parent: "game",
                            backgroundColor: "#faf8f0",
                            scene: [Main]
                        };
                        
                        break;
                    case 2:
                        config = {
                            type: Phaser.AUTO,
                            parent: "game",
                            width: containerWidth,
                            height: containerHeight,
                            physics: {
                                default: 'arcade',
                                arcade: {
                                    gravity: { y: 0 }
                                    //,debug: true
                                }
                            },
                            scene: [Game, GameOver2]
                        };
                        break;
                    case 3:
                        config = {
                            type: Phaser.AUTO,
                            parent: "game",
                            width: containerWidth,
                            height: containerHeight,
                            physics: {
                                default: "arcade",
                                arcade: {
                                    //gravity: { y: 1000 }, // 중력 속성 차이점 갈수록 빨라질 수 있다.
                                    //debug: true
                                }
                            },
                            scene: [Exam03, GameOver3]
                        };
                        break;
                    case 4:
                        config = {
                            type: Phaser.AUTO,
                            parent: "game",
                            width: containerWidth,
                            height: containerHeight,
                            physics: {
                                default: "arcade",
                                arcade: {
                                    //gravity: { y: 1000 }, // 중력 속성 차이점 갈수록 빨라질 수 있다.
                                    //debug: true
                                }
                            },
                            scene: [Intro, Exam02, GameOver4]
                        };
                        break;
                    case 5:
                    	 config = {
                            type: Phaser.AUTO,
                            parent: "game",
                            width: containerWidth,
                            height: containerHeight,
                    	    physics: {
                    	        default: 'matter',
                    	        matter: {
                    	            debug: false,
                    	            gravity: { y: 0 },
                    	        }
                    	    },
                    	    scene: [MainScene, GameOver5]
                    	};
                        break;
                    default:
                        config = {
                            type: Phaser.AUTO,
                            width: containerWidth,
                            height: containerHeight,
                            parent: "game",
                            backgroundColor: "#faf8f0",
                            scene: [Main]
                        };
                        break;
                }

                if (game) {
                    game.destroy(true);
                }

                game = new Phaser.Game(config);
                }
            });
            
            

        });
    </script>
</body>
</html>
