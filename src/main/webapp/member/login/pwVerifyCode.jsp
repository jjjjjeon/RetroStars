<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인증 코드 확인</title>
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
        background: url('data:image/png;base64,PUT_YOUR_BASE64_IMAGE_HERE') no-repeat center center;
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
        <h1>인증 코드 확인</h1>
        <form id="verify-code-form" action="/pwVerifyCode.member" method="post">
            <div class="input-group">
                <label for="code">인증 코드:</label>
                <input type="text" id="code" name="code" placeholder="인증 코드" required>
            </div>
            <button type="submit" id="pwVerifyConfirm">확인</button>
        </form>
    </div>
    <script>
        $(document).ready(function(){
        	
            $('#pwVerifyConfirm').on("click", function(){
                let code = $('#code').val();
                if(code === "") {
                    alert("인증 코드를 입력해주세요.");
                } else {                    
                    alert("인증 코드가 확인되었습니다.");
                }
            });
        });
    </script>
</body>
</html>