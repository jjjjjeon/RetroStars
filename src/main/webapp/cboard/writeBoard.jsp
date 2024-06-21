<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="cboard/summernote/summernote-lite.js"></script>
<script src="cboard/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="cboard/summernote/summernote-lite.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>글 작성 페이지</title>
<style>
* {
	box-sizing: border-box;
	margin: 0
}

.note-editor.note-frame {
	border: 0;
}

.dropdown-toggle::after {
	display: none;
}

input[type="text" i] {
	padding-block: 1px;
	padding-inline: 2px;
}

body {
	background-color: #222;
}

div {
	/* border: 1px solid black; */
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	text-decoration: none;
	color: #d3d3d3;
}

input[type="text" i] {
	padding-block: 1px;
	padding-inline: 2px;
}

.header {
	height: 220px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: url('/image/background.png');
	background-size: cover;
}

.header .headerTitle {
	height: 150px;
	color: #ffffff;
	font-size: 32px;
	font-weight: bold;
	display: flex;
	align-items: center;
}

.header #headerTitle {
	margin-top: 70px;
}

.navi {
	position: relative;
	width: 100%;
	height: 80px;
	background: #111;
	border: 1px solid #5a5a64;
	border-left: 0;
	border-right: 0;
	text-align: center;
	font-size: 0;
}

.navi a {
	display: inline-block;
	margin: 0 25px;
	color: #898c92;
	font-size: 24px;
	line-height: 77px;
}

.navi #naviAnker {
	color: white;
	border-bottom: 2px solid white;
}

.writeBoard {
	position: relative;
	margin: 63px auto 0 auto;
	width: 1300px;
	min-height: 500px;
}

.writeBoard h3 {
	color: white;
	font-size: 26px;
	line-height: 34px;
	font-weight: 300;
	padding-bottom: 20px;
	padding-left: 10px;
}

.writeBoard .category {
	position: relative;
	padding-left: 9px;
	border-top: 1px solid #d3d3d3;
	height: 70px;
	display: flex;
	align-items: center;
	color: #d3d3d3;
}

.writeBoard .title {
	border-top: 1px solid #eeedf2;
}

.writeBoard .title input {
	width: 100%;
	height: 70px;
	line-height: 70px;
	border: none;
	font-size: 16px;
	color: #d3d3d3;
	text-indent: 20px;
	background-color: #222;
}

.writeBoard .fileBox {
	height: auto;
	width: 100%;
	border-top: 1px solid #eeedf2;
	display: flex;
	flex-direction: column;
	padding: 10px 0;
}

.writeBoard .fileBox .uploadCol {
	display: flex;
	align-items: center;
	padding: 1px;
	flex: 1;
}

.writeBoard .fileBox .uploadCol input {
	margin-right: 10px;
	background-color: #333;
	color: #d3d3d3;
}

.writeBoard .fileBox .uploadCol button {
	width: 37px;
}

.writeBoard .fileBox .uploadCol #removeFileBtn {
	display: none;
	margin-right: 5px;
}

.note-editable {
	height: 500px;
	color: white;
}

.btnBox {
	margin-top: 30px;
	display: flex;
	justify-content: center;
}

.btnBox #writeNoBtn {
	width: 160px;
	height: 45px;
	background: gray;
	color: #fff;
	border: 1px solid #888;;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
}

.btnBox #writeYesBtn {
	width: 160px;
	height: 45px;
	background: #3392ff;
	color: white;
	border: 1px solid #white;
	font-size: 13px;
	font-weight: bold;
}

.navbar {
	position:fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
	height: 70px;
	background-color: #323232;
}

.navbar-brand {
	color: white;
}

.nav-link {
	color: white !important;
}

.nav-link:hover {
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 10px;
}

.btn {
	color: white;
}

.btn:hover {
	color: white;
}

.dropdown-menu {
	background-color: #323232;
}

.dropdown-item {
	background-color: #323232;
	color: white;
}

.footer {
	height: 150px;
	margin-top: 160px;
	border-top: 1px solid #e0e2ec;
	background-color: #323232;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	bottom: 0;
}

.leftfooter {
	color: white;
	font-weight: bold;
	margin-top: 20px;
}

.rightfooter {
	display: flex;
	align-items: center;
}

