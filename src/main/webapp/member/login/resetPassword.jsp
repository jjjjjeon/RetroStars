<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
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
<body>
    <div class="background"></div>
    <div class="container">
        <h1>비밀번호 재설정</h1>
        <form id="reset-password-form" action="/resetPassword" method="post">
            <div class="input-group">
                <label for="password">새 비밀번호:</label>
                <input type="password" id="password" name="password" placeholder="새 비밀번호" required>
            </div>
            <div class="input-group">
                <label for="confirm-password">비밀번호 확인:</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인" required>
            </div>
            <button type="submit" id="resetPw">재설정</button>
        </form>
    </div>
    <script>
        $(document).ready(function(){
            $('#resetPw').on("click", function(){

                let password = $('#password').val();
                let confirmPassword = $('#confirm-password').val();
                if(password === "") {
                    alert("새 비밀번호를 입력해주세요.");
                } else if (password !== confirmPassword) {
                    alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                } else {
               
                    alert("비밀번호가 재설정되었습니다.");
                    this.submit();  
                }
            });
            
        });
    </script>
</body>
</html>
