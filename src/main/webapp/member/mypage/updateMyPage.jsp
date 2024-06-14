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

        /*div{border: 1px solid red;}*/

        .container{height: 550px; width: 800px; margin:auto;display: flex;flex-direction: column;}
        .row{flex:1; display: flex; /*background-color: rgba(50, 49, 49, 0.9)*/}
        .col{flex:1; display: flex; justify-content: center; align-items: center;}
            
        .col1{background-color: rgba(24, 6, 79, 0.9); }
        .col2{background-color: rgba(82, 11, 117, 0.8); }

        .col_attr{ width: 80%; height: 80%; font-size: 35px;display: flex; justify-content: center; align-items: center; text-align: center; border-radius: 20px;}

        .col_attr:hover{cursor: pointer; transform: scale(1.1);}

        .col1:hover{ background-color:rgba(24, 6, 79, 1);}

        .col2:hover{background-color: rgba(82, 11, 117, 1);}

    </style>
</head>
<body>
 <div class="container">
    <div class="row">
        <div class="col">
            <div class="mydata_chage col1 col_attr"> My Data <br>수정</div>
        </div>
        <div class="col">
            <div class="password_chage col2 col_attr">Password <br>수정</div>
        </div>
    </div>
 </div>

</body>
</html>