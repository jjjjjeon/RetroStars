<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <style>
        body {
            background: url(/image/background.png) no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 300px;
            /* margin: auto; */
        }
        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            width: 300px;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        input[type="password"], input[type="button"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #45a049;
        }
        .error {
            color: #ff0000;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>비밀번호 변경</h1>
            <input type="password" id="newPassword" name="newPw" placeholder="새 비밀번호" required>
            <input type="password" id="confirmPassword" name="newConfirmPw" placeholder="비밀번호 확인" required>
            <div class="error" id="errorMessage"></div>
            <input id="btn" type="button" value="변경">
    </div>
    <script>
    
        $("#btn").on("click", function() {
            
            let newPassword = document.getElementById('newPassword').value;
            let confirmPassword = document.getElementById('confirmPassword').value;
            let errorMessage = document.getElementById('errorMessage');

            // 비밀번호 유효성 검사
            if (newPassword.length < 8 || newPassword.length > 24) {
                errorMessage.textContent = "비밀번호는 8~24자 이내여야 합니다.";
                return;
            }
            if (!/[0-9]/.test(newPassword)) {
                errorMessage.textContent = "비밀번호에 숫자가 포함되어야 합니다.";
                return;
            }
            if (!/[!@#$%^&*]/.test(newPassword)) {
                errorMessage.textContent = "비밀번호에 특수문자가 포함되어야 합니다.";
                return;
            }
            if (newPassword !== confirmPassword) {
                errorMessage.textContent = "비밀번호가 일치하지 않습니다.";
                return;
            }

            // 유효성 검사를 통과하면 폼 제출
            errorMessage.textContent = "";
                      
            $.ajax({
                url: "/updatePw.member",
                type: "post",
                data: {
                    newPw: newPassword,
                    newConfirmPw: confirmPassword
                },
                success: function(response) {
                    alert('비밀번호가 성공적으로 변경되었습니다.');
                    if (window.opener && window.opener.parent) {
                        window.opener.parent.location.href = "/logout.member";
                    }
                    window.close();
                },
                error: function() {
                    errorMessage.textContent = "비밀번호 변경에 실패했습니다. 다시 시도해 주세요.";
                }
            });
            
        });
        
        
        
	 	
    </script>
</body>
</html>