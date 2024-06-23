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
        position: relative;
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
    .rules, .checkText {
        font-size: 12px;
        color: grey;
        margin-top: 5px;
    }
    .checkText {
        visibility: hidden;
        color: red;
    }
    .disabled-button {
        background-color: grey;
        cursor: not-allowed;
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
        <h1>비밀번호 재설정</h1>
        <form id="reset-password-form" action="/resetPassword.member" method="post">
            <div class="input-group">
                <label for="password">새 비밀번호:</label>
                <input type="password" id="password" name="password" placeholder="새 비밀번호" required>
                <p id="password-check" class="checkText">비밀번호 형식에 맞지 않습니다.</p>
                <p class="rules">비밀번호는 8~24자 이하, 숫자 및 특수문자를 하나씩 포함해야 합니다.</p>
            </div>
            <div class="input-group">
                <label for="confirm-password">비밀번호 확인:</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인" required>
                <p id="confirm-password-check" class="checkText">비밀번호가 일치하지 않습니다.</p>
            </div>
            <button type="submit" id="resetPw" class="disabled-button" disabled>재설정</button>
        </form>
    </div>
    <script>
        function validatePassword() {
            let password = $('#password').val();
            let confirmPassword = $('#confirm-password').val();
            let regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[`~!@#$%^&*()\-_=+]).{8,24}$/;
            let passwordCheck = $('#password-check');
            let confirmPasswordCheck = $('#confirm-password-check');

            let valid = true;

            if (!regex.test(password)) {
                passwordCheck.css('visibility', 'visible');
                valid = false;
            } else {
                passwordCheck.css('visibility', 'hidden');
            }

            if (password !== confirmPassword) {
                confirmPasswordCheck.css('visibility', 'visible');
                valid = false;
            } else {
                confirmPasswordCheck.css('visibility', 'hidden');
            }

            return valid;
        }

        $(document).ready(function() {
            $('#password, #confirm-password').on('input', function() {
                let valid = validatePassword();
                let resetPwButton = $('#resetPw');

                if (valid) {
                    resetPwButton.removeClass('disabled-button');
                    resetPwButton.prop('disabled', false);
                } else {
                    resetPwButton.addClass('disabled-button');
                    resetPwButton.prop('disabled', true);
                }
            });

            $('#reset-password-form').on('submit', function(event) {
                if (!validatePassword()) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
