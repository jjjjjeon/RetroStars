<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
		body{
			   font-family : 'DalseoHealing';
               display: flex;
               height : 100vh;
               justify-content: center;
		       align-items: center;
		       color : white;
            }
            
	   .video-background{
	      position : fixed;
	      top : 0;
	      left : 0;
	      min-width : 100%;
	      min-height : 100%;
	      width: auto;
	      height : auto;
	      z-index: -1;
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

            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .container h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        
        .input-group {
        	position : relative;
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
            margin-top : 15px;
            border: none;
            border-radius: 5px;
            background: #333;
            color: white;
            gap: 20px;
            
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
</head>
<body>

         <video class="video-background" autoplay muted loop>
           <source src="/image/video.mp4" type="video/mp4">
           Your browser does not support the video tag.
       </video>
    <div class="background"></div>
    <div class="container">
        <h1>아이디 찾기</h1>
        <form id="find-id-form" action="/findId.member" method="post">
            <div class="input-group">
                <input type="text" id="name" name="name" placeholder="이름" required>
                <br>
                <input type="email" id="email" name="email" placeholder="이메일" required>
            </div>
            <button type="submit">확인</button>
        </form>
        <div class="links">
            <a href="/member/login/findPw.jsp">비밀번호 찾기</a>
        </div>
    </div>
</body>
</html>