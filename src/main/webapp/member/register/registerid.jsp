<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 아이디 생성</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <img src="logo.png" alt="Logo" class="logo">
        <h1>아이디 생성</h1>
        <p>retro Starts 아이디를 만들어 주세요.</p>
        <form action="/registerId.member" method="post">
            <div class="input-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
                <p id="userId-availability" class="availability-text">사용할 수 있는 아이디입니다.</p>
            </div>
            <button type="button" onclick="checkUserId()">중복확인</button>
            <button type="submit">다음</button>
        </form>
    </div>
    <script>
        function checkUserId() {
            document.getElementById('userId-availability').innerText = "사용할 수 있는 아이디입니다.";
        }
    </script>
</body>
</html>