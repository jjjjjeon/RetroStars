<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="/cboard/summernote/summernote-lite.js"></script>
<script src="/cboard/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/cboard/summernote/summernote-lite.css">
<title>게시판 글 보기</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
}

.dropdown-toggle::after { display: none; }

div {
	font-family: 'Noto Sans KR', sans-serif;
}

ul {
	list-style-type: none;
}

a {
	text-decoration: none;
	color: black;
}

.header {
	height: 62px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.navi {
	position: relative;
	width: 100%;
	height: 80px;
	background: #f8f9fb;
	border: 1px solid #e0e2ec;
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

.navi .active {
	color: #36393f;
	border-bottom: 2px solid #36393f;
}

.content {
	position: relative;
	margin: 63px auto 0 auto;
	width: 1300px;
	min-height: 500px;
}

.content h3 {
	color: #151518;
	font-size: 26px;
	line-height: 34px;
	font-weight: 300;
}

.content .titleBox {
	padding-left: 50px;
	height: 139px;
	min-height : 139px;
	border: 1px solid #eeedf2;
	font-size: 22px;
	display: flex;
	align-items: center;
	margin-top: 20px;
}

#originTitle{
	margin-top : 20px;
}

#titleInput{
	height: 139px;
	width:1300px;
	min-height : 139px;
	border: 1px solid #eeedf2;
	font-size: 22px;
	display: flex;
	align-items: center;
	margin-top: 20px;
	text-indent : 20px;
}

.content .infoBox {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0 50px 0 30px;
	height: 59px;
	color: #6a6e76;
	font-weight: 500;
	border: 1px solid #eeedf2;
	border-top: 0;
}

.content .infoBox .name {
	padding-left: 20px;
	font-weight: 500;
}

#info2 {
	margin-left: auto;
}

.view {
	margin-left: 60px;
	padding-left: 24px;
}

.content .fileBox {
	color: #36393f;
	display: none;
	flex-direction: column;
}

.content .fileBox a {
	color: blue;
	margin-bottom: 5px;
}

.bookmark {
	margin-left: 60px;
	padding-left: 21px;
}

.content .viewCont {
	padding: 45px 0 150px 0;
	color: #36393f;
	font-size: 18px;
	line-height: 30px;
	font-weight: 400;
}

.content .viewCont #bookmarkBtn {
	display: block;
	margin: 115px auto 0 auto;
	width: 200px;
	height: 60px;
	background-color: #f8f9fb;
	border: 1px solid #e0e2ec;
	border-radius: 30px;
	text-align: center;
	font-size: 16px;
	font-weight: 500;
	line-height: 56px;
	cursor: pointer;
}

.btnBox .leftBox {
	float: left;
}

.btnBox .rightBox {
	float: right;
}

#reportBtn {
	width: 100px;
	height: 45px;
	background: rgb(243, 66, 66);
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
}

#delBtn {
	width: 120px;
	height: 45px;
	background: gray;
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
}

#corBtn {
	width: 120px;
	height: 45px;
	background: gray;
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
}

#goListBtn {
	width: 120px;
	height: 45px;
	background: black;
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
}

#writeBtn {
	width: 120px;
	height: 45px;
	background: #3392ff;
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
}

#corYesBtn {
	width: 120px;
	height: 45px;
	background: #3392ff;
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
	display: none;
}

#corNoBtn {
	width: 120px;
	height: 45px;
	background: gray;
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
	display: none;
}

.commentBox {
	position: relative;
	margin: 90px auto 0 auto;
	width: 1300px;
}

.commentBox .commentTitle {
	height: 36px;
	position: relative;
	margin-bottom: 20px;
	width: 1300px;
	color: #6a6e76;
	font-size: 18px;
	font-weight: 400;
	line-height: 36px;
}

.commentBox .commentList .cmtGroup {
	padding: 35px 0 35px 30px;
	border-top: 1px solid #eeedf2;
	border-bottom: 1px solid #eeedf2;
}

.comment {
	position: relative;
	width: 1300px;
}

.cmtUser {
	font-weight: bold;
}

.cmtCtt {
	padding-top: 20px;
}

.cmtDate {
	margin-top: 30px;
	padding-bottom: 10px;
	color: #6a6e76;
}

.cmtDate .cmtBtnBox {
	float: right;
	padding-right: 50px;
}

.writeCmtBox {
	height: 200px;
	border: 1px solid rgb(236, 233, 233);
	margin-top: 20px;
	background: #f8f9fb;
}

