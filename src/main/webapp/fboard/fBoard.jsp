<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
 <style>
 		
 		.navbar {width: 100%;height:70px;}
    
        /* 랭킹, 마이페이지 폰트 색상과 호버 효과 */
        .nav-link {
            color: white !important;
            /* margin-left: 20px; */
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        /*div{border:1px solid red;}*/

        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            background-image: url('/image/background.png');
            /* 우주 테마 배경 이미지 */
            background-size: cover;
            background-attachment: fixed;
        }

        .container {
            width: 1200px;
            margin: 0 auto;
            margin-top:24px;
            margin-bottom:25px;
            padding: 40px;
            background: #323232;
            border-radius: 10px;
            height:650px;
            
        }
        
        .search{height:40px; width:100%;}	
        #search_box{display:flex; justify-content:space-evenly; margin-top:20px;}	
        #search_kind_box{width:20%; height:90%;} 
        #category_box{width:20%; height:90%;}       
        .search-place{width:45%;display:flex; height:90%;}
        #search_btn{width:10%;height:90%;}
        #search_btn:hover{background-color:#686868; color:white; border:1px solid #686868;}
        

        h1 {text-align: center; margin-bottom: 8px; font-size:25px;}
        h3 {font-size:20px; height:20px; margin-top : 20px; text-indent:10px; width:80%}

        .tabs {overflow: hidden; border-bottom: 1px solid #ccc;}
        .content{height:450px;}
        .page{height:20px;}

        .tablink {
            background-color: #68686800;
            height:45px;
            color: #fff;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            width: 25%;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
            border-radius: 10px 10px 0px 0px;
        }

        .tablink:hover { background-color: #575757;}
        .faq {margin-top: 20px; margin-bottom:0px;}
        .faq-item {margin-bottom:10px; overflow-y:auto;height:350px;}
        .question {cursor: pointer;background-color: #444;padding: 10px;border-radius: 5px; margin-top:5px;}
        .answer {display: none; background-color: #333;border-radius: 5px; padding:10px;}
        
        
        #page{display:flex; justify-content:center; align-items:center; font-size:20px;}


          .footer {
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
        
        .thumbnail{
        	border-radius: 20px;
        	width: 356px;
        	height: 230px;
        	object-fit: cover;
        }
        
        .atag {text-decoration: none !important;  width:20px; display:flex; justify-content:center; align-items:center;}
		.atag:link { color: white; text-decoration: none;}
		.atag:visited { color: white; text-decoration: none;}
		.atag:hover { color: white; background-color:#444; text-decoration: underline; }
        
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
				               <!-- 
				               <img src="${sessionScope.profileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
				           		 -->
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
    
    
	<div class="container">
        <h1>자주 찾는 질문</h1>
        
        <div class="tabs">
            <button class="tablink" id="all_tap">전체</button>
            <button class="tablink" id="game_tap">게임</button>
            <button class="tablink" id="board_tap">게시판</button>
            <button class="tablink" id="etc_tap">기타</button>
        </div>
        
           <form action="/search.fboard">
        <div class="search" id="search_box">
             <select id="search_kind_box" class="form-select"  name="kind">
  				<option value="title" selected="selected">제목</option>
  				<option value="content">내용</option>
  				<option value="title_content">제목+내용</option>
			</select>
			<select id="category_box" class="form-select"  name="category">
  				<option value="0" selected="selected">전체</option>
  				<option value="1">게임</option>
  				<option value="2">게시판</option>
  				<option value="3">기타</option>
			</select>
        	<input class="form-control me-2 search-place" type="search" name="search" placeholder="검색어를 입력해주세요" aria-label="Search">
        	<button class="btn btn-outline-light search_btn" id="search_btn" type="submit">검색</button>
        	<input type="hidden" name="cpage" value="1"> 
        </div>
        </form>
        
        <div class="content">
        <div class="tabcontent">
           <c:choose >
          	<c:when test="${category.equals('1')}">
            	<h3>게임</h3>
            	<div class="faq">
                	<div class="faq-item">		
                		<c:forEach var="fboardCate" items="${fboardCate}">
                    		<div class="question"><i class="fa-solid fa-q"></i> &nbsp;${fboardCate.fBoardQuestion}</div>
                    		<div class="answer"><i class="fa-solid fa-a"></i> &nbsp;${fboardCate.fBoardAnswer}</div>
                   		 </c:forEach>
               		</div>
            	</div>
            </c:when>
            <c:when test="${category.equals('2')}">
            	<h3>게시판</h3>
            	<div class="faq">
                	<div class="faq-item">		
                		<c:forEach var="fboardCate" items="${fboardCate}">
                    		<div class="question"><i class="fa-solid fa-q"></i> &nbsp;${fboardCate.fBoardQuestion}</div>
                    		<div class="answer"><i class="fa-solid fa-a"></i> &nbsp;${fboardCate.fBoardAnswer}</div>
                   		 </c:forEach>
               		</div>
            	</div>
            </c:when>
            <c:when test="${category.equals('3')}">
            	<h3>기타</h3>
            	<div class="faq">
                	<div class="faq-item">		
                		<c:forEach var="fboardCate" items="${fboardCate}">
                    		<div class="question"><i class="fa-solid fa-q"></i> &nbsp;${fboardCate.fBoardQuestion}</div>
                    		<div class="answer"><i class="fa-solid fa-a"></i> &nbsp;${fboardCate.fBoardAnswer}</div>
                   		 </c:forEach>
               		</div>
            	</div>
            </c:when>
             <c:when test="${category.equals('4')}">
            	<h3>검색 결과</h3>
            	<div class="faq">
                	<div class="faq-item">		
                		<c:forEach var="fboardCate" items="${fboardCate}">
                    		<div class="question"><i class="fa-solid fa-q"></i> &nbsp;${fboardCate.fBoardQuestion}</div>
                    		<div class="answer"><i class="fa-solid fa-a"></i> &nbsp;${fboardCate.fBoardAnswer}</div>
                   		 </c:forEach>
               		</div>
            	</div>
            </c:when>
            <c:otherwise>
            	<h3>전체</h3>
            	<div class="faq">
                	<div class="faq-item">		
                		<c:forEach var="fboardCate" items="${fboardCate}">
                    		<div class="question"><i class="fa-solid fa-q"></i> &nbsp;${fboardCate.fBoardQuestion}</div>
                    		<div class="answer"><i class="fa-solid fa-a"></i> &nbsp;${fboardCate.fBoardAnswer}</div>
                   		 </c:forEach>
               		</div>
            	</div>
            </c:otherwise>
          </c:choose>
			<div id="page" class="page"></div>
        </div>
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
    
    console.log(${category});
    
    $("#all_tap").on("click",function(){
    	location.href="/list.fboard?category=0";
    })
    $("#game_tap").on("click",function(){
    	location.href="/list.fboard?category=1";
    })
    $("#board_tap").on("click",function(){
    	location.href="/list.fboard?category=2";
    })
    $("#etc_tap").on("click",function(){
    	location.href="/list.fboard?category=3";
    })

    
        $(document).ready(function () {
            $(".question").click(function () {
                $(this).next(".answer").slideToggle();
                $(this).toggleClass("active");
            });
        });

        
        $(document).ready(function () {
        	
            $(".question").click(function () {
                let answer = $($(this).next(".answer"));
                
                console.log("answer:"+answer);

                $(".answer").not(answer).slideUp();
                $(".question").not(this).removeClass("active");

                answer.slideDown();
                $(this).toggleClass("active");
            });

            $(".tablink").click(function() {
            	
                $(".answer").slideUp();
                $(".question").removeClass("active");
                
                let tabName = $(this).attr("data-tab");
                $("#" + tabName + " .question:first-of-type").click();
            });

        });
        
        $(document).ready(function(){
    		
    		// 전체 글 개수
    		let record_total_count = ${recordTotalCount};
    		// 페이지 당 게시글 개수
    		let record_count_per_page = ${recordCountPerPage};
    		// 네비바 에 몇개씩 보여줄건지
    		let navi_count_per_page = ${naviCountPerPage}; 
    		// 현재 페이지
    		let cpage = ${cpage};
    		
    		createPagenation(record_total_count,record_count_per_page,navi_count_per_page,cpage);
    		
    		console.log(record_total_count);
    		console.log(record_count_per_page);
    		console.log(navi_count_per_page);
    		console.log(cpage);

    	})
    	
    		function createPagenation(record_total_count,record_count_per_page,navi_count_per_page,cpage){
    			
    			let pageTotalCount=0;
    			let category=${category};
    			console.log(category);
    			
    			if(record_total_count % record_count_per_page > 0){
    				let beforepageTotalCount = record_total_count/record_count_per_page + 1;
    				pageTotalCount = Math.floor(beforepageTotalCount);
    				console.log(pageTotalCount+"if");
    			}else{
    				let beforepageTotalCount = record_total_count/record_count_per_page;
    				pageTotalCount = Math.floor(beforepageTotalCount)+1;
    				console.log(pageTotalCount+"else");
    			}
    			
    			let start = Math.floor((cpage-1) / navi_count_per_page) * navi_count_per_page+1;
    			let end = start + navi_count_per_page-1;
    			
    			if(end>pageTotalCount){end=pageTotalCount;}
    			
    			let needNext=true;
    			let needPrev=true;
    			
    			if (start == 1) {
    				needPrev = false;
    			}
    			if (end == pageTotalCount) {
    				needNext = false;
    			}
    			
    			let navi = $("#page");
    			navi.empty();
    			
    			
    			if(category=="4"){
    				
    				if (needPrev) {
    					$("#page").append("<a class='atag' href='/search.fboard?kind=${kind}&search=${search}&category="+category+"&cpage=" + (start - navi_count_per_page) + "'><</a>&nbsp");
    				}
    				for (let i = start; i <= end; i++) {
    					$("#page").append("<a class='atag' href='/search.fboard?kind=${kind}&search=${search}&category="+category+"&cpage=" + i + "'>" + i + "</a>&nbsp");
    				}
    				if (needNext) {
    					$("#page").append("<a class='atag' href='/search.fboard?kind=${kind}&search=${search}&category="+category+"&cpage=" + (end + 1) + "'>></a>");
    				}
    				
    			}else{
    				
    				if (needPrev) {
    					$("#page").append("<a class='atag' href='/list.fboard?category="+category+"&cpage=" + (start - navi_count_per_page) + "'><</a>&nbsp");
    				}
    				for (let i = start; i <= end; i++) {
    					$("#page").append("<a class='atag' href='/list.fboard?category="+category+"&cpage=" + i + "'>" + i + "</a>&nbsp");
    				}
    				if (needNext) {
    					$("#page").append("<a class='atag' href='/list.fboard?category="+category+"&cpage=" + (end + 1) + "'>></a>");
    				}
    			}
    			
    			console.log("record_total_count:", record_total_count);
    		    console.log("record_count_per_page:", record_count_per_page);
    		    console.log("navi_count_per_page:", navi_count_per_page);
    		    console.log("cpage:", cpage);
    		    console.log("pageTotalCount:", pageTotalCount);
    		    console.log("start:", start);
    		    console.log("end:", end);
    		    console.log("needPrev:", needPrev);
    		    console.log("needNext:", needNext);
    		    console.log("category:", category);
    		    
    		}
        
        
        
      
    </script>
	
</body>
</html>