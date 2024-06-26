<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">

 <style>
 
  .navbar {
           top: 0;
           width: 100%;
           z-index: 1000;
           height:70px;
           background-color : #323232;
       }
       .navbar-brand{
          color:white;
       }
       .nav-link {
            color: white !important;			
       }

       .nav-link:hover {
 			background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
       }
       .nav-item{
           align-items: center;
    	   display: flex;
       }

      .btn{
         color:white;
      }
 
      .btn:hover{
         color:white;
      }
      .dropdown-menu{
         background-color: #323232;
         text-align: center; /* 중앙 정렬을 위한 설정 */
         width: 100%; /* 너비를 100%로 설정 */
      }
      .dropdown-item{
         background-color: #323232;
         color:white;
      }


      a {
		  text-decoration: none !important;
	  }
	  
	  a:link { color: white; text-decoration: none;}
 	  a:visited { color: white; text-decoration: none;}
	  a:hover { color: white; text-decoration: underline;}
 
 		div:focus{outline: border-bottom;}
 		
        body{ background-image: url(/image/background.png); background-size: cover; font-family : 'DalseoHealing';}

        *{box-sizing: border-box;}

        /*div{border: 1px solid red;}*/

        .container{height: 600px; width: 800px; margin:auto;display: flex; color:white;}
        .col{display: flex; justify-content: center; align-items: center;}
        .layout_empty_box{height:49px;}
            
        .col1{background-color: rgba(24, 6, 79, 1); flex:3; border-radius: 20px; display: flex; flex-direction: column; }
        .col1_sub{width: 100%;}
        .col1_profile_img{flex:4;display: flex; justify-content: center; align-items: center;}
        #profile_img{height:85%; width:85%; border-radius:10px;}
        /*
        .col1_profile_update{margin-left:10px; flex:1; display: flex; justify-content: center; align-items: center;}
        .col1_file{width: 95%; font-size:15px;}
        */
        .col1_id{flex:1; display: flex;}
        .col1_id_id{flex:6; font-weight: 800; font-size: 28px; display: flex; justify-content: center; align-items: start;  text-indent: 25px;}
        .col1_id_level{flex:4;display: flex; justify-content: center; align-items: start;}
        .col1_empty{flex:1;}
        .col1_btns{flex:3; display: flex; justify-content: space-evenly; align-items: center;}
		#password_btn{height:60%; width:38%; background-color: rgb(82, 11, 117); color:white; border:0px;}
		#password_btn:hover{cursor:pointer; background-color:rgb(82, 11, 100);}
		#img_update_btn{height:60%; width:38%; background-color: rgb(82, 11, 117); color:white; border:0px;}
		#img_update_btn:hover{cursor:pointer; background-color:rgb(82, 11, 100);}
        .col2{flex:0.3;}

        .col3{background-color: rgba(82, 11, 117,1); flex:7;border-radius: 20px; display: flex; flex-direction: column;}
        .value_box{display:flex; width: 100%; font-size: 20px; flex:2; align-items: center;} 
        .value_title{width:30%; display: flex; justify-content: start; align-items: center; text-indent: 70px;}
        .value_content{height:80%; display: inline; justify-content: start; align-items: center;}
        .value_title1{width:30%; display: flex; justify-content: start; align-items: center; text-indent: 50px; }
        .value_content1{height:80%; width:30%; display: inline; justify-content: center; align-items: center;}
        .value_title2{width:15%; display: flex; justify-content: start; align-items: center;}
        .value_content2{flex:3; display: flex; justify-content: start; align-items: center; height:100%;}
         #gender_box{width:85%; height:70%;}
        .col3_empty_box{flex:1; width:100%;}
        .col3_btn_box{flex:1.5; width:100%; display: flex; justify-content: end; align-items: start; margin-right: 70px;}
		p{width:100%; height:10px; font-size:15px;}

        .col_attr{ width: 100%; height: 100%; display: flex; justify-content: center; align-items: center; text-align: center;}
		.input_bgc{background-color: rgba(82, 11, 117, 0); border:0px; color:white; font-size:18px;}
		
		  .footer {
            width: 100%;
            background-color: #323232;
            position: relative;
            margin-top: auto;
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
        
        .thumbnail{
           border-radius: 20px;
           width: 356px;
           height: 230px;
           object-fit: cover;
        }
        

        a {
          text-decoration: none !important;
      }
       a:link { color: white; text-decoration: none;}
       a:visited { color: white; text-decoration: none;}
       a:hover { color: white; text-decoration: underline;}
        
        input::placeholder{font-size:12px;}
        
        
         .checkText {
            visibility: hidden;
            margin-top: 5px;
            color: red;
        }
        .disabled-button {
            background-color: purple;
            cursor: not-allowed;
            border:0px;
        }
        .btn-color{background-color: purple; border:0px;}
        .btn-color:hover{back}
        
        
        
    </style>
</head>
<body>

 <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
        	
            <a class="navbar-brand" href="/index.jsp"><img src="/image/headerlogo.png" alt="" style="width: 80px; height: 60px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게임
                        </button>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=1">2048</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=2">GOLD BREAK!</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=3">ICE CUBY</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=4">똥 피하기</a></li>
                            <li><a class="dropdown-item" href="/viewGame.gboard?gameSeq=5">탈출하기</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu">
                        	<li><a class="dropdown-item" href="/list.nboard">공지사항</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티</a></li>
							<li><a class="dropdown-item" href="/list.review">게임리뷰</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">Q&A게시판</a></li>
                            <li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
                            
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/list.playrecord">랭킹</a>
                    </li>
                   

                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
                   
                   <c:if test="${isAdmin eq true}">
                    	<li class="nav-item">
                           <a class="nav-link" href="/dashBoard.admin">관리자페이지</a>
                    	</li>
                   </c:if>	
                     <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
                     </li>
                     
                    <li class="nav-item">
                       <a class="nav-link" href="/mypage.member">
                           <img src="/profile/${userProfileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
                       </a>
                    </li>                  


                   </ul>                          
                   </c:when>
                   <c:otherwise>
                      <ul class="navbar-nav ms-auto">
                          <li class="nav-item">
                              <a class="nav-link" href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
                          </li>
                      </ul>
                   </c:otherwise>
                </c:choose>

            </div>
        </div>
    </nav>
  <div class="layout_empty_box"></div>
  
 <form action="/updateData.member" method="post" onsubmit="return validateForm()">
  <div class="container">
            <div class="col mydata_chage col1 col_attr"> 
                <div class="col1_profile_img col1_sub">
                	<img id="profile_img" src="/profile/${userProfileUrl}">
                </div>
                <div class="col1_id col1_sub">
                    <div class="col1_id_id">${mydata.userId}</div>
                    <div class="col1_id_level">${mydata.userLevel}</div>
                </div> 
                <div class="col1_empty col1_sub"></div>
                <div class="col1_btns">
                	<button id="img_update_btn" type="button">프로필 변경</button>
                	<button id="password_btn" type="button">비밀번호 변경</button>
                </div>
                 <div class="col1_empty col1_sub"></div>
            </div>
            <div class="col col2 empty"></div>

            <div class="col col3 col_attr">
                <div class="col3_empty_box"></div>
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">이 름  : </div>
                    <input id="input_name" type="text" class="user_name_value value_content input_bgc" name="userName" value="${mydata.userName}" required>
                </div>
                <p id="nameCheckText" class="checkText">이름은 2~5글자의 한글만 가능합니다.</p>
                
                <div class="col3_value_box value_box">
                    <div class="user_nickname value_title">닉네임  : </div>
                    <input id="input_nickname" type="text" class="user_name_value value_content input_bgc" name="userNickname" value="${mydata.userNickname}" required>
                </div>
                <p id="nicknameCheckText" class="checkText">닉네임은 3~10글자의 한글, 영어, 숫자만 가능합니다.</p>
                
                <div class="col3_value_box value_box">
                    <div class="user_birth value_title1">생년월일  : </div>
                    <input id="input_birth" type="text" class="user_birth_value value_content1 input_bgc" name="userBirth" value="${birth}" required>
                    <div class="user_gender value_title2">성별  : </div>
                    <div class="user_gender_value value_content2">
                    	<c:choose>
                    	<c:when test="${gender=='Male'}">
                    	<select id="gender_box" name="gender">
  							<option value="Male" selected="selected">남자</option>
  							<option value="Female">여자</option>
						</select>
						</c:when>
						<c:when test="${gender=='Female'}">
						<select id="gender_box" name="gender">
  							<option value="Male">남자</option>
  							<option value="Female" selected="selected">여자</option>
						</select>
						</c:when>
						</c:choose>
					</div>
                </div>
               <p id="birthCheckText" class="checkText">형식이 맞지 않습니다. (예: 98.12.12)</p>
               
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">이메일  : </div>
                     <input id="input_email" type="email" class="user_name_value value_content input_bgc" name="userEmail" value="${mydata.userEmail}" required>
                </div>
                 <p id="emailcheckText" class="checkText">유효하지 않은 이메일 형식입니다.</p>
                 
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">핸드폰  : </div>
                     <input id="input_phone" type="text" class="user_name_value value_content input_bgc" name="userPhone" value="${phone}" required>
                </div>
                <p id="phoneCheckText" class="checkText">폰 번호 형식이 맞지 않습니다. (예: 010-1234-5678)</p>
                
                <div class="col3_empty_box"></div>
                <div class="col3_btn_box">
                    <button id="return_my_page" type="button" class="btn btn-dark btn-color">돌아가기</button>
                    <button id="complete" type="submit" class="disabled-button btn btn-dark btn-color">완료</button>
                </div>
            </div>           
   		 </div>
    </form>
   	<div class="layout_empty_box"></div>
    <div class="footer">
        <div class="footerbox">
            <div class="leftfooter">
                <p>회사명: 팀별빛</p>
                <p>전화: 02-1234-5678</p>
                <p>이메일: info@example.com</p>
            </div>
            <div class="rightfooter">
                <div class="iconbox">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
                <div class="coinbox">
                    <img src="/image/coin.png" alt="">
                </div>
            </div>
        </div>
    </div>
	<script>
	$(".value_content").attr("contenteditable", "true");
	$(".value_content1").attr("contenteditable", "true");
	
	$("#img_update_btn").on("click",function(){
		
		let popupWidth = 500;
		let popupHeight = 400;

		let popupX = (window.innerWidth - popupWidth) / 2 + window.screenX;
	    let popupY = (window.innerHeight - popupHeight) / 2 + window.screenY;
		
		let new_window = window.open("/member/mypage/updateProfileImg.jsp","","height=" + popupHeight  + ", width=" + popupWidth  + ", left="+ popupX + ", top="+ popupY);
		
		let timer = setInterval(function() {
	        if (new_window.closed) {
	            clearInterval(timer);
	            // 부모 창 새로고침
	            location.reload();
	        }
	    }, 500);
	})
	
	$("#password_btn").on("click",function(){
		
		let popupWidth = 500;
		let popupHeight = 350;

		let popupX = (window.innerWidth - popupWidth) / 2 + window.screenX;
	    let popupY = (window.innerHeight - popupHeight) / 2 + window.screenY;
	    let new_window = window.open("/member/mypage/pwIsRight.jsp","","height=" + popupHeight  + ", width=" + popupWidth  + ", left="+ popupX + ", top="+ popupY);
	    
	    
	})
	
	$("#return_my_page").on("click",function(){
		location.href="/mypage.member";
	})	
	
	function validateName(name) {
        let regex = /^[가-힣]{2,5}$/;
        return regex.test(name);
    }

    function validateNickname(nickname) {
        let regex = /^[a-zA-Z0-9가-힣]{3,10}$/;
        return regex.test(nickname);
    }

    function validateBirth(birth) {
        let regex = /^\d{2}\.([0]\d|[1][0-2])\.([0][1-9]|[1-2]\d|[3][0-1])$/;
        return regex.test(birth);
    }
    
    function validateEmail(email) {
        let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }

    function validatePhone(phone) {
    	let regex = /^01[016789]-\d{3,4}-\d{4}$/
        return regex.test(phone);
    }

    function validateForm() {
    	
        let valid = true;
        
        let name = $('#input_name').val();
        let nickname = $('#input_nickname').val();
        let birth= $('#input_birth').val();
        let email = $('#input_email').val();
        let phone = $('#input_phone').val();
        

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

        if (!validateBirth(birth)) {
            $('#birthCheckText').css('visibility', 'visible');
            valid = false;
        } else {
            $('#birthCheckText').css('visibility', 'hidden');
        }

        if (!validatePhone(phone)) {
            $('#phoneCheckText').css('visibility', 'visible');
            valid = false;
        } else {
            $('#phoneCheckText').css('visibility', 'hidden');
        }

        if (!validateEmail(email)) {
        	 $('#emailcheckText').css('visibility', 'visible');
        	 valid = false;
        	 
        } else {
        	 $('#emailcheckText').css('visibility', 'hidden');
            
        }

        $('#complete').prop('disabled', !valid);
        $('#complete').toggleClass('disabled-button', !valid);

        return valid;
    }

    function checkUserNickname() {
    	
        let userNickname = $('#input_nickname').val();
        let nicknameCheckText = $('#nicknameCheckText');
        let nextButton = $('#nickname_check');

        if (!validateNickname(userNickname)) {
            
            nextButton.prop('disabled', true);
            return;
        }

        $.ajax({
            url: '/checkUserNicknameUpdate.member',
            method: 'get',
            data: { userNickname: userNickname },
            success: function(response) {
            	console.log(response);
                if (response === "true") {
                    nicknameCheckText.text("사용할 수 있는 닉네임입니다.");
                    nicknameCheckText.css('color', 'green');
                    nextButton.removeClass('disabled-button');
                    nextButton.prop('disabled', false);
                    
                    
                }else if (response === "before") {
                    nicknameCheckText.text("기존 닉네임입니다.");
                    nicknameCheckText.css('color', 'green');
                    nextButton.removeClass('disabled-button');
                    nextButton.prop('disabled', false);
                    console.log(nextButton.prop);
                    
                }else {
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
    	
        $('#input_name, #input_nickname, #input_birth, #input_phone, #input_email').on('input', function() {
            validateForm();
        });
        
        $('#input_nickname').on('input', function() {
            $('#nicknameCheckText').css('visibility', 'hidden');
            $('#complete').addClass('disabled-button');
            $('#complete').prop('disabled', true);

            if (validateNickname($(this).val())) {
                checkUserNickname();
                $('#complete').prop('disabled', false);
                
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