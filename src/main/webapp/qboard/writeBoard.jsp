<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

        .title_container {
            padding-left: 100px;
            padding-right: 100px;
            display: flex;
            align-items: flex-end;
            justify-content: center;
        }

        .title_detail {
            width: 1000px;
            height: 35px;
            display: flex;
            justify-content: center;
        }

        #title_input {
            width: 450px;
            text-align: center;
            border: 2px solid gray;
        }

        #contents_detail {
            position: relative;
            width: 900px;
            height: 500px;
            border: 2px solid gray;
        }

        #contents_detail::before { /*비어있을 때*/
            position: absolute;
            content: "내용을 입력하세요.";
            color: gray;
            top: 50%;
            left: 45%;
        }

        #contents_detail:not(:empty)::before {/*비어있지 않을 때*/
            display: none;
        }

        .btns_container{
            display: flex;
            padding-left: 50px;
            padding-right: 50px;
            justify-content: right;
            align-items: center;
        }

        #insert_btn{
            background-color: transparent;
        }

    </style>
</head>
<body>
    <div class="container col">
        <div class="title_container" style="flex: 1;">
            <div class="title_detail">
                <select id="#category2_select" style="margin-right: 5px;">
                    <option value="카테고리" selected disabled hidden>카테고리</option>
                    <option value="게임문의">게임문의</option>
                    <option value="게임문의">제휴문의</option>
                    <option value="게임문의">기타문의</option>
                </select>
                <input type="text" name="title" id="title_input" style="margin-right: 5px;" placeholder="제목을 입력하세요.">
                <label for="secret" style="display: flex; align-items: center;"><input type="checkbox">비밀글</label>
            </div>
        </div>
        <div class="contents_container center" style="flex:8;">
            <div id="contents_detail" contenteditable="true"></div>
        </div>
        <div class="btns_container" style="flex:1;">
            <button button id="insert_btn" onclick="location.href='/qaboard/write.jsp'">작성하기</button>
        </div>
    </div>

</body>
</html>