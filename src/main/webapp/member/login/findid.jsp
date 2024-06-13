<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            color: white;
            position: relative;
        }
        
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            opacity: 0.5;
            z-index: -1;
        }
        
        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .container h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
        }
        
        .input-group input {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 0 auto;
            border: none;
            border-radius: 5px;
            background: #333;
            color: white;
        }
        
        button {
            width: 100%;
            padding: 10px;
            background-color: #e50914;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        button:hover {
            background-color: #b20710;
        }
        
        .links {
            margin-top: 20px;
        }
        
        .links a {
            color: #aaa;
            text-decoration: none;
            font-size: 12px;
            display: block;
            margin-top: 10px;
        }
        
        .links a:hover {
            text-decoration: underline;
        }   
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <h1>아이디 찾기</h1>
        <form id="find-id-form" action="/findId" method="post">
            <div class="input-group">
                <label for="name">이름 입력</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="input-group">
                <label for="email">이메일 주소 입력</label>
                <input type="email" id="email" name="email" placeholder="이메일" required>
            </div>
            <button type="submit">확인</button>
        </form>
        <div class="links">
            <a href="/members/realFindPassword.jsp">비밀번호 찾기</a>
            <a href="#">고객센터 문의</a>
        </div>
    </div>
</body>
</html>