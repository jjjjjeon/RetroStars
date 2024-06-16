<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 <style>
 
 		div:focus{outline: border-bottom;}
         html{
            background-image: url(/image/background.png); background-size: cover;color: white;
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;}

        *{box-sizing: border-box;}

        /* div{border: 1px solid red;} */

        .container{height: 600px; width: 800px; margin:auto;display: flex;}
        .col{display: flex; justify-content: center; align-items: center;}
            
        .col1{background-color: rgba(24, 6, 79, 0.9); flex:3; border-radius: 20px; display: flex; flex-direction: column; }
        .col1_sub{width: 100%;}
        .col1_profile_img{flex:4;display: flex; justify-content: center; align-items: center;}
        #profile_img{height:80%; width:80%; border-radius:10px;}
        .col1_profile_update{margin-left:10px; flex:1; display: flex; justify-content: center; align-items: center;}
        .col1_file{width: 95%;}
        .col1_id{flex:1; display: flex;}
        .col1_id_id{flex:6; font-weight: 800; font-size: 28px; display: flex; justify-content: center; align-items: center;}
        .col1_id_level{flex:4;display: flex; justify-content: center; align-items: center;}
        .col1_empty{flex:1;}
        .col1_password_btn{flex:2; display: flex; justify-content: center; align-items: center;}
		#password_btn{height:70%; width:100%; background-color: rgb(82, 11, 117); color:white; border:0px;}
		#password_btn:hover{cursor:pointer; background-color:rgb(82, 11, 100);}
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
    </style>
</head>
<body>
<form>
  <div class="container">
            <div class="col mydata_chage col1 col_attr"> 
                <div class="col1_profile_img col1_sub">
                	<img id="profile_img" src="${mydata.userProfileUrl}">
                </div>
                <div class="col1_profile_update col1_sub">
                    <input type="file" class="col1_file">
                </div>
                <div class="col1_id col1_sub">
                    <div class="col1_id_id">${mydata.userId}</div>
                    <div class="col1_id_level">${mydata.userLevel}</div>
                </div> 
                <div class="col1_empty col1_sub"></div>
                <div class="col1_password_btn">
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
                    	<select id="gender_box" name="gender">
  							<option value="Male" selected="selected">남자</option>
  							<option value="Female">여자</option>
						</select>
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
</form>
	<script>
	$(".value_content").attr("contenteditable", "true");
	$(".value_content1").attr("contenteditable", "true");
	
	$("#password_btn").on("click",function(){
		alert("비밀번호 변경 버튼 확인");
	})
	
	$("#return_my_page").on("click",function(){
		location.href="/mypage.member";
	})
	
	</script>
</body>
</html>