.footerbox {
	width: 1000px;
	height: 100%;
	margin: auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.iconbox {
	display: flex;
	align-items: center;
}

.iconbox a {
	margin: 0 10px;
	font-size: 50px;
	color: white;
}

.coinbox {
	display: flex;
	align-items: center;
	margin-left: 20px;
}

.coinbox img {
	width: 120px;
	height: 100px;
	margin-left: 20px;
}

.note-placeholder {
	font-size: 16px;
	position: absolute;
	padding: 55px 0 0 15px;
}

.editorBox {
	border: 1px solid #d3d3d3;
}
</style>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand" href="/index.jsp">홈으로</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown"
					aria-controls="navbarNavDarkDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<button class="btn dropdown-toggle" data-bs-toggle="dropdown"
								aria-expanded="false">게임</button>

							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">game1</a></li>
								<li><a class="dropdown-item" href="#">game2</a></li>
								<li><a class="dropdown-item" href="#">game3</a></li>
								<li><a class="dropdown-item" href="#">game4</a></li>
								<li><a class="dropdown-item" href="#">game5</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<button class="btn dropdown-toggle" data-bs-toggle="dropdown"
								aria-expanded="false">게시판</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/list.cboard">커뮤니티게시판</a></li>
								<li><a class="dropdown-item" href="/list.cboard">자유게시판</a></li>
								<li><a class="dropdown-item" href="/list.cboard">공략게시판</a></li>
								<li><a class="dropdown-item" href="/list.qboard">QA게시판</a></li>
								<li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
								<li><a class="dropdown-item" href="/list.nboard">공지게시판</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link">랭킹</a></li>


					</ul>
					<c:choose>
						<c:when test="${not empty loginId}">
							<ul class="navbar-nav ms-auto">

								<c:if test="${isAdmin eq true}">
									<li class="nav-item"><a class="nav-link"
										href="/dashBoard.admin" target="_blank">관리자페이지</a></li>
								</c:if>

								<li class="nav-item"><a class="nav-link"
									href="/mypage.member"> <img
										src="/profile/${userProfileUrl}" class="rounded-circle"
										width="40" height="40" alt="Profile">
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/mypage.member">마이페이지</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/logout.member">로그아웃</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="navbar-nav ms-auto">
								<li class="nav-item"><a class="nav-link"
									href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</nav>
		<div class="headerTitle">
			<p id="headerTitle">커뮤니티</p>
		</div>
	</div>
	<div class="navi">
		<a href="/list.cboard?category=0" data-category="category_0"
			id="naviAnker">전체</a> <a href="/list.cboard?category=1"
			data-category="category_1">자유</a> <a href="/list.cboard?category=2"
			data-category="category_2">공략</a>
	</div>
	<form action="/write.cboard" method="post" id="writeForm"
		enctype="multipart/form-data">
		<div class="writeBoard" id="writeBoard">
			<h3>${nickname}님의글</h3>
			<div class="category">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="category"
						id="category1" value="option1"> <label
						class="form-check-label" for="inlineRadio1">자유</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="category"
						id="category2" value="option2"> <label
						class="form-check-label" for="inlineRadio2">공략</label>
				</div>
			</div>
			<div class="title">
				<input type="text" placeholder="제목을 입력해 주세요" name="title"
					id="titleInput" maxlength="100">
			</div>
			<div class="fileBox">
				<div class="col-12 uploadCol">
					<input class="form-control" type="file" id="formFileMultiple"
						name="file">
					<button class="btn btn-secondary" id="removeFileBtn" type="button">C</button>
					<button class="btn btn-light" id="addFileTab" type="button">+</button>
				</div>
			</div>
			<div class="editorBox">
				<div id="summernote"></div>
			</div>
			<div class="btnBox">
				<button type="button" id="writeNoBtn">취소</button>
				<button id="writeYesBtn">등록</button>
			</div>
		</div>
		<input type="hidden" name="content" id="contentInput"> <input
			type="hidden" name="userId" id="userIdInput">
	</form>
	<div class="footer">
		<div class="footerbox">
			<div class="leftfooter">
				<p>회사명: 팀별빛</p>
				<p>전화: 02-1234-5678</p>
				<p>이메일: info@example.com</p>
			</div>
			<div class="rightfooter">
				<div class="iconbox">
					<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a> <a href="#"><i
						class="fab fa-youtube"></i></a>
				</div>
				<div class="coinbox">
					<img src="/image/coin.png" alt="">
				</div>
			</div>
		</div>
	</div>


	<script>
    	$("#writeNoBtn").on("click", function(){
			let isCancel = confirm("작성중인 글은 사라집니다. 계속하시겠습니까?");
			
			if(isCancel){
				location.href = "/list.cboard";
			}
    	});
    
	    $(document).ready(function(){
	    	var elem = $('#summernote').summernote({
	    	placeholder : `1. 비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. <br>
	            2. 타인의 개인정보가 포함된 게시물을 올릴 경우, 개인 정보 보호법 제 59조 3호에 의해 5년 이하의 징역 또는 <br>
	              &nbsp;&nbsp; 5천만원 이하의 벌금이 부과될 수 있으니 유의하여 주시기 바랍니다. <br>
	            3. 모든 분들이 게시물을 불편없이 이용할 수 있도록 게시물에 대한 설명을 문자로 기재해 주시기 바랍니다. <br>
	            4. 최대 3000자까지 작성 가능합니다.`,
	    	height : '500px', // 에디터 높이
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
	    	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','32','36','48','60'],
	    	callbacks: {
                onKeydown: function (e) { 
                    let t = e.currentTarget.innerText;
                    
                    if(t.length > -1){
                    	$(".note-placeholder").css("display", "none");
                    }
                    
                    if (t.trim().length >= 3000) {
                        //delete keys, arrow keys, copy, cut, select all
                        if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey) && !(e.keyCode == 65 && e.ctrlKey))
                        e.preventDefault(); 
                    } 
                },
                onKeyup: function (e) {
                	let t = e.currentTarget.innerText;
                    $('#maxContentPost').text(3000 - t.trim().length);
                },
                onPaste: function (e) {
                    let t = e.currentTarget.innerText;
                    let bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                    e.preventDefault();
                    let maxPaste = bufferText.length;
                    if(t.length + bufferText.length > 3000){
                        maxPaste = 3000 - t.length;
                    }
                    if(maxPaste > 0){
                        document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
                    }
                    $('#maxContentPost').text(3000 - t.length);
                },
                onInit: function () {
                    var editor = elem.next(),
                    placeholder = editor.find(".note-placeholder");

                    function isEditorEmpty() {
                        var code = elem.summernote("code");
                        return code === "<p><br></p>" || code === "";
                    }

                    editor.on("focusin focusout", ".note-editable", function (e) {
                        if (isEditorEmpty()) {
                            placeholder[e.type === "focusout" ? "show" : "hide"]();
                        }
                    });
                }
                
            }
	    	
		    });
	    	$('#summernote').summernote('foreColor', 'white');
	    	$('#summernote').summernote('code', '');
	    	$('.note-editable').html('');
	    	$('#summernote').summernote('fontSize', '16');
	        $('#summernote').summernote('fontSizeUnit', 'pt');
	    });
	    
        $("#formFileMultiple").on("input", function () {
            $("#removeFileBtn").css("display", "block");
        });

        $("#removeFileBtn").on("click", function () {
            $("#formFileMultiple").val("");
            $("#removeFileBtn").css("display", "none");
        });

        let count = 1;
        $("#addFileTab").on("click", function () {
            if (count > 4) {
                return;
            }

            let uploadCol = $("<div>");
            uploadCol.attr("class", "uploadCol");

            let uploadInput = $("<input>");
            uploadInput.attr("class", "form-control");
            uploadInput.attr("type", "file");
            uploadInput.attr("name", "file" + count);
            uploadCol.append(uploadInput);

            let uploadDelButton = $("<button>");
            uploadDelButton.html("-");
            uploadDelButton.attr("class", "btn btn-secondary delUploadRow");
            uploadDelButton.attr("type", "button");
            uploadCol.append(uploadDelButton);

            $(".fileBox").append(uploadCol);
            count = count + 1;
        });

        $(".fileBox").on("click", ".delUploadRow", function () {
            $(this).closest(".uploadCol").remove();
            count = count - 1;
        });
        
        $("#writeForm").on("submit", function(e) {
        	if ( !$('input:radio[name=category]').is(':checked') ){
        		alert("카테고리를 선택해주세요!");
				e.preventDefault();
        	}else if ($("#titleInput").val() == "") {
				alert("제목을 입력해주세요!");
				console.log($('#category1').prop('disabled'));
        		console.log($('#category2').prop('disabled'));
				e.preventDefault();
﻿			} else {
				$("#contentInput").val($('#summernote').summernote('code'));
				$("#userIdInput").val("${loginId}");
			}
		});
        
        $(".navi a").on("click", function(e){
			let isCancelWrite = confirm("작성중인 글은 사라집니다. 계속하시겠습니까?");
			
			if(!isCancelWrite){
				e.preventDefault();
			}
			
		});
        
    </script>
</body>
</html>