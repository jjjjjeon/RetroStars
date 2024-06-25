<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    * {
        box-sizing: border-box;
        margin: 0;
    }

   body{
      background-color : #222; 
/*       color: #d3d3d3; */
		color:white;
        font-family : 'DalseoHealing';
        display: flex;
        flex-direction: column;
        
    }

    div {
        font-family : 'DalseoHealing';
    }

    a {
        text-decoration: none;
        color: #d3d3d3;
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
         text-align: center; 
         width: 100%; 
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

    .header {
        height: 250px;
        display: flex;
        justify-content: center;
        align-items: center;
        background-image: url('/image/background.png');
        background-size: cover;
        font-size : 20px;
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
        font-size:30px;
    }

    .navi {
        position: relative;
        width: 100%;
        height: 80px;
        background: #111;
        border-left: 0;
        border-right: 0;
        text-align: center;
        font-size: 0;
        margin-bottom : 50px;
    }

    .navi a {
        display: inline-block;
        margin: 0 25px;
        color: white;
        font-size: 20px;
        line-height: 77px;
    }

    .navi .active {
       color: white;
       border-bottom: 2px solid white;
   }

    .content {
        flex: 1;
        width: 1280px;
        margin: 30px auto;
        color: #d3d3d3;
        padding: 20px;
        border-radius: 10px;
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 10px;
        border-bottom: 1px solid #5a5a64;
    }

    .review-header h3 {
        color: white;
        font-size:15px;
    }

    .review-list {
/*         margin-top: 20px; */
    }

    .review-item {
        padding: 20px;
        border-bottom: 1px solid #313131;
    }

    .review-item:last-child {
        border-bottom: none;
    }

    .review-item .review-author {
        display: flex;
        align-items: center;
        font-size: 14px;
        margin-top: 10px;
    }

    .review-item .review-author img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .review-item .review-date {
        font-size: 12px;
        color: #888;
    }

    .review-item .review-text {
    	margin: 10px 0;
    	font-size: 18px;
    	font-weight: bold;
    	background-color: #b4bdd433;
    	height: 80px;
    	border-radius: 20px;
    	padding: 10px;
    	color:white;
    }

    .review-item .review-rating {
        color: #f5c518;
    }

    .review-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }
	.delete-review-btn{
	    width: 60px;
    	height: 40px;
    	border: none;
    	border-radius: 20px;
    	font-weight: bold;
    	background-color:black;
    	color:white;
	}
	.delete-review-btn:hover{
		background-color:white;
		color:black;
		transition:0.2s;
	}
    .sort-buttons {
        display: flex;
        gap: 10px;
    }

    .sort-buttons button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    
    #sortLikes{
    	background-color : #007bff;
    	opacity : 0.8;
    }
    
    #sortDislikes{
    	background-color: #ff463e;
    	opacity : 0.8;
    }


    .sort-buttons button.active {
        opacity : 1;
    }

    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination a {
        margin: 0 5px;
        padding: 5px 10px;
        background-color: #595959;
        color:white;
		font-weight:bold;
        text-decoration: none;
        border-radius: 5px;
    }

    .pagination a.active {
        background-color: white;
        color:black;
    }

    .footer {
        width: 100%;
        background-color: #323232;
        height: 150px;
        display: flex;
        justify-content: center;
        align-items: center;
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
    
    .like{
    	backgroud-color : blue;
    }
    
     .dislike{
    	backgroud-color : red;
    } 
    
    #likeImg{
    	width:40px;
    	height:40px;
    }
    #dislikeImg{
    	width:40px;
    	height:40px;
    }      
    
     .like-button, .dislike-button {
        cursor: pointer;
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


    <div class="header">
		<p id="headerTitle">리뷰게시판</p>
    </div>

	<div class="navi">
	    <a href="/list.review" class="${empty param.gameSeq ? 'active' : ''}">전체</a>
	    <a href="/list.review?gameSeq=1" class="${param.gameSeq == '1' ? 'active' : ''}">2048</a>
	    <a href="/list.review?gameSeq=2" class="${param.gameSeq == '2' ? 'active' : ''}">GOLD BREAK!</a>
	    <a href="/list.review?gameSeq=3" class="${param.gameSeq == '3' ? 'active' : ''}">ICE CUBY</a>
	    <a href="/list.review?gameSeq=4" class="${param.gameSeq == '4' ? 'active' : ''}">똥 피하기</a>
	    <a href="/list.review?gameSeq=5" class="${param.gameSeq == '5' ? 'active' : ''}">탈출하기</a>
	</div>

    <div class="content">
        <div class="review-header">
            <h3>${empty param.gameSeq ? '전체' : param.gameSeq} 리뷰</h3>
            <div class="sort-buttons">
                <button id="sortLikes" class="${sortType == 'review_like' ? 'active' : ''}">좋아요 많은 순</button>
                <button id="sortDislikes" class="${sortType == 'review_dislike' ? 'active' : ''}">싫어요 많은 순</button>
            </div>
        </div>
        <div class="review-list">
            <c:choose>
                <c:when test="${fn:length(list) == 0}">
                    <p style="text-align:center; margin-top : 10px;">표시될 내용이 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="review" items="${list}">
                        <div class="review-item">
                            <div class="review-author">
                                <img src="/upload/${review.profileUrl}" alt="Profile">
                                ${review.userNickname}
                            </div>
                            <div class="review-date"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/></div>
                            <div class="review-text">
                                ${review.reviewContent}
                            </div>
                            <div class="review-rating">
                                <c:forEach var="i" begin="1" end="5">
                                    <i class="fas fa-star"></i>
                                </c:forEach>
                            </div>
							<div class="review-footer">
							    <div>
							        <span>좋아요: <span id="like-count-${review.reviewSeq}">${review.reviewLike}</span></span> |
							        <span>싫어요: <span id="dislike-count-${review.reviewSeq}">${review.reviewDislike}</span></span>
							    </div>
							    <div>
							        <c:choose>
							            <c:when test="${not empty loginId}">
							                <img id="likeImg" src="/upload/like.png" alt="좋아요" class="like-button" data-review-seq="${review.reviewSeq}">
							                <img id="dislikeImg" src="/upload/dislike.png" alt="싫어요" class="dislike-button" data-review-seq="${review.reviewSeq}">
							            </c:when>
							            <c:otherwise>
							                <img id="likeImg" src="/upload/like.png" alt="좋아요" class="like-button" data-logged-in="false">
							                <img id="dislikeImg" src="/upload/dislike.png" alt="싫어요" class="dislike-button" data-logged-in="false">
							            </c:otherwise>
							        </c:choose>
							        <c:if test="${isAdmin}">
							            <button class="delete-review-btn" data-review-seq="${review.reviewSeq}">삭제</button>
							        </c:if>
							    </div>
							</div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${reviewCount / 10 + (reviewCount % 10 == 0 ? 0 : 1)}">
                <a href="/list.review?cpage=${i}&sortType=${sortType}&gameSeq=${gameSeq}" class="${cpage == i ? 'active' : ''}">${i}</a>
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

    <script>
    $(document).ready(function() {
        $("#sortLikes").on("click", function() {
            let gameSeq = new URLSearchParams(window.location.search).get('gameSeq');
            let url = gameSeq ? `/list.review?sortType=review_like&gameSeq=${gameSeq}` : "/list.review?sortType=review_like";
            window.location.href = url;
        });

        $("#sortDislikes").on("click", function() {
            let gameSeq = new URLSearchParams(window.location.search).get('gameSeq');
            let url = gameSeq ? `/list.review?sortType=review_dislike&gameSeq=${gameSeq}` : "/list.review?sortType=review_dislike";
            window.location.href = url;
        });

        $(".delete-review-btn").on("click", function() {
            let reviewSeq = $(this).data("review-seq");
            if (confirm("정말로 이 리뷰를 삭제하시겠습니까?")) {
                $.ajax({
                    url: "/deleteReview.review",
                    method: "POST",
                    data: { reviewSeq: reviewSeq },
                    success: function(response) {
                        if (response.result === "success") {
                            alert("리뷰가 삭제되었습니다.");
                            location.reload();
                        } else {
                            alert("리뷰 삭제에 실패했습니다.");
                        }
                    }
                });
            }
        });

        $(".like-button").on("click", function() {
            let reviewSeq = $(this).data("review-seq");
            let loggedIn = $(this).data("logged-in") !== false;

            if (!loggedIn) {
                alert("로그인된 사용자만 좋아요를 누를 수 있습니다.");
                return;
            }

            $.ajax({
                url: "/updateReviewLike.review",
                method: "POST",
                data: { reviewSeq: reviewSeq, type: "like" },
                dataType: "json"
            }).done(function(response) {
                if (response.result === "success") {
                    let likeCount = $("#like-count-" + reviewSeq);
                    likeCount.text(parseInt(likeCount.text()) + 1);
                } else if (response.result === "duplicate") {
                    alert("이미 좋아요를 누르셨습니다.");
                } else if (response.result === "not_logged_in") {
                    alert("로그인된 사용자만 좋아요를 누를 수 있습니다.");
                } else {
                    alert("좋아요 업데이트에 실패했습니다.");
                }
            });
        });

        $(".dislike-button").on("click", function() {
            let reviewSeq = $(this).data("review-seq");
            let loggedIn = $(this).data("logged-in") !== false;

            if (!loggedIn) {
                alert("로그인된 사용자만 싫어요를 누를 수 있습니다.");
                return;
            }

            $.ajax({
                url: "/updateReviewLike.review",
                method: "POST",
                data: { reviewSeq: reviewSeq, type: "dislike" },
                dataType: "json"
            }).done(function(response) {
                if (response.result === "success") {
                    let dislikeCount = $("#dislike-count-" + reviewSeq);
                    dislikeCount.text(parseInt(dislikeCount.text()) + 1);
                } else if (response.result === "duplicate") {
                    alert("이미 싫어요를 누르셨습니다.");
                } else if (response.result === "not_logged_in") {
                    alert("로그인된 사용자만 싫어요를 누를 수 있습니다.");
                } else {
                    alert("싫어요 업데이트에 실패했습니다.");
                }
            });
        });
    });
 
    </script>
</body>
</html>