<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://webfontworld.github.io/daegu/DalseoHealing.css">
<script src="/fboard/summernote/summernote-lite.js"></script>
<script src="/fboard/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/fboard/summernote/summernote-lite.css">
 <style>

        body {
            background-color: #121212;
            color: #ffffff;
            font-family : 'DalseoHealing';
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 1000px;
        }
        
        .note-editable {
   			font-family : 'DalseoHealing';
		}
        
        #notAdmin{display:flex; justify-content: center; align-items:center; height:600px;}

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select,
        .form-group button {
            width: 98%;
            padding: 10px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group button:focus {
            outline: none;
            border-color: #6200ee;
        }

        .form-group button {
            background-color: #6200ee;
            border: none;
            cursor: pointer;
            font-size: 13px;

        }

        .form-group button:hover {
            background-color: #3700b3;
        }

        #category{width: 20%;}
        #btn{width: 500px;}
        #btn_boxs{text-indent: 30px; width:100%;justify-content: end;display: flex;}
        #btn_box{display: flex; width:50%;}
        .btns{font-size:10px;}
		.answer{height:500px;}

    </style>
</head>
<body>
<c:choose>
	<c:when test="${isAdmin == true}">	
	 <div class="form-container">
        <h2>즐겨 찾는 질문 작성하기</h2>
        <form action="/insert.fboard" method="post" id="insert" onsubmit="return postData()">
            <div class="form-group">
                <label for="category">카테고리 선택</label>
                <select id="category" name="category" required>
                    <option value="1">게임</option>
                    <option value="2">게시판</option>
                    <option value="3">기타</option>
                </select>
            </div>
            <div class="form-group">
                <label for="question">질문</label>
                <input type="text" id="question" name="question" required>
            </div>
            <div class="group">
                <label for="answer">답변</label>
                <div class="answer" id="summernote"></div>
            	<input type="hidden" id="content" name="answer">
            </div>
            <div class="form-group" id="btn_boxs">
            	<div id="btn_box">
            		<button class="btns" tpye="button" id="go_fboard">즐겨찾는 질문 목록으로</button>
            		<button class="btns" tpye="button" id="go_admin">관리자 페이지로</button>            	
               	 	<button class="btns" type="submit" id="btn">작성 완료</button>
                </div>
            </div>
        </form>
    </div>
    </c:when>
    <c:otherwise>
    	<div class="form-container" id="notAdmin">잘못된 접근 입니다.</div>
    </c:otherwise>
</c:choose>
</body>
<script>

function postData(){
	
	$("#content").val($("#summernote").summernote("code"));
	
	let arr = $("input[name=content]");
	
	$(arr[1]).remove();
	return true;
}
	
$(document).ready(function(){
	
	$('#summernote').summernote({
	height: '500px', // 에디터 높이
	disableResizeEditor: true, // 에디터 사이즈 조절 옵션 끄기
	focus: true, // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR", // 한글 설정
	toolbar: [ // 툴바 설정
	['fontname', ['fontname']],
	['fontsize', ['fontsize']],
	['color', ['color']],
	['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	['para', ['ul', 'ol', 'paragraph']],
	['height', ['height']]
	],
	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','32','36','48','60']
	});
		$('#summernote').summernote('fontName', 'DalseoHealing'); // 기본 폰트명 설정
	 	$('#summernote').summernote('fontSize', '12'); // 기본 폰트 사이즈 설정
	 	$('#summernote').summernote('fontSizeUnit', 'pt'); // 기본 폰트 사이즈 단위 설정
	 	$('#summernote').summernote('foreColor', 'white');
	 	
	});


	$("#go_fboard").on("click",function(){
		location.href="/list.fboard";
	});
	$("#go_admin").on("click",function(){
		location.href="/dashBoard.admin";
	});
	
	
	
	
</script>
</html>