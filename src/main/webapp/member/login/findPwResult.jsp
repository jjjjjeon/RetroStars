<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
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
            font-family : 'DalseoHealing';
            color: white;
            position: relative;
        }
	   .video-background{
	      position : fixed;
	      top : 0;
	      left : 0;
	      min-width : 100%;
	      min-height : 100%;
	      width: auto;
	      height : auto;
	      z-index: -1;
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
            <button type="submit">재설정</button>
        </form>
    </div>
    <script>
        $(document).ready(function(){
            $('#reset-password-form').submit(function(event){
                event.preventDefault();
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