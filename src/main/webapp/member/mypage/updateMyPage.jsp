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
        .col1_profile_img{flex:4;}
        .col1_profile_update{flex:1; display: flex; justify-content: center; align-items: center;}
        .col1_file{width: 95%;}
        .col1_id{flex:1; display: flex;}
        .col1_id_id{flex:6; font-weight: 800; font-size: 25px; display: flex; justify-content: center; align-items: center;}
        .col1_id_level{flex:4;display: flex; justify-content: center; align-items: center;}
        .col1_empty{flex:4;}

        .col2{flex:0.3;}

        .col3{background-color: rgba(82, 11, 117, 0.8); flex:7;border-radius: 20px; display: flex; flex-direction: column;}
        .value_box{display:flex; width: 100%; font-size: 20px; flex:1.2;} 
        .value_title{flex:4;display: flex; justify-content: start; align-items: center; text-indent: 70px;}
        .value_content{flex:6; display: flex; justify-content: start; align-items: center;}
        .col3_empty_box{flex:1.5; width:100%;}
        .col3_btn_box{flex:1; width:100%; display: flex; justify-content: end; align-items: start; margin-right: 70px;}

        .col_attr{ width: 100%; height: 100%; display: flex; justify-content: center; align-items: center; text-align: center;}

    </style>
</head>
<body>
  <div class="container">
            <div class="col mydata_chage col1 col_attr"> 
                <div class="col1_profile_img col1_sub">이미지</div>
                <div class="col1_profile_update col1_sub">
                    <input type="file" class="col1_file">
                </div>
                <div class="col1_id col1_sub">
                    <div class="col1_id_id">아이디</div>
                    <div class="col1_id_level">레벨</div>
                </div> 
                <div class="col1_empty col1_sub"></div>
            </div>
            <div class="col col2 empty"></div>

            <div class="col col3 col_attr">
                <div class="col3_empty_box"></div>
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">이름  : </div>
                    <div class="user_name_value value_content">가상인</div>
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_nickname value_title">닉네임  : </div>
                    <div class="user_nickname_value value_content">user1234</div>
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">주민번호  : </div>
                    <div class="user_name_value value_content">991101-1******</div>
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">이메일  : </div>
                    <div class="user_name_value value_content">admin@gmail.com</div>
                </div>
                <div class="col3_value_box value_box">
                    <div class="user_name value_title">핸드폰  : </div>
                    <div class="user_name_value value_content">010-8659-5232</div>
                </div>
                <div class="col3_empty_box"></div>
                <div class="col3_btn_box">
                    <button>돌아가기</button>
                    <button>완료</button>
                </div>
            </div>           
    </div>
 </div>

</body>
</html>