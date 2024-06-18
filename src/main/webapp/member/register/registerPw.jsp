<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 입력</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .input-group {
            position: relative;
            margin-bottom: 20px; 
        }
        .pwShow{
            position: absolute;
            right: 10px;
            top: 41%;
            transform: translateY(-50%);
            cursor: pointer;
            user-select: none;
            background: white; 
            padding: 0 5px; 
        }
        
        .pwShow2 {
            position: absolute;
            right: 10px;
            top: 58%;
            transform: translateY(-50%);
            cursor: pointer;
            user-select: none;
            background: white; 
            padding: 0 5px;        
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
        input::-ms-reveal,
        input::-ms-clear {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="/image/logo.png" alt="Logo" class="logo">
        <h1>비밀번호 입력</h1>
        <form id="password-form" action="/registerPw.member" method="post">
            <div class="input-group">
                <label for="userPw">비밀번호:</label>
                <input type="password" id="userPw" name="userPw" placeholder="비밀번호" required>
                <span class="pwShow" onclick="pwShowText('userPw')">보기</span>
                <p id="password-check" class="checkText">비밀번호 형식에 맞지 않습니다.</p>
                <p class="rules">비밀번호는 8~24자 이하, 숫자 및 특수문자를 하나씩 포함해야 합니다.</p>
            </div>
            <div class="input-group">
                <label for="confirmUserPw">비밀번호 확인:</label>
                <input type="password" id="confirmUserPw" name="confirmUserPw" placeholder="비밀번호 확인" required>
                <span class="pwShow2" onclick="pwShowText('confirmUserPw')">보기</span>
                <p id="confirm-password-check" class="checkText">비밀번호가 일치하지 않습니다.</p>
            </div>
            <button type="submit" id="nextButton" class="disabled-button" disabled>다음</button>
        </form>
    </div>
    <script>
        function validatePassword() {
            let password = $('#userPw').val();
            let confirmPassword = $('#confirmUserPw').val();
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

        function pwShowText(id) {
            let passwordField = $('#' + id);
            let type = passwordField.attr('type') === 'password' ? 'text' : 'password';
            passwordField.attr('type', type);

            let toggleButton = passwordField.next('.pwShow');
            let toggleButton2 = passwordField.next('.pwShow2');
            toggleButton.text(type === 'password' ? '보기' : '숨기기');
            toggleButton2.text(type === 'password' ? '보기' : '숨기기');
        }

        $(document).ready(function() {
            $('#userPw, #confirmUserPw').on('input', function() {
                let valid = validatePassword();
                let nextButton = $('#nextButton');

                if (valid) {
                    nextButton.removeClass('disabled-button');
                    nextButton.prop('disabled', false);
                } else {
                    nextButton.addClass('disabled-button');
                    nextButton.prop('disabled', true);
                }
            });

            $('#password-form').on('submit', function(event) {
                if (!validatePassword()) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
