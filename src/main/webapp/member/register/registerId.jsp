<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 아이디 생성</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .checkText {
            visibility: hidden;
            margin-top: 5px;
        }
        .disabled-button {
            background-color: grey;
            cursor: not-allowed;
        }
        .input-group {
            position: relative;
        }
        .rules {
            font-size: 12px;
            color: grey;
            margin-top: 5px;
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
        <h1>아이디 생성</h1>
        <p>Retro Starts 아이디를 만들어 주세요.</p>
        <form action="/registerId.member" method="post">
            <div class="input-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
                <p id="checkText" class="checkText">사용할 수 있는 아이디입니다.</p>
                <p class="rules">아이디는 3자 이상 16자 이하, 영어 또는 숫자로 구성되어야 합니다.</p>
            </div>
            <button type="submit" id="nextButton" class="disabled-button" disabled>다음</button>
        </form>
    </div>
    <script>
    function validateUserId(userId) {
        let regex = /^[a-zA-Z0-9]{3,16}$/;
        return regex.test(userId);
    }

    function checkUserId() {
        let userId = $('#userId').val();
        let checkText = $('#checkText');
        let nextButton = $('#nextButton');

        if (!validateUserId(userId)) {
            checkText.text("사용 불가능한 아이디입니다.");
            checkText.css('color', 'red');
            checkText.css('visibility', 'visible');
            nextButton.addClass('disabled-button');
            nextButton.prop('disabled', true);
            return;
        }

        $.ajax({
            url: '/checkUserId.member',
            method: 'get',
            data: { userId: userId },
            success: function(response) {
                if (response === "true") {
                    checkText.text("사용할 수 있는 아이디입니다.");
                    checkText.css('color', 'green');
                    checkText.css('visibility', 'visible');
                    nextButton.removeClass('disabled-button');
                    nextButton.prop('disabled', false);
                } else {
                    checkText.text("이미 사용 중인 아이디입니다.");
                    checkText.css('color', 'red');
                    checkText.css('visibility', 'visible');
                    nextButton.addClass('disabled-button');
                    nextButton.prop('disabled', true);
                }
            },
            error: function() {
                checkText.text("아이디 확인 중 오류가 발생했습니다.");
                checkText.css('color', 'red');
                checkText.css('visibility', 'visible');
                nextButton.addClass('disabled-button');
                nextButton.prop('disabled', true);
            }
        });
    }

    $(document).ready(function(){
        $('#userId').on('input', function() {
            if (validateUserId($(this).val())) {
                checkUserId();
            } else {
                let checkText = $('#checkText');
                checkText.text("사용 불가능한 아이디입니다.");
                checkText.css('color', 'red');
                checkText.css('visibility', 'visible');
                $('#nextButton').addClass('disabled-button');
                $('#nextButton').prop('disabled', true);
            }
        });
    });
    </script>
</body>
</html>
