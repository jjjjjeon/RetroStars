<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 아이디 생성</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .availability-text {
            display: none;
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
    <div class="container">
        <img src="/image/logo.png" alt="Logo" class="logo">
        <h1>아이디 생성</h1>
        <p>retro Starts 아이디를 만들어 주세요.</p>
        <form action="/registerId.member" method="post">
            <div class="input-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
                <p id="userId-availability" class="availability-text">사용할 수 있는 아이디입니다.</p>
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
        let availabilityText = $('#userId-availability');
        let nextButton = $('#nextButton');

        if (!validateUserId(userId)) {
            availabilityText.text("사용 불가능한 아이디입니다.");
            availabilityText.css('color', 'red');
            availabilityText.show();
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
                    availabilityText.text("사용할 수 있는 아이디입니다.");
                    availabilityText.css('color', 'green');
                    nextButton.removeClass('disabled-button');
                    nextButton.prop('disabled', false);
                } else {
                    availabilityText.text("이미 사용 중인 아이디입니다.");
                    availabilityText.css('color', 'red');
                    nextButton.addClass('disabled-button');
                    nextButton.prop('disabled', true);
                }
                availabilityText.show();
            },
            error: function() {
                availabilityText.text("아이디 확인 중 오류가 발생했습니다.");
                availabilityText.css('color', 'red');
                availabilityText.show();
                nextButton.addClass('disabled-button');
                nextButton.prop('disabled', true);
            }
        });
    }

    $(document).ready(function(){
        $('#userId').on('input', function() {
            $('#userId-availability').hide();
            $('#nextButton').addClass('disabled-button');
            $('#nextButton').prop('disabled', true);

            if (validateUserId($(this).val())) {
                checkUserId();
            } else {
                $('#userId-availability').text("사용 불가능한 아이디입니다.");
                $('#userId-availability').css('color', 'red');
                $('#userId-availability').show();
            }
        });
    });
    </script>
</body>
</html>
