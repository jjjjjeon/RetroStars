<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@exampledev/new.css">
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>  
		body{
			   font-family: 'Georgia', serif;
               background-image: url('/image/background.png');
               background-position: center;
               display: flex;
               height : 100vh;
               justify-content: center;
		       align-items: center;
            }
		nav{
               background-color: #323232;
            
            }
 		.footer {
            width: 100%;
            background-color: #323232;
            postion:fixed; 
            bottom:0; 
            height: 150px;            
        }
        .leftfooter{
           color : white;
           font-weight : bold;
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
            margin-left : 20px;
        }		


        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 60px;
            border-radius: 10px;
            text-align: center;
            justify-content: center;
            align-items: center;           
            max-width: 400px;
            width: 100%;            
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin:0 auto;
            position : absolute;
        }
        .container h1 {

            color:white;
        }
        .container input {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background: #333;
            color: white;
        }
        .container button {
            width: 80%;
            padding: 10px;
            background-color: #e50914;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        .container button:hover {
            background-color: #b20710;
        }
        .container a {
            color: #aaa;
            text-decoration: none;
            font-size: 12px;
            margin-top: 10px;
        }
        .container a:hover {
            text-decoration: underline;
        }
        .social-login {
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .social-login a{
			width: 40px;
            margin: 0 10px;
        }        
        .social-login img {
            width: 40px;
            margin: 0 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

	    <div class="container">	    
	        <h1>Retro Stars 로그인</h1>
	        <form id="login-form" action="/login.member" method="post">
	            <input type="text" name="id" id="id" placeholder="아이디" required>
	            <input type="password" name="pw" id="password" placeholder="비밀번호" required>
	            <button type="submit">로그인</button>
	        </form>
	        <a href="/member/login/findId.jsp">아이디를 잊어버리셨나요?</a>   | 
	        <a href="/member/login/findPw.jsp">비밀번호를 잊어버리셨나요?</a>
	        <div class="social-login">
	            <img src="/image/google_login.png" alt="Google">
	            <a href="javaScript:kakaoLogin()"><img src="/image/kakao_login.png" alt="Kakao"></a>
	            <img src="/image/naver_login.png" alt="Line">
	        </div>
	        <a href="/member/register/registerStart.jsp" class="register-link">계정이 없나요? 새로운 계정을 생성해주세요.</a>
	    </div>d

    

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
	    function kakaoLogin() {
	        Kakao.Auth.login({
	            success: function (response) {
	                Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function (response) {
							sendUserInfoToServer(response);
	                    },
	                    fail: function (error) {
	                        alert(JSON.stringify(error))
	                    },
	                })
	            },
	            fail: function (error) {
	                alert(JSON.stringify(error))
	            },
	        })
	    }
	    
	    function sendUserInfoToServer(userData){
	    	$.ajax({
	    		type:"post",
	    		url:"/kakaoLogin.member",
	    		data: {
	    			id:userData.id,
	    			nickname: userData.properties.nickname
	    		}	    		
	    	}).done(function(data){
	    		console.log("확인");
	    	});
	    	
	    }
        $(document).ready(function(){
            $('#login-form').submit(function(event){
                const id = $('#id').val();
                const password = $('#password').val();
                if(id === "" || password === "") {
                    event.preventDefault();
                    alert("모든 필드를 입력해주세요.");
                }
            });
            Kakao.init('9c567e58c04139a37cf1de438a4b6ffa');

            
        });
    </script>
</body>
</html>