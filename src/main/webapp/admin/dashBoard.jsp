<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        div {
            /* border: 1px solid black; */
            font-family: 'Noto Sans KR', sans-serif;
        }

        a {
            text-decoration: none;
            color: black;
        }

        /* 현재 사이트를 표시 */
        .active{
            border-bottom : 0;
            background-color: #888;
        }

        .header {
            height : 100px;
            display: flex;
            font-size: 36px;
            align-items: center;
            padding-left : 40px;
            font-weight: bold;
            background-color: #f4f4f4;
            border-bottom : 2px solid gray;
        }

        .main{
            display: flex;
        }

        .main .navi{
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #E2E3E5;
            border-bottom : 2px solid gray;
        }

        .main .navi .profileBox{
            width : 85%;
            height : 350px;
            margin-top : 30px;
            background-color: white;
            border : 1px solid black;
        }
        
        .main .navi .profileBox .profile{
            height : 250px;
            width : 80%;
            margin : 20px auto 0 auto;
            border : 1px solid black;
        }

        .main .navi .profileBox .name{
            text-align: center;
            height : 70px;
            padding-top : 20px;
            font-size: 16px;
            font-weight: bold;
            margin-top : 10px;
        }

        .main .navi .naviBox{
            width : 85%;
            height: 450px;
            margin-top : 30px;
        }

        #dashboard{
            border-bottom: 0;
        }

        .main .navi .naviBox .bigNavi{
            height : 70px;
            border-top: 2px solid gray;
            border-bottom: 2px solid gray;
            display: flex;
            align-items: center;
            font-size: 28px;
            font-weight: bold;
            padding-left: 20px;
        }

        .main .navi .naviBox .smallNavi{
            height : 40px;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: bold;
            padding-left: 20px;
        }

        .main .contentBox{
            flex: 5;
            border : 2px solid gray;
            border-right : 0;
            border-top : 0;
        }

        .main .contentBox .contentTitle{
            height : 150px;
            border-bottom : 2px solid gray;
            font-size: 48px;
            font-weight: bold;
            display: flex;
            align-items: center;
            padding-left : 40px;
            background-color: lightgray;
            color : rgb(59, 59, 59);
        }
        
    </style>
</head>
<body>
    <div class="header">관리자페이지</div>
    <div class="main">
        <div class="navi">
            <div class="profileBox">
                <div class="profile"></div>
                <div class="name">name 관리자님, 환영합니다!</div>
            </div>
            <div class="naviBox">
                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary bigNavi active" id="dashboard">대시보드</a>
                <a class="list-group-item list-group-item-action list-group-item-secondary bigNavi disabled">회원관리</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary smallNavi">회원 목록</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary smallNavi">신고 현황</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary smallNavi">블랙회원 관리</a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary bigNavi">메인사이트 이동</a>
            </div>

        </div>
        <div class="contentBox">
            <div class="contentTitle">대시보드</div>
            <div class="content"><p style="text-align: center; margin-top: 300px">이곳은 컨텐츠가 들어갈 공간입니다.</p></div>
        </div>
    </div>


</body>
</html>