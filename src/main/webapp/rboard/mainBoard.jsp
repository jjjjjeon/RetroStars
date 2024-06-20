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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    * {
        box-sizing: border-box;
        margin: 0;
    }

   body{
      background-color : #222; 
      color: #d3d3d3;
        font-family: 'Noto Sans KR', sans-serif;
        display: flex;
        flex-direction: column;
    }

    div {
        font-family: 'Noto Sans KR', sans-serif;
    }

    a {
        text-decoration: none;
        color: #d3d3d3;
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
        flex: 1;
        width: 80%;
        margin: 30px auto;
        background-color: #222;
        color: #d3d3d3;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 20px;
        border-bottom: 1px solid #5a5a64;
    }

    .review-header h3 {
        color: white;
    }

    .review-list {
        margin-top: 20px;
    }

    .review-item {
        padding: 20px;
        border-bottom: 1px solid #5a5a64;
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
        font-size: 16px;
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

    .sort-buttons button.active {
        background-color: #0056b3;
    }

    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination a {
        margin: 0 5px;
        padding: 5px 10px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }

    .pagination a.active {
        background-color: #0056b3;
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
</style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index.jsp">홈으로</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
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
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">자유게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">공략게시판</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">QA게시판</a></li>
                            <li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="/list.nboard">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                           <a class="nav-link" href="/mypage.member">
                               <img src="/profile/${userProfileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
                           </a>
                       </li>                  
                      <li class="nav-item">
                           <a class="nav-link" href="/mypage.member">마이페이지</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
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
        리뷰게시판
    </div>

    <div class="content">
        <div class="review-header">
            <h3>전체 리뷰</h3>
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
                                <img src="/profile/${review.profileUrl}" alt="Profile">
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
                                    <span>좋아요: ${review.reviewLike}</span> |
                                    <span>싫어요: ${review.reviewDislike}</span>
                                </div>
                                <div>
                                    <button>도움이 돼요</button>
                                    <button>도움 안 돼요</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${reviewCount / 10 + (reviewCount % 10 == 0 ? 0 : 1)}">
                <a href="/list.review?cpage=${i}&sortType=${sortType}" class="${cpage == i ? 'active' : ''}">${i}</a>
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
                window.location.href = "/list.review?sortType=review_like";
            });

            $("#sortDislikes").on("click", function() {
                window.location.href = "/list.review?sortType=review_dislike";
            });
        });
    </script>
</body>
</html>