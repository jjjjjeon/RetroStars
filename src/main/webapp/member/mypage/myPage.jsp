<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
 *{box-sizing: border-box;}

    .container{
        margin: auto;
        display: flex;
        flex-direction: column;
        height: 900px;
        width: 1200px;
        justify-content: center;
        align-items: center;
    }
    
    /* div{border:1px solid black;} */

    .header{flex:0.5; width: 100%;}

    .profilebox{flex:2.5; width: 90%; border:1px solid black; display: flex;}
    .profile{height: 100%;width: 95%;margin: auto; display: flex; justify-content: center; align-items: center} 
    .main_profile{height: 100%;width: 50%;display: flex; justify-content: center; align-items: center}
    .profile_img{width:40%; height: 80%;border:1px solid black; }
    .profile_data{width:60%; height: 80%;}

    .user_value_box{display: flex; font-size: 18px; height: 42px;}
    .user_id{flex:1.5; display:flex; justify-content: start; text-indent: 5px;}
    .user_id_value{flex:4;}
    .user_level{flex:2;}
    .user_level_value{flex:3;text-indent: 5px;}

    .value_title{flex:2.5; display:flex; justify-content: start;text-indent: 5px;}
    .value_content{flex:7.5;}
    .value_content1{flex:4;}
    .value_content2{flex:3.5;}
    
    .rpg{height: 90%; width: 50%; display: flex; flex-direction: column; border:1px solid black; justify-content: center; align-items: center;}
    .rpg_title{flex:2; width: 100%; display: flex; align-items: center; font-size: 20px; font-weight: 700; text-indent: 20px;}
    .rpg_main_box{display:flex; width: 100%; flex:8;}
    .rpg_main_img{flex:6; display: flex; align-items: center; justify-content: center; }
    .rpg_img{height:90%; width: 90%; border:1px solid black;}
    .rpg_main_content{flex:4;display: flex; flex-direction: column;}
    .rpg_content{flex:1; display: flex; justify-content: start; align-items: center; margin-bottom: 8px;}

    .freeboard{flex:2.5; width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;}
    .board_title{flex:2; width: 90%; display: flex; justify-content: start; align-items: end; text-indent: 10px; font-size: 20px; font-weight: 700; margin-bottom: 5px;}
    .board_main{flex:8; width: 90%;border:1px solid black;}

    .tipboard{flex:2.5; width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;}

    .footer{flex:0.5; width: 90%; display: flex; justify-content: end; align-items: center;}

    .row{display: flex;}

    .logo{width: 20%;}
    .headertitle{width: 60%;}
    .navi{width: 20%;}
</style>

</head>
<body>
 <div class="container">
        <div class="header row">
            <div class="logo">logo</div>
            <div class="headertitle">ooo 님의 My page</div>
            <div class="navi">네비바 넣을 예정</div>
        </div>
        <div class="profilebox">
            <div class="profile">
                <div class="main_profile">
                    <div class="profile_img">이미지</div>
                    <div class="profile_data">
                        <div class="user_value_box">
                            <div class="user_id">ID : </div>
                            <div class="user_id_value">IDdkfkskda</div>
                            <div class="user_level">LEVEL : </div>
                            <div class="user_level_value">0</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_name value_title">NAME : </div>
                            <div class="user_name_value value_content">가상인</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_birth value_title">BRITH : </div>
                            <div class="user_birth_value value_content1">24.06.13</div>
                            <div class="gender_value  value_content2">Female</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_email value_title">E-MAIL : </div>
                            <div class="user_email_value value_content">asdfsdfsd@admin.com</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_phone value_title">PHONE : </div>
                            <div class="user_phone_value value_content">010-1234-5678</div>
                        </div>
                    </div>
                </div>
                <div class="rpg">
                    <div class="rpg_title">Recently Played Game</div>
                    <div class="rpg_main_box">
                        <div class="rpg_main_img">
                            <div class="rpg_img">게임 타이틀 사진</div>
                        </div>
                        <div class="rpg_main_content">
                            <div class="rpg_content_title rpg_content">타이틀</div>
                            <div class="rpg_content_date rpg_content">날짜</div>
                            <div class="rpg_content_score rpg_content">점수</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="freeboard">
            <div class="free_title board_title">Community Board (자유)</div>
            <div class="free_main board_main">f_main</div>
        </div>
        <div class="tipboard">
            <div class="tip_title board_title">Community Board (공략)</div>
            <div class="tip_main board_main">t_main</div>
        </div>
        <div class="footer">
            <div class="join_date">00.00.00 부터 함께 하는 중</div>  &nbsp; &nbsp; &nbsp;
            <button>회원탈퇴</button>
        </div>
    </div>

</body>
</html>