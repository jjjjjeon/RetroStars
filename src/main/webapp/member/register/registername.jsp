<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기타 정보 입력</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <img src="/image/logo.png" alt="Logo" class="logo">
        <h1>기타 정보 입력</h1>
        <form id="info-form" action="/registerName.member" method="post">
            <div class="input-group">
                <label for="name">이름:</label>
                <input type="text" id="userName" name="userName" placeholder="이름" required>
            </div>
            <div class="input-group">
                <label for="name">닉네임:</label>
                <input type="text" id="userNickname" name="userNickname" placeholder="닉네임" required>
            </div>
            <div class="input-group">
                <label for="name">주민등록번호:</label>
                <input type="text" id="userNo" name="userNo" placeholder="주민등록번호" required>
            </div>
            <div class="input-group">
                <label for="name">폰 번호:</label>
                <input type="text" id="userPhone" name="userPhone" placeholder="폰 번호">
            </div>            
            <button type="submit">다음</button>
        </form>
    </div>
</body>
</html>