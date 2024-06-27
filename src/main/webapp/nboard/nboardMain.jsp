<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
  <style>
body{
	background-image:url("/image/background.png");
 	background-size:100% 100%;
 	color:white;
 	font-family : 'DalseoHealing';
 }

    a {
      color: white;
      text-decoration: none;
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
      background-color: #323232;
      color: white;
      border-radius: 20px;
      padding: 20px;
      margin-top: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 200px;
      height: 1200px;

    }

    .boardName {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .title {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }

    .title span {
      font-size: 20px;
      font-weight: bold;
    }

    /* searchbtn */
    #searchbtn {
      color: white;
      border: 1px solid white;
    }

    #searchbtn:hover {
      color: #323232;
      background-color: white;
    }
	
    /*    글작성 btn */
    .btn-write {
      background-color: #323232;
      color: white;
      border: 1px solid white;
      margin-left: -500px;

    }

    .btn-write:hover {
      background-color: white;
      color: #323232;

    }

    .form-search {
      display: flex;
      align-items: center;
    }

    .form-search input[type="search"] {
      width: 300px;
      margin-right: 10px;
    }

    .nonNotiListContent {
      border: 1px solid #ddd;
      padding: 10px;
      margin-bottom: 10px;
      background-color: #323232;
      display: flex;
      align-items: center;


    }

    .notiListItem {
      border: 1px solid #ddd;
      padding: 10px;
      margin-bottom: 10px;
      background-color: #ababab;
      display: flex;
      align-items: center;
      font-size: 18px;
      font-weight: bold;
    }

    .notiListItem div {
      background-color: #ababab;
    }

    .notiListContent {
      border: 1px solid #ddd;
      padding: 10px;
      margin-bottom: 10px;
      background-color: #323232;
      display: flex;
      align-items: center;
    }

    .notiListContent:hover {
      background-color: #ababab;
    }

    .notiCategory {
      flex: 1;
      text-align: center;
      font-weight: bold;
    }

    .notiTitle {
      flex: 5;
      padding-left: 20px;
    }
   .noticeContent{
      max-height: 900px;
   }
    .notiAdmin,
    .notiDate,
    .notiView {
      flex: 2;
      text-align: center;
    }

    .pagenavi {
      margin-top: 100px;
      text-align: center;
     


    }

    .footer {
      width: 100%;
      background-color: #323232;
      position: relative;
      bottom: 0;
      left: 0;
      margin-top: 40px;
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
    .dropdown{
       margin-right: 5px;
    }
    
    #lang{
        width: 90px;
       background-color: #eeeeee;
          margin-right: 5px;
    }
    .pagenavi{
    	font-size:20px;
    	word-spacing: 10px;
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
    <div class="boardName">공지게시판</div>
    <div class="title">
      <span>전체</span>


   <c:if test="${isAdmin eq true}">
            <a href="/nboard/nBoardWrite.jsp" class="btn btn-primary btn-write">
              <i class="fas fa-pencil-alt"></i> 글 작성
            </a>
   </c:if>



      
   
      <form action="/search.nboard" class="d-flex" role="search">
         
   
         <select name="filter" id="lang" class="form-select" aria-label="Default select example">
            <option value="title">제목</option>
            <option value="post_number">글번호</option>
      </select>
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
        <button class="btn btn-outline-success" type="submit" id="searchbtn">Search</button>
      </form>
      <script>
         $(document).ready(function(){
         $("#lang").change(function(){
            var selectedOption = $(this).children("option:selected").val();
            var currentPage = ${cpage};
            
            if(selectedOption === "title"){
               $("form").attr("action","/search.nboard?filter=title&cpage=${currentPage}");
            } else if(selectedOption === "post_number"){
               $("form").attr("action","/search.nboard?filter=post_number&cpage=${currentPage}");
            }
         });
         });
      </script>

    </div>


    <div class="noticeContent">
      <div class="notiListItem">
        <div class="notiCategory">번호</div>
        <div class="notiTitle">공지사항 제목</div>
        <div class="notiAdmin">작성자</div>
        <div class="notiDate">작성일</div>
        <div class="notiView">조회</div>
      </div>



      <c:choose>
        <c:when test="${not empty searchResult}">


          <c:forEach var="dto" items="${searchResult}">
            <!-- 검색 결과 출력 -->
            <div class="notiListContent">
              <div class="notiCategory">${dto.nBoardSeq}</div>
              <div class="notiTitle"><a href="/detail.nboard?nBoardSeq=${dto.nBoardSeq}">${dto.nBoardTitle}</a></div>
              <div class="notiAdmin">관리자</div>
              <div class="notiDate">
                 <fmt:formatDate value="${dto.nBoardDate}" pattern="yyyy-MM-dd" />
              </div>
              <div class="notiView">${dto.nBoardView}</div>
            </div>
          </c:forEach>

        </c:when>

        <c:otherwise>
          <c:if test="${empty list}">
            <div class="nonNotiListContent">
              검색 결과가 없습니다.
            </div>
          </c:if>
          <c:forEach var="dto" items="${list}">
            <div class="notiListContent">
              <div class="notiCategory">${dto.nBoardSeq}</div>
              <div class="notiTitle"><a href="/detail.nboard?nBoardSeq=${dto.nBoardSeq}">${dto.nBoardTitle}</a></div>
              <div class="notiAdmin">관리자</div>
             <div class="notiDate">
                 <fmt:formatDate value="${dto.nBoardDate}" pattern="yyyy-MM-dd" />
              </div>
              <div class="notiView">${dto.nBoardView}</div>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
    <div class="pagenavi" id="navi"></div>
  </div>

  <script>
    window.onload = function () {
      let cpage = ${cpage}; // 현재 페이지
      let recordTotalCount = ${record_total_count}; // 전체 글의 개수
      let recordCountPerPage = ${record_count_per_page}; // 한 페이지에 보여줄 게시물 수
      let naviCountPerPage = ${navi_count_per_page}; // 페이지네비게이터 몇 개씩 보여줄 것인지


      // 필요한 전체 페이지 개수 = 게시글의 개수 / 한 페이지당 보여줄 게시글 + 1
      let pageTotalCount = 0;
      if (recordTotalCount % recordCountPerPage > 0) {
        pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage) + 1;
        // +1 해주면 15페이지 -> 나머지 게시글들을 다 보여줄 수 있음
      } else {
        pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage);
        // 전체 글의 개수가 140개라면 14페이지 
      }

      // 네비게이터 시작 값
      let startNavi = Math.floor((cpage - 1) / naviCountPerPage) * naviCountPerPage + 1;
      // 네비게이터 끝 값 
      let endNavi = startNavi + naviCountPerPage - 1;

      // 네비게이터의 끝 값은 pageTotalCount보다 클 수 없음.
      if (endNavi > pageTotalCount) {
        endNavi = pageTotalCount
      };

      let needPrev = true;
      let needNext = true;
      
      let isSearching = false;
     
      //화살표 필요없을 때
      if (startNavi == 1) {
        needPrev = false
      }
      if (endNavi == pageTotalCount) {
        needNext = false
      }

      // 검색 중인 경우라면
     // if (isSearching) {
          if (needPrev) {
              let needPreva = $("<a>").attr("href", "/search.nboard?filter=${filter}&keyword=${keyword}&cpage=" + (startNavi - 1)).html(" < ");
              $("#navi").append(needPreva);
          }

          for (let i = startNavi; i <= endNavi; i++) {
              let cpagea = $("<a>").attr("href", "/search.nboard?filter=${filter}&keyword=${keyword}&cpage=" + i).html(i + "&nbsp");
              $("#navi").append(cpagea);
          }

          if (needNext) {
              let needNexta = $("<a>").attr("href", "/search.nboard?filter=${filter}&keyword=${keyword}&cpage=" + (endNavi + 1)).html(" > ");
              $("#navi").append(needNexta);
          }
     // } 
      /*else { // 검색 중이 아닌 경우, 전체 리스트 페이지일 경우
          if (needPrev) {
              let needPreva = $("<a>").attr("href", "/list.nboard?cpage=" + (startNavi - 1)).html(" < ");
              $("#navi").append(needPreva);
          }

          for (let i = startNavi; i <= endNavi; i++) {
              let cpagea = $("<a>").attr("href", "/list.nboard?cpage=" + i).html(i + "&nbsp");
              $("#navi").append(cpagea);
          }

          if (needNext) {
              let needNexta = $("<a>").attr("href", "/list.nboard?cpage=" + (endNavi + 1)).html(" > ");
              $("#navi").append(needNexta);
          }
      }*/
      // 출력
      // 왼쪽 화살표가 필요한 상황일때
      // 검색한 경우와 검색 안한 경우로 나눠야함. 


    }
  </script>
  


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

</html>