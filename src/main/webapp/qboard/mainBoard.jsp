<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&Apage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5af4c0ec93.js" crossorigin="anonymous"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        /*div {
            border: 1px solid black;
        }*/

        .row {
            display: flex;
        }

        .col {
            display: flex;
            flex-direction: column;
        }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 1100px;
            height: 900px;
            margin: auto;
        }

        .col1 {
            flex: 1;
        }

        .col2 {
            flex: 9;
        }

        .navi_container {
            padding-right: 250px;
            padding-left: 250px;
        }

        .navi_container>div {
            flex: 1;
        }

        .navi_container>div:hover {
            border-bottom: 2px solid black;
        }

        .navi_container a {
            text-decoration: none;
            color: black;
        }

        .search_container {
            padding-right: 50px;
            padding-left: 50px;
        }

        .search_col2 {
            display: flex;
            align-items: flex-end;
            justify-content: right;
        }

        #category1_select{
        	height:23px;       	
        }
        
        #category2_select{
        	height:23px;
        }

        .search_bar {
            padding-bottom: 2px;
            display: flex;
            align-items: flex-end;
            width: 190px;
            height: 30px;
            border-bottom: 2px solid black;
        }

        .search_bar>#search_input {
            width: 170px;
            text-align: center;
            border: none;
        }

        .list_container {
            padding-top: 20px;
            padding-left: 50px;
            padding-right: 50px;
        }

        .list_head {
            border-top: 3px solid black;
            border-bottom: 3px solid black;
        }

        .list_data {
            border-bottom: 1px solid lightgray;
        }

        .btns_container{
            display: flex;
            padding-left: 50px;
            padding-right: 50px;
            justify-content: right;
            align-items: center;
        }

        #ask_btn{
            background-color: transparent;
        }

    </style>
</head>
<body>
    <div class="container col">
        <div class="col1 center">Q&Apage</div>
        <div class="col2 col">
            <div class="navi_container row" style="flex: 0.7;">
                <div class="navi_total center"><a href="">전체</a></div>
                <div class="navi_game center"><a href="">게임문의</a></div>
                <div class="navi_collaboration center"><a href="">제휴문의</a></div>
                <div class="navi_etc center"><a href="">기타문의</a></div>
            </div>
            <div class="search_container row" style="flex: 1.0;">
                <div class="col1" style="flex: 1;"></div>
                <div class="search_col2" style="flex: 1;">
                    <select id="#category1_select" style="margin-right: 5px;">
                        <option value="분류" selected disabled hidden>분류</option>
                        <option value="제목">제목</option>
                        <option value="내용">내용</option>
                    </select>
                    <select id="#category2_select" style="margin-right: 5px;">
                        <option value="카테고리" selected disabled hidden>카테고리</option>
                        <option value="전체">전체</option>
                        <option value="게임문의">게임문의</option>
                        <option value="게임문의">제휴문의</option>
                        <option value="게임문의">기타문의</option>
                    </select>
                    <div class="search_bar center">
                        <input id="search_input" type="text" placeholder="검색어를 입력하세요.">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                </div>
            </div>
            <div class="list_container col" style="flex: 6.9;">
                <div class="list_head row" style="height: 45px;">
                    <div class="list_head_seq center" style="flex: 1;">번호</div>
                    <div class="list_head_category center" style="flex: 1;">카테고리</div>
                    <div class="list_head_writer center" style="flex: 1;">작성자</div>
                    <div class="list_head_title center" style="flex: 4.5;">제목</div>
                    <div class="list_head_write_date center" style="flex: 1.5;">작성일</div>
                    <div class="list_head_answer center" style="flex: 1;">답변</div>
                </div>
                <!--얘포함 12개로 넣자-->
                <div class="list_data row" style="height: 40px;"> 
                    <div class="list_head_seq center" style="flex: 1;">1</div>
                    <div class="list_head_category center" style="flex: 1;">기타문의</div>
                    <div class="list_head_writer center" style="flex: 1;">sami3013</div>
                    <div class="list_head_title center" style="flex: 4.5;">이건 예시데이터 입니다.</div>
                    <div class="list_head_write_date center" style="flex: 1.5;">2024.06.09</div>
                    <div class="list_head_answer center" style="flex: 1;">답변완료</div>
                </div>
                
            </div>
            <div class="btns_container" style="flex: 0.7;">
                <button id="ask_btn" onclick="location.href='/qaboard/write.jsp'">문의하기</button>
            </div>
            <div class="page_container" style="flex: 0.7;"></div>
        </div>
    </div>

</body>
</html>