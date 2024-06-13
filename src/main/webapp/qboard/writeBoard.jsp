<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시판 글 작성하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
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
            height: 750px;
            margin: auto;
        }

        .boardwritername_container{
            padding-left: 100px;
            padding-right: 100px;
            display: flex;
            align-items:center;
            font-size: larger;
        }

        .category_container{
            display: flex;
            justify-content: flex-end;
        }

        .dropdown{
            padding-left: 100px;
            padding-right: 100px;
        }

        .title_container {
            padding-left: 100px;
            padding-right: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .title_detail {
            width: 1000px;
            height: 35px;
        }

        #title_input {
            width: 450px;
            text-align: center;
            border: 2px solid gray;
        }

        #contents_detail {
            position: relative;
            width: 880px;
            height: 500px;
            border: 2px solid gray;
        }

        #contents_detail::before {
            /*비어있을 때*/
            position: absolute;
            content: "내용을 입력하세요.";
            color: gray;
            top: 50%;
            left: 45%;
        }

        #contents_detail:not(:empty)::before {
            /*비어있지 않을 때*/
            display: none;
        }

        .btns_container {
            display: flex;
            padding-left: 50px;
            padding-right: 50px;
            justify-content: right;
            align-items:flex-end;
        }

        #insert_btn {
            background-color: transparent;
        }
    </style>
</head>

<body>
    <div class="container col">
        <div class="boardwritername_container row" style="flex: 1; width: 100%;">
            <div style="flex: 1;">누구님의 글<hr></div>
        </div>
        <div class="category_container col" style="flex: 1; width: 100%;">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  카테고리
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">게임문의</a></li>
                  <li><a class="dropdown-item" href="#">제휴문의</a></li>
                  <li><a class="dropdown-item" href="#">기타문의</a></li>
                </ul>
              </div> 
        </div>
        <div class="title_container" style="flex: 1; width:100%">
            <div class="title_detail">
                <input type="text" name="title" id="title_input" style="margin-right: 5px;" placeholder="제목을 입력하세요.">
                <label for="secret"><input type="checkbox">비밀글</label>
            </div>
        </div>
        <div class="contents_container center" style="flex:6;  width:100%;">
            <div id="contents_detail" contenteditable="true"></div>
        </div>
        <div class="btns_container" style="flex:1;  width:100%;">
            <button button id="insert_btn" onclick="location.href='/qaboard/write.jsp'">작성하기</button>
        </div>
    </div>

</body>

</html>