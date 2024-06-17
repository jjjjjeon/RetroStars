<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<style>
		body{
			   font-family: 'Georgia', serif;
               background-image: url('/image/background.png');
               background-position: center;
               display: flex;
               height : 100vh;
               justify-content: center;
		       align-items: center;
		       color : white;
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
    
    .links {
        margin-top: 20px;
    }
    
    .links a {
        color: #aaa;
        text-decoration: none;
        font-size: 12px;
        display: block;
        margin-top: 10px;
    }
    
    .links a:hover {
        text-decoration: underline;
    }   
</style>
<body>
    <div class="background"></div>
    <div class="container">
        <h1>비밀번호 찾기</h1>
        <form id="find-password-form" action="/sendCode">
            <div class="input-group">
                <label for="email">이메일 주소 입력</label>
                <input type="email" id="email" name="email" placeholder="이메일" required>
            </div>
            <button type="submit">확인</button>
        </form>
        <div class="links">
            <a href="/member/login/findId.jsp">아이디 찾기</a>
            <a href="#">고객센터 문의</a>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $('#find-password-form').submit(function(event){
                event.preventDefault();
                const email = $('#email').val();
                if(email === "") {
                    alert("이메일 주소를 입력해주세요.");
                } else {
                    alert("입력한 이메일 주소로 비밀번호 찾기 이메일을 전송했습니다.");
                    // 전송 로직 추가 예정
                }
            });
        });
    </script>
</body>
</html>