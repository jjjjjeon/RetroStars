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
        <img src="logo.png" alt="Logo" class="logo">
        <h1>기타 정보 입력</h1>
        <form id="info-form" action="/additionalInfo.register" method="post">
            <div class="input-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="input-group">
                <label for="birthdate">생년월일:</label>
                <input type="date" id="birthdate" name="birthdate" required>
            </div>
            <div class="input-group">
                <label for="gender">성별:</label>
                <select id="gender" name="gender" required>
                    <option value="male">남자</option>
                    <option value="female">여자</option>
                </select>
            </div>
            <button type="submit">다음</button>
        </form>
    </div>
</body>
</html>