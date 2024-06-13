<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 이메일 입력</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <img src="logo.png" alt="Logo" class="logo">
        <h1>이메일 입력</h1>
        <p>아이디 / 비밀번호 찾기에 사용되니 기존에 사용하시는 이메일 주소를 입력해주세요.</p>
        <form action="/email.register" method="post">
            <div class="input-group">
                <label for="email">이메일 주소</label>
                <input type="email" id="email" name="email" placeholder="이메일 주소를 입력해주세요" required>
            </div>
            <button type="submit">다음</button>
        </form>
    </div>
</body>
</html>