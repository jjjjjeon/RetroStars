<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 <style>

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
            max-width: 800px;
            margin: 0 auto;
            margin-top:30px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            height:700px;
        }
        
        .search{height:40px; width:100%; text-align:center;}

        h1 {text-align: center;margin-bottom: 20px;}

        .tabs {overflow: hidden;border-bottom: 1px solid #ccc;}

        .tablink {
            background-color: #111;
            color: #fff;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            width: 25%;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        .tablink:hover { background-color: #575757;}

        .tabcontent {display: none;padding: 20px;animation: fadeEffect 0.5s;}

        @keyframes fadeEffect {
            from {opacity: 0;}
			to {opacity: 1;}
        }

        .faq {margin-top: 20px;}

        .faq-item {margin-bottom:20px;}

        .question {cursor: pointer;background-color: #444;padding: 10px;border-radius: 5px; margin-top:5px;}

        .answer {display: none; background-color: #333;border-radius: 5px; padding:10px;}
    </style>
</head>
<body>
	<div class="container">
        <h1>FAQ 게시판</h1>
        
        <div class="search">검색 기능 구현</div>
        
        <div class="tabs">
            <button class="tablink" onclick="openTab(event, 'game')">게임</button>
            <button class="tablink" onclick="openTab(event, 'free')">자유</button>
            <button class="tablink" onclick="openTab(event, 'guide')">공략</button>
            <button class="tablink" onclick="openTab(event, 'etc')">기타</button>
        </div>

        <div id="game" class="tabcontent">
            <h3>게임</h3>
            <div class="faq">
                <div class="faq-item">
                	<c:forEach var="fboardCate1" items="${fboardCate1}">
                    	<div class="question">${fboardCate1.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate1.fBoardAnswer}</div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="free" class="tabcontent">
            <h3>자유</h3>
            <div class="faq">
                <div class="faq-item">                   
               		 <c:forEach var="fboardCate2" items="${fboardCate2}">
                    	<div class="question">${fboardCate2.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate2.fBoardAnswer}</div>
                    </c:forEach>                   
                </div>
            </div>
        </div>

        <div id="guide" class="tabcontent">
            <h3>공략</h3>
            <div class="faq">
                <div class="faq-item">  
                    <c:forEach var="fboardCate3" items="${fboardCate3}">
                    	<div class="question">${fboardCate3.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate3.fBoardAnswer}</div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div id="etc" class="tabcontent">
            <h3>기타</h3>
            <div class="faq">
                <div class="faq-item">
                    <c:forEach var="fboardCate4" items="${fboardCate4}">
                    	<div class="question">${fboardCate4.fBoardQuestion}</div>
                    	<div class="answer">${fboardCate4.fBoardAnswer}</div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(".question").click(function () {
                $(this).next(".answer").slideToggle();
                $(this).toggleClass("active");
            });

            $(".tablink").first().click(); // 첫 번째 탭을 기본으로 열기
        });

        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.style.backgroundColor = "#575757";
        }
    </script>
	
</body>
</html>