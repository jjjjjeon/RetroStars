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
    <link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
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
        position: fixed;
        top: 0;
        left: 0;
        min-width: 100%;
        min-height: 100%;
        width: auto;
        height: auto;
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
    <video class="video-background" autoplay muted loop>
        <source src="/image/video.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <div class="background"></div>
    <div class="container">
        <h1>인증 코드 확인</h1>
        <form id="verify-code-form">
            <div class="input-group">
                <label for="code">인증 코드:</label>
                <input type="text" id="code" name="code" placeholder="인증 코드" required>
            </div>
            <button type="submit" id="pwVerifyConfirm">확인</button>
        </form>
    </div>
    <script>
        $(document).ready(function() {
            $('#verify-code-form').on('submit', function(event) {
                event.preventDefault();

                let code = $('#code').val();

                $.ajax({
                    url: '/pwVerifyCode.member',
                    type: 'POST',
                    data: { code: code },
                    dataType: 'json'
                })
                .done(function(response) {
                    if (response.status === 'success') {
                        alert("인증 코드가 확인되었습니다.");
                        window.location.href = '/member/login/resetPassword.jsp';
                    } else {
                        alert("인증코드가 올바르지 않습니다.");
                    }
                })
                .fail(function() {
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                });
            });
        });
    </script>
</body>
</html>
