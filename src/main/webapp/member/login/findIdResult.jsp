<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
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
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="container">
        <h1>아이디 찾기 결과</h1>
        <p>${message}</p>
        <button onclick="location.href='/members/login.jsp'">로그인 페이지로 이동</button>
    </div>
</body>
</html>