.writeCmtWriter {
	height: 50px;
	padding: 25px 0 0 25px;
	font-weight: bold;
}

.writeCmtCttRow {
	height: 150px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.writeCmtCtt {
	font-size: 15px;
	text-indent: 10px;
	padding-top: 10px;
	width: 1150px;
	height: 120px;
	resize: none;
	margin-bottom: 10px;
}

.writeCmtBtn {
	width: 100px;
	height: 120px;
	margin-left: 5px;
	margin-bottom: 10px;
}

.footer {
	height: 300px;
	margin-top: 160px;
	padding-top: 50px;
	border-top: 1px solid #e0e2ec;
	display: flex;
	justify-content: center;
	align-items: center;
}

#summernote{
	display : none;
}

.reReplyWriteBox{
	display : none;
}

.delRepleBtn{
	color : black;
    font-weight: bold;
    margin-left : 15px;
    cursor:pointer;
}
</style>
<body>
	<form action="/correction.cboard" method="post" id="changeForm">
		<div class="header">Header</div>
		<div class="navi">
			<a href="/list.cboard?category=0" id="viewAll">전체</a> <a
				href="/list.cboard?category=1" id="viewC1">자유</a> <a
				href="/list.cboard?category=2" id="viewC2">공략</a>
		</div>
		<div class="content">
			<h3 id="boardTitleH3">전체</h3>
			<div class="titleBox">
				<p id="originTitle">${DTO.cBoardTitle}<p>
				<input type="hidden" id="titleInput" name="title">
			</div>
			<ul class="infoBox">
				<li><span class="name">${DTO.userId}</span></li>
				<li id=info2><span class="date"> <fmt:formatDate
							value="${DTO.cBoarDate}" pattern="MM.dd" />
				</span> <span class="view"> <i class="fa-regular fa-eye"
						style="color: #36393f;"></i> ${DTO.cBoardView}
				</span> <span class="bookmark"> <i class="fa-regular fa-bookmark"
						style="color: #36393f;"></i> ${DTO.cBoardReport}
				</span></li>
			</ul>
			<c:choose>
				<c:when test="${fn:length(fileList) > 0}">
					<p class="fileOn" style="cursor: pointer;">
						▼ 첨부파일 목록 열기 <span style="color: blue;">(${fn:length(fileList)})</span>
					</p>
				</c:when>
	
			</c:choose>
			<div class="fileBox">
				<c:forEach var="files" items="${fileList}" varStatus="status">
					<a
						href="/download.cfile?oriname=${files.cFileOriname}&sysname=${files.cFileSysname}">${status.index + 1}.
						${files.cFileSysname}</a>
				</c:forEach>
			</div>
			<div class="viewCont">
				${DTO.cBoardContent} <a id="bookmarkBtn" style="clear: both;"> <i
					class="fa-regular fa-bookmark" style="color: #000000;"></i> 북마크
				</a>
			</div>
			<div id="summernote"></div>
			<div class="btnBox">
				<div class="leftBox">
					<button type="button" id="reportBtn">신고하기</button>
				</div>
				<div class="rightBox">
					<button type="button" id="goListBtn">목록</button>
					<button type="button" id="delBtn" data-seq="${DTO.cBoardSeq}">삭제</button>
					<button type="button" id="corBtn">수정</button>
					<button type="button" id="writeBtn">글쓰기</button>
					<button type="button" id="corYesBtn">수정완료</button>
					<button type="button" id="corNoBtn">수정취소</button>
				</div>
				<div class="rightBtnBox"></div>
			</div>
		</div>
		<input type="hidden" id="categoryInput" name="category">
		<input type="hidden" id="cpageInput" name="cpage">
		<input type="hidden" id="seqInput" name="seq">
		<input type="hidden" id="contentInput" name="content">
	</form>
	<div class="commentBox">
		<div class="commentTitle">댓글 (0)</div>
		<div class="commentList">
		</div>
		<div class="writeCmtBox">
				<div class="writeCmtWriter">SessionId</div>
				<div class="writeCmtCttRow">
					<textarea
						placeholder="비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. (글자수 최대 1000자)"
						class="writeCmtCtt" maxlength="1000" id="repleContent"></textarea>
					<button type="button" class="btn btn-dark writeCmtBtn" id="writeCmtBtn">등록</button>
				</div>
		</div>
	</div>
	<div class="footer">Footer</div>

	<script>
    	$("#writeBtn").on("click", function(){
    		location.href = "cboard/writeBoard.jsp";
    	})
    
	    $(document).ready(function(){
			if (${category == 1}){
				$("#viewC1").addClass("active");
				$("#boardTitleH3").html("자유");
			}else if(${category == 2}){
				$("#viewC2").addClass("active");
				$("#boardTitleH3").html("공략");
			}else{
				$("#viewAll").addClass("active");
				$("#boardTitleH3").html("전체");
			}
		});
    
    	$(".content").on("click", ".fileOn", function(){
    		$(this).html("▲ 첨부파일 목록 닫기");
    		$(this).attr("class", "fileOff");
    		$(".fileBox").css("display", "flex");
    	})
    	
    	$(".content").on("click", ".fileOff", function(){
    		$(this).html("▼ 첨부파일 목록 열기 (${fn:length(fileList)})");
    		$(this).attr("class", "fileOn");
    		$(".fileBox").css("display", "none");
    	})
    	
    	$("#goListBtn").on("click", function(){
    		location.href = "/list.cboard?category=${category}&cpage=${cpage}";
    	});
    	
    	$("#delBtn").on("click", function(){
    		let isDel = confirm("이 글을 정말 삭제하시겠습니까?");
    		
    		if(isDel){
    			location.href = "/delete.cboard?category=${category}&cpage=${cpage}&seq=${DTO.cBoardSeq}";
			}
    	});
    	
    	$("#corBtn").on("click", function(){
    		$(".fileOn").css("display", "none");
    		$("#goListBtn").css("display", "none");
    		$("#delBtn").css("display", "none");
    		$("#corBtn").css("display", "none");
    		$("#writeBtn").css("display", "none");
    		$("#corYesBtn").css("display", "block");
    		$("#corYesBtn").css("float", "right");
    		$("#corNoBtn").css("display", "block");
    		$("#corNoBtn").css("float", "right");
    		$(".infoBox").remove();
    		
    		$("#titleInput").val($("#originTitle").text());
    		$(".titleBox").css("padding-left", "0");
    		$("#titleInput").attr("type", "text");
    		
    		$('#summernote').summernote({
				  height : '500px',   // 에디터 높이
				  disableResizeEditor: true,    // 에디터 사이즈 조절 옵션 끄기
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",				// 한글 설정
				  toolbar: [					// 툴바 설정
						    ['fontname', ['fontname']],
						    ['fontsize', ['fontsize']],
						    ['color', ['color']],
						    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
						    ['para', ['ul', 'ol', 'paragraph']],
						    ['height', ['height']]
						  ],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
					callbacks: {
				          onKeydown: function(e) {
				            let textLength = $('#summernote').next('.note-editor').find('.note-editable').text().length;
				            if (textLength >= maxLength && e.keyCode !== 8 && e.keyCode !== 46) {
				              e.preventDefault();
				            }
				          },
				          onKeyup: function() {
				            updateCharCount();
				          },
				          onPaste: function(e) {
				            let clipboardData = e.originalEvent.clipboardData || window.clipboardData;
				            let pastedData = clipboardData.getData('Text');
				            let textLength = $('#summernote').next('.note-editor').find('.note-editable').text().length;
				            if (textLength + pastedData.length > maxLength) {
				              e.preventDefault();
				              let allowedData = pastedData.substring(0, maxLength - textLength);
				              document.execCommand('insertText', false, allowedData);
				            }
				            setTimeout(updateCharCount, 100); // 붙여넣기 후 글자 수 업데이트
				          }
				        }
				      });
    		$("#originTitle").remove();
			$('#summernote').summernote('code', `${DTO.cBoardContent}`);
			
			$('.viewCont').remove();
			$(".btnBox").css("margin-top", "15px");
			$("#titleInput").focus();
    	});
    	
    	$("#corNoBtn").on("click", function(){
			let isCancelCorrection = confirm("수정중인 글은 사라집니다. 계속하시겠습니까?");
			
			if(isCancelCorrection){
				location.href = "/detail.cboard?category=${category}&cpage=${cpage}&seq=${DTO.cBoardSeq}";
			}
    	});
    	
    	$("#corYesBtn").on("click", function(e){
    		if($(".titleBox").html() == ""){
    			alert("제목을 입력해주세요!");
    			e.preventDefault();
    		}else{
    			$("#categoryInput").val(${category});
    			$("#cpageInput").val(${cpage});
    			$("#seqInput").val(${DTO.cBoardSeq});
    			$("#contentInput").val($('#summernote').summernote('code'));
    			$("#changeForm").submit();
    		}
    		
    	});
    	
    	function getRepleList(){
			$.ajax({
				url : "/viewReple.reply",
				dataType:"json",
				traditional : true,
				data : {
				seq : $("#delBtn").attr("data-seq")
				}
			}).done(function(resp){
				if(resp.length != 0){
					function formatDate(timestamp) {
		                let date = new Date(timestamp);
		                let year = date.getFullYear().toString().slice(2);
		                let month = ('0' + (date.getMonth() + 1)).slice(-2);
		                let day = ('0' + date.getDate()).slice(-2);
		                let hours = ('0' + date.getHours()).slice(-2);
		                let minutes = ('0' + date.getMinutes()).slice(-2);
		                return year + "." + month + "." + day + " " + hours+ ":" + minutes;
		            }
			
			$(".commentTitle").attr("data-replesLength", Object.keys(resp).length);
			$(".commentTitle").html("댓글 (" + Object.keys(resp).length + ")");
			$(".commentList").html("");
			resp.forEach(function(dto) {
				let formattedDate = formatDate(dto.cReplyDate);
				
				let cmtGroup = $('<div>').addClass('cmtGroup');
				let commentDiv = $('<div>').addClass('comment');
				let cmtUserDiv = $('<div>').addClass('cmtUser').text(dto.userId);
				let cmtCttDiv = $('<div>').addClass('cmtCtt').text(dto.cReplyContent);
				let cmtDateDiv = $('<div>').addClass('cmtDate').text(formattedDate);
				let deleteButton = $('<a>').attr('class', 'delRepleBtn').text('삭제');
				deleteButton.attr('data-repleSeq', dto.cReplySeq);
				let cmtBtnBoxDiv = $('<div>').addClass('cmtBtnBox');
				let replyButton = $('<button>').attr('type', 'button').addClass('btn btn-outline-secondary').text('답글쓰기');
				
				cmtDateDiv.append(deleteButton);
			    cmtBtnBoxDiv.append(replyButton);
			    cmtDateDiv.append(cmtBtnBoxDiv);
			    commentDiv.append(cmtUserDiv, cmtCttDiv, cmtDateDiv);
			    
			    let reReplyWriteBoxDiv = $('<div>').addClass('reReplyWriteBox');
			    let writeCmtWriterDiv = $('<div>').addClass('writeCmtWriter').text(`└ SessionId`);
			    let writeCmtCttRowDiv = $('<div>').addClass('writeCmtCttRow');
			    let textarea = $('<textarea>')
			        .attr('placeholder', '비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. (글자수 최대 1000자)')
			        .addClass('writeCmtCtt')
			        .attr('maxlength', '1000');
			    let submitButton = $('<button>').attr('type', 'button').addClass('btn btn-dark writeCmtBtn').text('등록');
			    writeCmtCttRowDiv.append(textarea, submitButton);
			    reReplyWriteBoxDiv.append(writeCmtWriterDiv, writeCmtCttRowDiv);
			    cmtGroup.append(commentDiv, reReplyWriteBoxDiv);
			    $('.commentList').append(cmtGroup);
			 	});
				}
			});
		}
    	
    	$(function() {
    		getRepleList();
		});
    	
    	$("#writeCmtBtn").on("click", function(e){
    		if($("#repleContent").val() == ""){
    			alert("댓글 내용을 입력해주세요!");
    			e.preventDefault();
    		}else{
    			$.ajax({
					type: 'post',
					url : "/addReple.reply",
					data : {
						parentSeq : $("#delBtn").attr("data-seq"),
						content : $("#repleContent").val()
					}
				}).done(function(){
					$("#repleContent").val("");
					$(".commentList").text("");
					getRepleList();
				});
    		}    		
    	});
    	
    	$(".commentList").on("click", ".delRepleBtn", function(){
            let isRepleDel = confirm("이 댓글을 정말로 삭제하시겠습니까?");
            
            if(isRepleDel){
            	$.ajax({
					url : "/delReple.reply",
					data : {
						seq : $(this).attr("data-repleseq")
					}
				});
            }else{
            	return false;
            }
            let currentLength = Number($(".commentTitle").attr("data-replesLength")) - 1;
            $(".commentTitle").attr("data-replesLength", currentLength);
			$(".commentTitle").html("댓글 (" + currentLength + ")");
            $(this).closest(".cmtGroup").remove();
        });
    	
    </script>
</body>
</html>