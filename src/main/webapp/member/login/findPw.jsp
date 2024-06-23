<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
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
        font-family: 'Georgia', serif;
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
    nav{
        background-color: #323232;
    }
    .footer {
        width: 100%;
        background-color: #323232;
        position: fixed; 
        bottom: 0; 
        height: 150px;            
    }
    .leftfooter{
        color: white;
        font-weight: bold;
        margin-top: 20px;
    }
    .rightfooter {
        display: flex;
        align-items: center;       
    }
    .footerbox {
        width: 1000px;
        height: 100%;
        margin: auto;
        display: flex;
        justify-content: space-between;
        align-items: center;    
    }
    .iconbox {
        display: flex;
        align-items: center;
    }
    .iconbox a {
        margin: 0 10px;
        font-size: 50px;
        color: white;
    }
    .coinbox {
        display: flex;
        align-items: center;
        margin-left: 20px;
    }
    .coinbox img {
        width: 120px;
        height: 100px;
        margin-left: 20px;
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
<body>
    <video class="video-background" autoplay muted loop>
        <source src="/image/video.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <div class="background"></div>
    <div class="container">
        <h1>비밀번호 찾기</h1>
        <form id="find-password-form">
            <div class="input-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="inputId" placeholder="아이디" required>
            </div>
            <div class="input-group">
                <label for="email">이메일 주소 입력</label>
                <input type="email" id="email" name="inputEmail" placeholder="이메일" required>
            </div>
            <button type="submit" id="pwCodeSend">확인</button>
        </form>
        <div class="links">
            <a href="/member/login/findId.jsp">아이디 찾기</a>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $('#find-password-form').on("submit", function(event){
                event.preventDefault();
                let id = $('#id').val();
                let email = $('#email').val();
                if(id === "" || email === "") {
                    alert("아이디와 이메일 주소를 모두 입력해주세요.");
                    return;
                } 
                
                $.ajax({
                    url: '/findPwSendEmail.member',
                    type: 'POST',
                    data: {
                        inputId: id,
                        inputEmail: email
                    },
                    dataType: 'json'
                })
                .done(function(response) {
                    if(response.status === "success") {
                        alert("입력한 이메일 주소로 비밀번호 찾기 이메일을 전송했습니다.");
                        window.location.href = "/member/login/pwVerifyCode.jsp";
                    } else if (response.status === "mismatch") {
                        alert("입력한 아이디와 이메일이 일치하지 않습니다.");
                    } else {
                        alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
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
