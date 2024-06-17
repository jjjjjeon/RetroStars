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
 <style>
 
  .navbar {
        top: 0;
        width: 100%;
        height:70px;
    }
    
        /* 랭킹, 마이페이지 폰트 색상과 호버 효과 */
        .nav-link {
            color: white !important;
            /* margin-left: 20px; */
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }
 
 		div:focus{outline: border-bottom;}
 		
         body{ background-image: url(/image/background.png); background-size: cover;}

        *{box-sizing: border-box;}

        /*div{border: 1px solid red;}*/

        .container{height: 600px; width: 800px; margin:auto;display: flex; color:white;}
        .col{display: flex; justify-content: center; align-items: center;}
        .layout_empty_box{height:49px;}
            
        .col1{background-color: rgba(24, 6, 79, 0.9); flex:3; border-radius: 20px; display: flex; flex-direction: column; }
        .col1_sub{width: 100%;}
        .col1_profile_img{flex:4;display: flex; justify-content: center; align-items: center;}
        #profile_img{height:80%; width:80%; border-radius:10px;}
        /*
        .col1_profile_update{margin-left:10px; flex:1; display: flex; justify-content: center; align-items: center;}
        .col1_file{width: 95%; font-size:15px;}
        */
        .col1_id{flex:1; display: flex;}
        .col1_id_id{flex:6; font-weight: 800; font-size: 28px; display: flex; justify-content: center; align-items: center;}
        .col1_id_level{flex:4;display: flex; justify-content: center; align-items: center;}
        .col1_empty{flex:1;}
        .col1_btns{flex:3; display: flex; justify-content: space-evenly; align-items: center;}
		#password_btn{height:60%; width:38%; background-color: rgb(82, 11, 117); color:white; border:0px;}
		#password_btn:hover{cursor:pointer; background-color:rgb(82, 11, 100);}
		#img_update_btn{height:60%; width:38%; background-color: rgb(82, 11, 117); color:white; border:0px;}
		#img_update_btn:hover{cursor:pointer; background-color:rgb(82, 11, 100);}
        .col2{flex:0.3;}

        .col3{background-color: rgba(82, 11, 117, 0.8); flex:7;border-radius: 20px; display: flex; flex-direction: column;}
        .value_box{display:flex; width: 100%; font-size: 20px; flex:1.2;align-items: center;} 
        .value_title{flex:3;display: flex; justify-content: start; align-items: center; text-indent: 70px;}
        .value_content{height:80%; flex:7; display: flex; justify-content: start; align-items: center;}
        .value_title1{flex:3.5; display: flex; justify-content: start; align-items: center; text-indent: 39px; }
        .value_content1{height:80%; flex:1.5; display: flex; justify-content: center; align-items: center; text-indent: 20px; }
        .value_title2{flex:2;display: flex; justify-content: start; align-items: center;}
        .value_content2{flex:3; display: flex; justify-content: start; align-items: center; height:100%;}
         #gender_box{width:85%; height:50%;}
        .col3_empty_box{flex:1.5; width:100%;}
        .col3_btn_box{flex:1; width:100%; display: flex; justify-content: end; align-items: start; margin-right: 70px;}

        .col_attr{ width: 100%; height: 100%; display: flex; justify-content: center; align-items: center; text-align: center;}
		.input_bgc{background-color: rgba(82, 11, 117, 0); border:0px; color:white; font-size:18px;}
		
		.footer {position : fixed; width: 100%;background-color: #323232; bottom:0;height: 150px;}
        .leftfooter{color : white;font-weight : bold;margin-top: 20px;}
        .rightfooter {display: flex; align-items: center; }
        .footerbox {width: 1000px;height: 100%;margin: auto;display: flex;justify-content: space-between;align-items: center;}
        .iconbox {display: flex;align-items: center;}
        .iconbox a {margin: 0 10px;font-size: 50px;color: white;}
        .coinbox {display: flex;align-items: center; margin-left: 20px;}
        .coinbox img { width: 120px; height: 100px;margin-left : 20px;}
        
    </style>
</head>
<body>
<form>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index.jsp">홈으로</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게임
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">game1</a></li>
                            <li><a class="dropdown-item" href="#">game2</a></li>
                            <li><a class="dropdown-item" href="#">game3</a></li>
                            <li><a class="dropdown-item" href="#">game4</a></li>
                            <li><a class="dropdown-item" href="#">game5</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">자유게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">공략게시판</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">QA게시판</a></li>
                            <li><a class="dropdown-item" href="#">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="/list.nboard">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
				        <li class="nav-item">
				           <a class="nav-link" href="/mypage.member">
				               <img src="${sessionScope.profileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
				           </a>
				       </li>                  
                      <li class="nav-item">
                           <a class="nav-link" href="/mypage.member">마이페이지</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
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
  <div class="container">
            <div class="col mydata_chage col1 col_attr"> 
                <div class="col1_profile_img col1_sub">
                	<img id="profile_img" src="/upload/${userProfileUrl}">
                </div>
                <!-- 
                <div class="col1_profile_update col1_sub">
                    <input type="file" class="col1_file">
                </div>
                 -->
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
                    <input type="text" class="user_name_value value_content input_bgc" value="${mydata.userName}">
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_nickname value_title">닉네임  : </div>
                    <input type="text" class="user_name_value value_content input_bgc" value="${mydata.userNickname}">
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_birth value_title1">생년월일  : </div>
                    <input type="text" class="user_brith_value value_content1 input_bgc" value="${birth}">
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
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">이메일  : </div>
                     <input type="text" class="user_name_value value_content input_bgc" value="${mydata.userEmail}">
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">핸드폰  : </div>
                     <input type="text" class="user_name_value value_content input_bgc" value="${phone}">
                </div>
                <div class="col3_empty_box"></div>
                <div class="col3_btn_box">
                    <button id="return_my_page" type="button">돌아가기</button>
                    <button id="complete">완료</button>
                </div>
            </div>           
   		 </div>
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
</form>
	<script>
	$(".value_content").attr("contenteditable", "true");
	$(".value_content1").attr("contenteditable", "true");
	
	$("#img_update_btn").on("click",function(){
		
		let popupWidth = 500;
		let popupHeight = 400;

		let popupX = (window.innerWidth - popupWidth) / 2 + window.screenX;
	    let popupY = (window.innerHeight - popupHeight) / 2 + window.screenY;
		
		//let popupX = (window.screen.width - popupWidth) / 2;
	    //let popupY = (window.screen.height - popupHeight) / 2;
		
		//let left = Math.ceil(( window.screen.width - 400 )/2);
    	//let top = Math.ceil(( window.screen.height - 300 )/2); 
		let new_window = window.open("/member/mypage/updateProfileImg.jsp","","height=" + popupHeight  + ", width=" + popupWidth  + ", left="+ popupX + ", top="+ popupY);
		
		
		
	})
	
	$("#password_btn").on("click",function(){
		alert("비밀번호 변경 버튼 확인");
	})
	
	$("#return_my_page").on("click",function(){
		location.href="/mypage.member";
	})
	
	</script>
</body>
</html>