<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기타 정보 입력</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .checkText {
            visibility: hidden;
            margin-top: 5px;
            color: red;
        }
        .disabled-button {
            background-color: grey;
            cursor: not-allowed;
        }
        .input-group {
            position: relative;
            margin-bottom: 15px;
        }
        .input-inline {
            display: flex;
            align-items: center;
        }
        .jumin-input {
            width: 45%;
        }
        .dash {
            margin: 0 5px;
            text-align: center;
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
        <h1>기타 정보 입력</h1>
        <form id="info-form" action="/registerName.member" method="post" onsubmit="return validateForm()">
            <div class="input-group">
                <label for="userName">이름:</label>
                <input type="text" id="userName" name="userName" placeholder="이름" required>
                <p id="nameCheckText" class="checkText">이름은 2~5글자의 한글만 가능합니다.</p>
            </div>
            <div class="input-group">
                <label for="userNickname">닉네임:</label>
                <input type="text" id="userNickname" name="userNickname" placeholder="닉네임" required>
                <p id="nicknameCheckText" class="checkText">닉네임은 3~10글자의 한글, 영어만 가능합니다.</p>
            </div>
            <div class="input-group">
                <label for="userNoFront">주민등록번호:</label>
                <div class="input-inline">
                    <input type="text" id="userNoFront" name="userNoFront" class="jumin-input" maxlength="6" placeholder="앞자리" required>
                    <span class="dash">-</span>
                    <input type="text" id="userNoBack" name="userNoBack" class="jumin-input" maxlength="1" placeholder="뒷자리 첫 숫자" required>
                    <input type="hidden" id="userNo" name="userNo">
                </div>
                <p id="userNoCheckText" class="checkText">형식이 맞지 않습니다. (예: 950620-1******)</p>
            </div>
            <div class="input-group">
                <label for="userPhone">폰 번호:</label>
                <input type="text" id="userPhone" name="userPhone" placeholder="폰 번호">
                <p id="phoneCheckText" class="checkText">폰 번호 형식이 맞지 않습니다. (예: 01012345678)</p>
            </div>
            <button type="submit" id="nextButton" class="disabled-button">다음</button>
        </form>
    </div>
    <script>
    function validateName(name) {
        let regex = /^[가-힣]{2,5}$/;
        return regex.test(name);
    }

    function validateNickname(nickname) {
        let regex = /^[a-zA-Z0-9가-힣]{3,10}$/;
        return regex.test(nickname);
    }

    function validateUserNo(userNoFront, userNoBack) {
        let regexFront = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
        let regexBack = /^[1-4]$/;
        return regexFront.test(userNoFront) && regexBack.test(userNoBack);
    }

    function validatePhone(phone) {
        let regex = /^01([0|1|6|7|8|9])([0-9]{8})$/;
        return regex.test(phone);
    }

    function validateForm() {
        let valid = true;

        let name = $('#userName').val();
        let nickname = $('#userNickname').val();
        let userNoFront = $('#userNoFront').val();
        let userNoBack = $('#userNoBack').val();
        let phone = $('#userPhone').val();

        if (!validateName(name)) {
            $('#nameCheckText').css('visibility', 'visible');
            valid = false;
        } else {
            $('#nameCheckText').css('visibility', 'hidden');
        }

        if (!validateNickname(nickname)) {
            $('#nicknameCheckText').css('visibility', 'visible');
            valid = false;
        } else {
            $('#nicknameCheckText').css('visibility', 'hidden');
        }

        if (!validateUserNo(userNoFront, userNoBack)) {
            $('#userNoCheckText').css('visibility', 'visible');
            valid = false;
        } else {
            $('#userNoCheckText').css('visibility', 'hidden');
            $('#userNo').val(userNoFront + userNoBack + '******');
        }

        if (phone && !validatePhone(phone)) {
            $('#phoneCheckText').css('visibility', 'visible');
            valid = false;
        } else {
            $('#phoneCheckText').css('visibility', 'hidden');
        }

        $('#nextButton').prop('disabled', !valid);
        $('#nextButton').toggleClass('disabled-button', !valid);

        return valid;
    }

    function checkUserNickname() {
        let userNickname = $('#userNickname').val();
        let nicknameCheckText = $('#nicknameCheckText');
        let nextButton = $('#nextButton');

        if (!validateNickname(userNickname)) {
            nicknameCheckText.text("닉네임은 3~10자리만 가능합니다.");
            nicknameCheckText.css('color', 'red');
            nicknameCheckText.css('visibility', 'visible');
            nextButton.addClass('disabled-button');
            nextButton.prop('disabled', true);
            return;
        }

        $.ajax({
            url: '/checkUserNickname.member',
            method: 'get',
            data: { userNickname: userNickname },
            success: function(response) {
            	console.log(response);
                if (response === "true") {
                    nicknameCheckText.text("사용할 수 있는 닉네임입니다.");
                    nicknameCheckText.css('color', 'green');
                    nextButton.removeClass('disabled-button');
                    nextButton.prop('disabled', false);
                } else {
                    nicknameCheckText.text("이미 사용 중인 닉네임입니다.");
                    nicknameCheckText.css('color', 'red');
                    nextButton.addClass('disabled-button');
                    nextButton.prop('disabled', true);
                }
                nicknameCheckText.css('visibility', 'visible');
            },
            error: function() {
                nicknameCheckText.text("닉네임 확인 중 오류가 발생했습니다.");
                nicknameCheckText.css('color', 'red');
                nicknameCheckText.css('visibility', 'visible');
                nextButton.addClass('disabled-button');
                nextButton.prop('disabled', true);
            }
        });
    }

    $(document).ready(function(){
        $('#userName, #userNickname, #userNoFront, #userNoBack, #userPhone').on('input', function() {
            validateForm();
        });

        $('#userNickname').on('input', function() {
            $('#nicknameCheckText').css('visibility', 'hidden');
            $('#nextButton').addClass('disabled-button');
            $('#nextButton').prop('disabled', true);

            if (validateNickname($(this).val())) {
                checkUserNickname();
            } else {
                $('#nicknameCheckText').text("사용 불가능한 닉네임입니다.");
                $('#nicknameCheckText').css('color', 'red');
                $('#nicknameCheckText').css('visibility', 'visible');
            }
        });
    });
    </script>
</body>
</html>
