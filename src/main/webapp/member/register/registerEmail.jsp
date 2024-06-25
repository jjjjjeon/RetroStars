<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 이메일 입력</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
    <style>
        .input-group {
            position: relative;
        }
        .checkText {
            visibility: hidden;
            margin-top: 5px;
            color: red;
        }
        .disabled-button {
            background-color: grey;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
         <video class="video-background" autoplay muted loop>
           <source src="/image/video.mp4" type="video/mp4">
           Your browser does not support the video tag.
       </video>
    <div class="container">
        <img src="/image/logo.png" alt="Logo" class="logo">
        <h1>이메일 입력</h1>
        <p>아이디 / 비밀번호 찾기에 사용되니 기존에 사용하시는 이메일 주소를 입력해주세요.</p>
        <form action="/registerEmail.member" method="post">
            <div class="input-group">
                <label for="email">이메일 주소</label>
                <input type="email" id="userEmail" name="userEmail" placeholder="이메일 주소를 입력해주세요" required>
                <p id="checkText" class="checkText">유효하지 않은 이메일 형식입니다.</p>
            </div>
            <button type="submit" id="nextButton" class="disabled-button" disabled>다음</button>
        </form>
    </div>
    <script>
    function validateEmail(email) {
        let regex = /@+/gm;
        return regex.test(email);
    }

    $(document).ready(function(){
        $('#userEmail').on('input', function() {
            let email = $(this).val();
            let checkText = $('#checkText');
            let nextButton = $('#nextButton');

            if (!validateEmail(email)) {
                checkText.css('visibility', 'visible').removeClass('valid').addClass('invalid').text('유효하지 않은 이메일 형식입니다.');
                nextButton.addClass('disabled-button');
                nextButton.prop('disabled', true);
            } else {
                checkText.css('color', 'green');
                checkText.css('visibility', 'visible').removeClass('invalid').addClass('valid').text('유효한 이메일 형식입니다.');
                nextButton.removeClass('disabled-button');
                nextButton.prop('disabled', false);
            }
        });
    });
    </script>
</body>
</html>
