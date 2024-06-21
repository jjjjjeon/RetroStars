<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 1000px;
        }
        
        #notAdmin{display:flex; justify-content: center; align-items:center; height:600px;}

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea,
        .form-group select,
        .form-group button {
            width: 98%;
            padding: 10px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus,
        .form-group button:focus {
            outline: none;
            border-color: #6200ee;
        }

        .form-group button {
            background-color: #6200ee;
            border: none;
            cursor: pointer;
            font-size: 13px;

        }

        .form-group button:hover {
            background-color: #3700b3;
        }

        #category{width: 20%;}
        #btn{width: 500px;}
        #btn_boxs{text-indent: 30px; width:100%;justify-content: end;display: flex;}
        #btn_box{display: flex; width:50%;}
        .btns{font-size:10px;}
		#answer{height:100px; vertical-align:top;}

    </style>
</head>
<body>
<c:choose>
	<c:when test="${isAdmin == true}">	
	 <div class="form-container">
        <h2>즐겨 찾는 질문 작성하기</h2>
        <form action="/insert.fboard" method="post" id="insert">
            <div class="form-group">
                <label for="category">카테고리 선택</label>
                <select id="category" name="category" required>
                    <option value="1">게임</option>
                    <option value="2">게시판</option>
                    <option value="3">기타</option>
                </select>
            </div>
            <div class="form-group">
                <label for="question">질문</label>
                <input type="text" id="question" name="question" required>
            </div>
            <div class="form-group">
                <label for="answer">답변</label>
                <textarea id="answer" name="answer" rows="4" required></textarea>
            </div>
            <div class="form-group" id="btn_boxs">
            	<div id="btn_box">
            		<button class="btns" tpye="button" id="go_fboard">즐겨찾는 질문 목록으로</button>
            		<button class="btns" tpye="button" id="go_admin">관리자 페이지로</button>            	
               	 	<button class="btns" type="submit" id="btn">작성 완료</button>
                </div>
            </div>
        </form>
    </div>
    </c:when>
    <c:otherwise>
    	<div class="form-container" id="notAdmin">잘못된 접근 입니다.</div>
    </c:otherwise>
</c:choose>
</body>
<script>
	$("#go_fboard").on("click",function(){
		location.href="/list.fboard";
	});
	$("#go_admin").on("click",function(){
		location.href="/dashBoard.admin";
	});
	
	
	
	
</script>
</html>