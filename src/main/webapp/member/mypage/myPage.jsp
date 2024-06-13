<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<style>
    body{background-color: black;color:white;}

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
    
    /*div{border:1px solid red;}*/

    .header{flex:0.5; width: 100%;}

    .profilebox{flex:2.5; width: 90%; border:1px solid white; display: flex;}
    .profile{height: 100%;width: 95%;margin: auto; display: flex; justify-content: center; align-items: center} 
    .main_profile{height: 100%;width: 50%;display: flex; justify-content: center; align-items: center}
    .profile_img{width:40%; height: 80%;display: flex;justify-content: center;align-items: center;}
    .profile_data{width:60%; height: 75%;}

    .user_value_box{display: flex; font-size: 17px; height: 42px;}
    .user_id{flex:1.5; display:flex; justify-content: start; text-indent: 5px;}
    .user_id_value{flex:4;align-items: center}
    .user_level{flex:2; display:flex; justify-content: end;}
    .user_level_value{flex:2.5;text-indent: 5px; display:flex; justify-content: start;}

    .value_title{flex:2.5; display:flex; justify-content: start;text-indent: 5px;}
    .value_content{flex:7.5;}
    .value_content1{flex:2.5;}
    .value_content2{flex:5;}
    .value_content3{flex:4.5;}
    .value_content4{flex:3;}
    .gender_value{display: flex;justify-content: start;align-items: center;} 
    .gender_img{width: 40%; height: 90%;margin-bottom:10px;}
     #update_btn{width:90%; height:90%;}
    
    .rpg{background-image:url("/image/rpg_background.png"); background-size:100% 100%;}
    .rpg{height: 90%; width: 50%; display: flex; flex-direction: column; border:1px solid white; justify-content: center; align-items: center;}
    .rpg_title{flex:2; width: 100%; display: flex; align-items: center; font-size: 20px; font-weight: 700; text-indent: 20px;}
    .rpg_main_box{display:flex; width: 100%; flex:8;}
    .rpg_main_img{flex:5.5; display: flex; align-items: center; justify-content: center;}
    .rpg_img{height:90%; width: 90%; border:1px solid white;}
    .rpg_main_content{flex:4.5;display: flex; flex-direction: column;}
    .rpg_content_title{flex:4; font-size: 25px; font-weight: 700; display: flex; justify-content: start; align-items: end;}
    .rpg_content_date{flex:2; font-size: 15px; font-weight: 500; display: flex; justify-content: start; align-items: center; margin-bottom: 8px;}
    .rpg_content_score{flex:4; font-size: 35px; font-weight: 500; display: flex; justify-content: start; align-items: center; margin-bottom: 8px;}

    .freeboard{flex:2.5; width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;}
    .board_title{flex:2; width: 90%; display: flex; justify-content: start; align-items: end; text-indent: 10px; font-size: 20px; font-weight: 700; margin-bottom: 5px;}
    .board_main{flex:8; width: 90%;border:1px solid white;}

    .tipboard{flex:2.5; width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;}

    .footer{flex:0.5; width: 90%; display: flex; justify-content: end; align-items: center;}

    .row{display: flex;}

    .headertitle{width: 100%; display: flex; justify-content: center; align-items: center; font-size:25px;}
    .header_user_id{width: inline; font-weight:600;}

    #basic_img{width: 80%; height: 80%;}
    
    
</style>

</head>
<body>
    <div class="container">
        <div class="header row">
            <div class="headertitle"><div class="header_user_id">${mydata.userId}</div> &nbsp;님의 My page</div>
        </div> 
        <div class="profilebox">
            <div class="profile">
                <div class="main_profile">
                    <div class="profile_img">
                        <img id="basic_img" src="/image/profileBasicImg.jpg">
                    </div>
                    <div class="profile_data">
                        <div class="user_value_box">
                            <div class="user_id">ID : </div>
                            <div class="user_id_value">${mydata.userId}</div>
                            <div class="user_level">LEVEL</div>
                            <div class="user_level_value">${mydata.userLevel}</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_name value_title">NAME : </div>
                            <div class="user_name_value value_content">${mydata.userName} ( ${mydata.userNickname} )</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_birth value_title">BRITH : </div>
                            <div class="user_birth_value value_content1"> ${birth} </div>
                            <div class="gender_value  value_content2">
                            	<c:choose>
                            		<c:when test="${gender.equals('Male')}">
                            			<img class="gender_img" src="/image/male.png">
                            		</c:when>
                            		<c:when test="${gender.equals('Male')}">
                            			<img class="gender_img" src="/image/female.png">
                            		</c:when>
                            		<c:otherwise>
                            			
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_email value_title">E-MAIL : </div>
                            <div class="user_email_value value_content"> ${mydata.userEmail} </div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_phone value_title">PHONE : </div>
                            <div class="user_phone_value value_content3"> ${mydata.userPhone} </div>
                            <div class="user_phone_value value_content4"> 
                            	<button type="button" class="btn btn-dark" id="update_btn">Update</button>
                            </div>
                            
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
                            <div class="rpg_content_title rpg_content">Block Break!</div>
                            <div class="rpg_content_date rpg_content">24.06.13</div>
                            <div class="rpg_content_score rpg_content">123456</div>
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
            <div class="join_date">22.01.01 부터 함께 하는 중</div>  &nbsp; &nbsp; &nbsp;
            <button type="button" class="btn btn-dark" id="signout">회원 탈퇴</button>
        </div>
    </div>
    <script></script>
</body>
</html>