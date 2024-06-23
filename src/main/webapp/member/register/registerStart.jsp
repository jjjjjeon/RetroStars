<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 약관 동의</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .logo {
            width: 100px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #333;
            margin-bottom: 20px;
        }

        .all-agree {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .all-agree input {
            margin-right: 10px;
            width: 20px;
            height: 20px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 50%;
            cursor: pointer;
            position: relative;
        }

        .all-agree input:checked {
            background-color: #e50914;
            border: none;
        }

        .all-agree input:checked::before {
            content: '✔';
            color: white;
            position: absolute;
            top: 0;
            left: 3px;
            font-size: 14px;
        }

        .note {
            font-size: 14px;
            color: #888;
            text-align: left;
            margin-bottom: 20px;
        }

        .checkbox-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
            font-size: 18px;
            margin: 20px 0;
            cursor: pointer;
            white-space: nowrap;
        }

        .checkbox-group input {
            margin-right: 10px;
            width: 20px;
            height: 20px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 50%;
            cursor: pointer;
            position: relative;
        }

        .checkbox-group input:checked {
            background-color: #e50914;
            border: none;
        }

        .checkbox-group input:checked::before {
            content: '✔';
            color: white;
            position: absolute;
            top: 0;
            left: 3px;
            font-size: 14px;
        }

        .checkbox-group .sub-label {
            margin-left: auto;
            font-size: 14px;
            color: #888;
        }

        .button-group {
            margin-top: 20px;
        }

        button {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            background-color: #e50914;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        button:disabled {
            background-color: #ccc;
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
        <h1>회원가입을 시작합니다!</h1>
        <p>약관에 동의해 주세요.</p>
        <form action="/term.member" method="post">
            <div class="all-agree" onclick="toggleAllAgree()">
                <input type="checkbox" id="agreeAll" onclick="toggleAllAgreeCheckbox(event)">
                <label for="agreeAll">모두 동의</label>
            </div>
            <div class="note">필수 및 선택 정보를 한번에 동의하실 수 있습니다.</div>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" id="term" name="term" class="agree-checkbox"> 서비스 이용약관 동의 (필수)
                    <span class="sub-label">&gt;</span>
                </label>
                <label>
                    <input type="checkbox" id="privacy" name="privacy" class="agree-checkbox"> 개인정보 수집 및 이용 동의 (필수)
                    <span class="sub-label">&gt;</span>
                </label>
                <label>
                    <input type="checkbox" id="ads" name="ads" class="agree-checkbox-ad"> 광고성 정보 수신 (선택)
                    <span class="sub-label">&gt;</span>
                </label>
            </div>
            <div class="button-group">
                <button id="nextButton" type="submit" disabled>다음</button>
            </div>
        </form>
    </div>
    <script>
        function toggleAllAgree() {
            let agreeAllCheckbox = document.getElementById('agreeAll');
            let agreeCheckboxes = document.querySelectorAll('.agree-checkbox, .agree-checkbox-ad');

            agreeAllCheckbox.checked = !agreeAllCheckbox.checked;
            agreeCheckboxes.forEach(checkbox => {
                checkbox.checked = agreeAllCheckbox.checked;
            });

            toggleNextButton();
        }

        function toggleAllAgreeCheckbox(event) {
            event.stopPropagation();
            let agreeAllCheckbox = document.getElementById('agreeAll');
            let agreeCheckboxes = document.querySelectorAll('.agree-checkbox, .agree-checkbox-ad');
            let allChecked = Array.from(agreeCheckboxes).every(checkbox => checkbox.checked);
            
            agreeAllCheckbox.checked = allChecked;

            toggleNextButton();
        }

        function toggleNextButton() {
            let agreeCheckboxes = document.querySelectorAll('.agree-checkbox');
            let nextButton = document.getElementById('nextButton');
            let requiredChecked = Array.from(agreeCheckboxes).filter(checkbox => !checkbox.classList.contains('agree-checkbox-ad')).every(checkbox => checkbox.checked);
            
            nextButton.disabled = !requiredChecked;
        }

        $(document).ready(function() {
            $('.agree-checkbox, .agree-checkbox-ad').change(toggleNextButton);
        });
    </script>
</body>
</html>
