<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile IMG Update</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <style>
        *{box-sizing: border-box;}
        /* div{border: 1px solid black;} */
        .container{height: 300px; width: 200px; margin:auto; display: flex; flex-direction: column; justify-content: space-evenly; align-items: center;}
        .img{height: 170px;width: 85%; border: 1px solid black;display: flex;justify-content: center;align-items: center;}
        .img img{width: 100%;height: 100%;}
        #previewImg{width: 100%;height: 100%;}
        .input{width: 100%;}
        .btns{display: flex; justify-content: space-evenly; text-indent: 10px; width: 100%;}
        /* .empty_box{flex:6;}
        #cancle{flex:2;}
        #complete{flex:2;} */
    </style>
</head>
<body>
<form action="/upload.userprofileimg"  method="post" enctype="multipart/form-data">
    <div class="container">
        <div class="img">
            <img id="previewImg" src="/upload/default.png" alt="이미지 미리보기">
        </div>
        <div class="input">
            <input type="file" id="uploadFile" name="uploadFile">
        </div>
        <div class="btns">
            <button id="cancle" type="button"> 취소 </button>
            <button id="complete" type="btoon"> 완료 </button>
        </div>
    </div>
</form>
    
    <script>
    $("#cancle").on("click",function(){
		alert("취소 버튼 확인");
		
	})
	
	$("#complete").on("click",function(){
		
		$("#uploadForm").submit();

		 if (window.opener && window.opener.parent) {
		        window.opener.parent.location.reload();
		        }
	})
	
	 $("#uploadFile").change(function() {
            previewImage(this);
        });
    
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#previewImg').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]); // 파일을 읽어 data URL 형식으로 변환
        }
    }
	
    </script>
	

</body>
</html>