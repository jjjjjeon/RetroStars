<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">

<style>
        body {
            background: url(/image/background.png) no-repeat center center fixed;
            background-size: cover;
            font-family : 'DalseoHealing';
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
        <h1>비밀번호를 입력해주세요</h1>
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요">
            <div class="error" id="errorMessage"></div>
            <input id="btn" type="button" value="완료">
    </div>
    <script>
    
    	$("#btn").on("click", function() {
    		
    		let pw = document.getElementById('pw').value;
    		let errorMessage = document.getElementById('errorMessage');
    		
    		$.ajax({
                url: "/pwIsRight.member",
                type: "post",
                data: {
                    pw: pw
                }
            }).done(function(response) {
                if(response == "성공"){
                	location.href="/member/mypage/updatePw.jsp";
                }else{
                	alert("잘못된 비밀번호 입니다.")
                }
            });
    		
    	})
    </script>
</body>
</html>