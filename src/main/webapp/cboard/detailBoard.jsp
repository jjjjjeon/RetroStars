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
	font-family: 'Noto Sans KR', sans-serif;
}

.dropdown-toggle::after { display: none; }

ul {
	list-style-type: none;
}

a {
	text-decoration: none;
	color: black;
}

.header {
	height: 70px;
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
	word-break : break-all;
}

.content .viewCont #addBookmarkBtn {
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
}

.content .viewCont #delBookmarkBtn {
	display: block;
	margin: 115px auto 0 auto;
	width: 200px;
	height: 60px;
	background-color: gray;
	color : white;
	border: 1px solid #e0e2ec;
	border-radius: 30px;
	text-align: center;
	font-size: 16px;
	font-weight: 500;
	line-height: 56px;
}

.btnBox .leftBox {
	float: left;
}

.btnBox .rightBox {
	float: right;
}

#reportBtn {
	width: 120px;
	height: 45px;
	background: rgb(243, 66, 66);
	color: #fff;
	border: 0;
	font-size: 13px;
	font-weight: bold;
	margin-right: 10px;
	display : none;
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

.commentBox .commentTitle .commentAnker {
	height: 36px;
	position: absolute;
	right : 0;
	margin-bottom: 20px;
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

#writeCmtBtn {
	width: 100px;
	height: 120px;
	margin-left: 5px;
	margin-bottom: 10px;
}

.writeReplyReplyBtn {
	width: 100px;
	height: 120px;
	margin-left: 5px;
	margin-bottom: 10px;
}

.navbar {
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
        height:70px;
    }
    
        /* 랭킹, 마이페이지 폰트 색상과 호버 효과 */
        .nav-link {
            color: white !important;
            /* margin-left: 20px; */
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

.footer {
        height: 150px;
        margin-top: 160px;
        border-top: 1px solid #e0e2ec;
        background-color: #323232;
        display: flex;
        justify-content: center;
        align-items: center;
        position : relative;
        bottom : 0;
    }
    
    .leftfooter{
           color : white;
           font-weight : bold;
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
            margin-left : 20px;
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

.delRepleRepleBtn{
	color : black;
    font-weight: bold;
    margin-left : 15px;
    cursor:pointer;
}

.top{
	position:fixed;
	width:50px;
	height:50px;
	border: 4px solid black;
	right:1%;
	bottom:18%;
	text-align: center;
	line-height: 40px;
}

.modal-content{
            background-color: #303544;
            color : white;
            width : 720px;
            padding : 15px;
        }

        .modal-body{
            background-color: #f8f9fb;
            color : black;
        }

        .modal-header h5{
            margin-left : 45%;
            font-size: 21px;
        }

        .modal-footer{
            display: flex;
            justify-content: center;
        }

        .modalInfoBox{
            height: 56px;
            width : 660px;
            display: flex;
            align-items: center;
            border : 1px solid lightgray;
            border-bottom: 0;
            font-size: 14px;
            font-weight: 500;
        }

        .modalInfoBox .infoTitle{
            width : 160px;
            padding-left : 30px;
        }

        .modalInfoBox .info{
            width : 500px;
            font-weight: bold;
            padding-left: 10px;
        }

        .modal-footer{
            padding : 0;
            margin-top : 20px;
            border : 0;
        }

        #reportCheckBox{
            border-bottom : 1px solid lightgray;
        }

        .form-select{
            width : 100%;
            height: 50px;
            font-weight: bold;
        }

        #reportFormBox{
            padding : 10px 3px 10px 0;
        }

        .descBox{
            height: 130px;
            margin-top : 25px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .descBox .p1{
            color : #898c92;
            font-weight: 500;
        }
</style>
<body>
	<div class="modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">신고하기</h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div class="modalInfoBox">
                <div class="infoTitle">신고자</div>
                <div class="info">${loginUser}</div>
              </div>
              <div class="modalInfoBox">
                <div class="infoTitle">신고 대상자</div>
                <div class="info">${DTO.userId}</div>
              </div>
              <div class="modalInfoBox">
                <div class="infoTitle">신고 제목</div>
                <div class="info">${DTO.cBoardTitle}</div>
              </div>
              <div class="modalInfoBox" id="reportCheckBox">
                <div class="infoTitle">신고사유</div>
                <div class="info" id="reportFormBox">
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="reportType">
                        <option selected>신고 사유를 선택해주세요</option>
                        <option value="1">스팸홍보/도배글입니다.</option>
                        <option value="2">욕설/생명경시/혐오/차별적 표현입니다.</option>
                        <option value="3">개인정보 노출 게시물입니다.</option>
                        <option value="4">청소년에게 유해한 내용입니다.</option>
                    </select>
                </div>
              </div>
              <div class="descBox">
                <p class="p1">신고할 내용을 다시 한번 확인해주세요.</p>
                <p style="font-weight: bold;">허위 신고의 경우, 운영정책에 따라 서비스 이용에 제한을 받을 수 있습니다.</p>
                <p class="p1">정말 위 내용으로 신고하시겠습니까?</p>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-light btn-lg" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary btn-lg" id="reportYesBtn">신고</button>
            </div>
          </div>
        </div>
      </div>
	<form action="/correction.cboard" method="post" id="changeForm">
		<div class="header" id="header">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index.jsp">홈으로</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게임
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">game1</a></li>
                            <li><a class="dropdown-item" href="#">game2</a></li>
                            <li><a class="dropdown-item" href="#">game3</a></li>
                            <li><a class="dropdown-item" href="#">game4</a></li>
                            <li><a class="dropdown-item" href="#">game5</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">자유게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">공략게시판</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">QA게시판</a></li>
                            <li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="/list.nboard">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                   

                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
				        <li class="nav-item">
				           <a class="nav-link" href="/mypage.member">
				               <img src="${sessionScope.profileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
				           </a>
				       </li>                  
                      <li class="nav-item">
                           <a class="nav-link" href="/mypage.member">마이페이지</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
                       </li>
                   </ul>                          
                   </c:when>
                   <c:otherwise>
                      <ul class="navbar-nav ms-auto">
                          <li class="nav-item">
                              <a class="nav-link" href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
                          </li>
                      </ul>
                   </c:otherwise>
                </c:choose>

            </div>
        </div>
    </nav>
		</div>
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
							value="${DTO.cBoarDate}" pattern="yyyy.MM.dd HH:mm" />
				</span> <span class="view"> <i class="fa-regular fa-eye"
						style="color: #36393f;"></i> ${DTO.cBoardView}
				</span> <span class="bookmark"> <i class="fa-regular fa-bookmark"
						style="color: #36393f;"></i> ${DTO.cBoardBookmark}
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
				${DTO.cBoardContent}
				<button type="button" id="addBookmarkBtn" style="clear: both;
				"> 
				<i class="fa-regular fa-bookmark" style="color: #000000;"></i>
				 북마크
				</button>
			</div>
			<div id="summernote"></div>
			<div class="btnBox">
				<div class="leftBox">
					<button type="button" id="reportBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">신고하기</button>
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
		<div class="commentTitle">댓글 (0) <a class="commentAnker scroll_move" href="#writeCmtBox">댓글쓰러가기</a></div>
		
		<div class="commentList">
		</div>
		<div class="writeCmtBox" id="writeCmtBox">
				<div class="writeCmtWriter">${loginUser}</div>
				<div class="writeCmtCttRow">
					<textarea
						placeholder="비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. (글자수 최대 1000자)"
						class="writeCmtCtt" maxlength="1000" id="repleContent"></textarea>
					<button type="button" class="btn btn-dark" id="writeCmtBtn">등록</button>
				</div>
		</div>
	</div>
	<div class="top"><a id="topBtn" href="#header">TOP</a></div>
	<div class="footer">
		<div class="footerbox">
            <div class="leftfooter">
                <p>회사명: 팀별빛</p>
                <p>전화: 02-1234-5678</p>
                <p>이메일: info@example.com</p>
            </div>
            <div class="rightfooter">
                <div class="iconbox">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
                <div class="coinbox">
                    <img src="/image/coin.png" alt="">
                </div>
            </div>
        </div>
	</div>

	<script>
		$("#reportYesBtn").on("click", function(e){
			if(isNaN($("select[name=reportType]").val())){
				alert("신고 사유를 선택해주세요!");
				e.preventDefault();
			}else{
				$.ajax({
					url : "/report.cboard",
					data : {
					seq : $("#delBtn").attr("data-seq"),
					id : "${loginId}",
					reportType : $("select[name=reportType]").val()
					}
				}).done(function(resp){
					if(resp == "duplicated"){
						alert("이미 신고한 글입니다!");
						location.reload();
					}else if(resp == "success"){
						alert("신고 접수가 완료되었습니다.");
						location.reload();
					}else{
						alert("신고 접수가 실패했습니다. 문제가 지속되면 관리자에게 문의해주세요.");
						location.reload();
					}
				});
			}
		});
	
	
		let totalReplyCount = 0;
		
		function getTotalReplyCount(){
			$.ajax({
				url : "/countRepleList.reply",
				data : {
				seq : $("#delBtn").attr("data-seq")
				}
			}).done(function(resp){
				totalReplyCount = Number(resp);
				$(".commentTitle").html("댓글 (" + totalReplyCount + ")").append($('<a class="commentAnker scroll_move" href="#writeCmtBox">댓글쓰러가기</a>'));
			});
		};
	
    	$("#writeBtn").on("click", function(){
    		location.href = "/goWrite.cboard";
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
			
			if(${isBookmark > 0}){
				$("#addBookmarkBtn").html(`<i class="fa-solid fa-bookmark" style="color: #ffffff;"></i>
						 북마크취소`);
				$("#addBookmarkBtn").off("click");
				$("#addBookmarkBtn").attr("id", "delBookmarkBtn");
				$("#delBookmarkBtn").on("click", function(){
					$.ajax({
						url : "/delBookmark.cboard",
						data : {
						seq : $("#delBtn").attr("data-seq")
						}
					}).done(function(resp){
						alert("해당 게시글의 북마크가 취소되었습니다.");
						location.reload();
					});
		    	})
			}
		});
    	
    	$("#addBookmarkBtn").on("click", function(){
    		$.ajax({
				url : "/addBookmark.cboard",
				data : {
				seq : $("#delBtn").attr("data-seq")
				}
			}).done(function(resp){
				alert("해당 게시글을 북마크했습니다.");
				location.reload();
			});
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
    			placeholder : `1. 비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. <br>
    	            2. 타인의 개인정보가 포함된 게시물을 올릴 경우, 개인 정보 보호법 제 59조 3호에 의해 5년 이하의 징역 또는 <br>
    	              &nbsp;&nbsp; 5천만원 이하의 벌금이 부과될 수 있으니 유의하여 주시기 바랍니다. <br>
    	            3. 모든 분들이 게시물을 불편없이 이용할 수 있도록 게시물에 대한 설명을 문자로 기재해 주시기 바랍니다. <br>
    	            4. 최대 3000자까지 작성 가능합니다.`,
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
		                onKeydown: function (e) { 
		                    var t = e.currentTarget.innerText; 
		                    if (t.trim().length >= 3000) {
		                        //delete keys, arrow keys, copy, cut, select all
		                        if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey) && !(e.keyCode == 65 && e.ctrlKey))
		                        e.preventDefault(); 
		                    } 
		                },
		                onKeyup: function (e) {
		                    var t = e.currentTarget.innerText;
		                    $('#maxContentPost').text(3000 - t.trim().length);
		                },
		                onPaste: function (e) {
		                    var t = e.currentTarget.innerText;
		                    var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
		                    e.preventDefault();
		                    var maxPaste = bufferText.length;
		                    if(t.length + bufferText.length > 3000){
		                        maxPaste = 3000 - t.length;
		                    }
		                    if(maxPaste > 0){
		                        document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
		                    }
		                    $('#maxContentPost').text(3000 - t.length);
		                },
		                onInit: function () {
		                    function isEditorEmpty() {
		                        var code = elem.summernote("code");
		                        return code === "<p><br></p>" || code === "";
		                    }
		                }
		            }
					
				      });
    		$("#originTitle").remove();
			$('#summernote').summernote('code', `${DTO.cBoardContent}`);
			
			$('.viewCont').remove();
			$(".btnBox").css("margin-top", "15px");
			$("#titleInput").focus();
			let originTitle = $("#titleInput").val();
			$("#titleInput").val("");
			$("#titleInput").val(originTitle);
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
    	
    	function loadComments() {
    	    return new Promise((resolve, reject) => {
    	        $.ajax({
    	            url: "/viewReple.reply",
    	            dataType: "json",
    	            traditional: true,
    	            data: {
    	                seq: $("#delBtn").attr("data-seq")
    	            }
    	        }).done(function(resp) {
    	            if (resp.length != 0) {
    	                function formatDate(timestamp) {
    	                    let date = new Date(timestamp);
    	                    let year = date.getFullYear().toString().slice(2);
    	                    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    	                    let day = ('0' + date.getDate()).slice(-2);
    	                    let hours = ('0' + date.getHours()).slice(-2);
    	                    let minutes = ('0' + date.getMinutes()).slice(-2);
    	                    return year + "." + month + "." + day + " " + hours + ":" + minutes;
    	                }

    	                $(".commentList").html("");
    	                resp.forEach(function(dto) {
    	                    let formattedDate = formatDate(dto.cReplyDate);

    	                    let cmtGroup = $('<div>').addClass('cmtGroup');
    	                    cmtGroup.attr("id", dto.cReplySeq);
    	                    let commentDiv = $('<div>').addClass('comment');
    	                    let cmtUserDiv = $('<div>').addClass('cmtUser').text(dto.userId);
    	                    let cmtCttDiv = $('<div>').addClass('cmtCtt').text(dto.cReplyContent);
    	                    let cmtDateDiv = $('<div>').addClass('cmtDate').text(formattedDate);
    	                    let cmtBtnBoxDiv = $('<div>').addClass('cmtBtnBox');
    	                    let replyButton = $('<button>').attr('type', 'button').addClass('btn btn-outline-secondary openReReplyWriteBtn').text('답글쓰기');
    	                    
    	                    if("${loginUser}" == dto.userId){
    	                    	let deleteButton = $('<a>').attr('class', 'delRepleBtn').text('삭제');
        	                    deleteButton.attr('data-repleSeq', dto.cReplySeq);
    	    	                cmtDateDiv.append(deleteButton);
    	    	            }

    	                    cmtBtnBoxDiv.append(replyButton);
    	                    cmtDateDiv.append(cmtBtnBoxDiv);
    	                    commentDiv.append(cmtUserDiv, cmtCttDiv, cmtDateDiv);

    	                    let reReplyWriteBoxDiv = $('<div>').addClass('reReplyWriteBox');
    	                    let writeCmtWriterDiv = $('<div>').addClass('writeCmtWriter').text(`└ ${loginUser}님의 답글`);
    	                    let writeCmtCttRowDiv = $('<div>').addClass('writeCmtCttRow');
    	                    let textarea = $('<textarea>')
    	                        .attr('placeholder', '비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. (글자수 최대 1000자)')
    	                        .addClass('writeCmtCtt')
    	                        .attr('maxlength', '1000');
    	                    let submitButton = $('<button>').attr('type', 'button').addClass('btn btn-dark writeReplyReplyBtn').text('등록');
    	                    writeCmtCttRowDiv.append(textarea, submitButton);
    	                    reReplyWriteBoxDiv.append(writeCmtWriterDiv, writeCmtCttRowDiv);
    	                    cmtGroup.append(commentDiv, reReplyWriteBoxDiv);
    	                    $('.commentList').append(cmtGroup);
    	                });
    	            }
    	            resolve();
    	        }).fail(function(jqXHR, textStatus, errorThrown) {
    	            console.error('Failed to load comments:', textStatus, errorThrown);
    	            reject(textStatus);
    	        });
    	    });
    	}

    	function loadReplies() {
    	    return new Promise((resolve, reject) => {
    	        $.ajax({
    	            url: "/viewRepleReple.reply",
    	            dataType: "json",
    	            traditional: true,
    	            data: {
    	                seq: $("#delBtn").attr("data-seq")
    	            }
    	        }).done(function(resp) {
    	            if (resp.length != 0) {
    	                function formatDate(timestamp) {
    	                    let date = new Date(timestamp);
    	                    let year = date.getFullYear().toString().slice(2);
    	                    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    	                    let day = ('0' + date.getDate()).slice(-2);
    	                    let hours = ('0' + date.getHours()).slice(-2);
    	                    let minutes = ('0' + date.getMinutes()).slice(-2);
    	                    return year + "." + month + "." + day + " " + hours + ":" + minutes;
    	                }

    	                resp.forEach(function(dto) {
    	                    let formattedDate = formatDate(dto.cReplyDate);

    	                    let commentDiv = $('<div>').addClass('comment');
    	                    commentDiv.css("margin-top", "15px");
    	                    let userId = dto.userId;
    	                    let cmtUserDiv = $('<div>').addClass('cmtUser').text("└ " + userId + "님의 답글");
    	                    let cmtCttDiv = $('<div>').addClass('cmtCtt').text(dto.cReplyContent);
    	                    let cmtDateDiv = $('<div>').addClass('cmtDate').text(formattedDate);
    	                    
    	                    if("${loginUser}" == dto.userId){
    	                    	let deleteButton = $('<a>').attr('class', 'delRepleRepleBtn').text('삭제');
        	                    deleteButton.attr('data-repleSeq', dto.cReplySeq);
    	    	                cmtDateDiv.append(deleteButton);
    	    	            }
    	                    
    	                    commentDiv.append(cmtUserDiv, cmtCttDiv, cmtDateDiv);

    	                    $("#" + dto.cReplyReply).append(commentDiv);
    	                });
    	            }
    	            resolve();
    	        }).fail(function(jqXHR, textStatus, errorThrown) {
    	            console.error('Failed to load replies:', textStatus, errorThrown);
    	            reject(textStatus);
    	        });
    	    });
    	}

    	function getRepleList() {
    	    loadComments()
    	        .then(loadReplies)
    	        .catch(error => console.error('Error in loading comments or replies:', error));
    	}
    	
    	$(function(){
    		getRepleList();
    		getTotalReplyCount();
    		
    		if(${loginUser == null}){
    			$("#delBtn").css("display", "none");
    			$("#corBtn").css("display", "none");
    			$("#writeBtn").css("display", "none");
    			$("#reportBtn").css("display", "none");
    			$("#addBookmarkBtn").css("display", "none");
    			$(".writeCmtBox").css("display", "none");
    		}else if(${loginUser != DTO.userId}){
    			$("#delBtn").css("display", "none");
    			$("#corBtn").css("display", "none");
    			$("#reportBtn").css("display", "block");
    		}
    		
    		$(".scroll_move").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
            });
    		
    		$(window).scroll(function(){
    			let scroll_height = $(document).scrollTop();
    			if ( scroll_height >= 800){
    				$(".top").fadeIn();
    			}else{
    				$(".top").fadeOut();
    			}
    		});
    	})
    	
    	$("#writeCmtBtn").on("click", function(e){
    		if($("#repleContent").val() == ""){
    			alert("댓글 내용을 입력해주세요!");
    			e.preventDefault();
    		}else{
    			$.ajax({
					type: 'post',
					url : "/addReple.reply",
					dataType: "json",
					data : {
						parentSeq : $("#delBtn").attr("data-seq"),
						content : $("#repleContent").val()
					}
				}).done(function(resp){
					function formatDate(timestamp) {
	                    let date = new Date(timestamp);
	                    let year = date.getFullYear().toString().slice(2);
	                    let month = ('0' + (date.getMonth() + 1)).slice(-2);
	                    let day = ('0' + date.getDate()).slice(-2);
	                    let hours = ('0' + date.getHours()).slice(-2);
	                    let minutes = ('0' + date.getMinutes()).slice(-2);
	                    return year + "." + month + "." + day + " " + hours + ":" + minutes;
	                }

	                let formattedDate = formatDate(resp.cReplyDate);

	                let cmtGroup = $('<div>').addClass('cmtGroup');
	                cmtGroup.attr("id", resp.cReplySeq);
	                let commentDiv = $('<div>').addClass('comment');
	                let cmtUserDiv = $('<div>').addClass('cmtUser').text(resp.userId);
	                let cmtCttDiv = $('<div>').addClass('cmtCtt').text(resp.cReplyContent);
	                let cmtDateDiv = $('<div>').addClass('cmtDate').text(formattedDate);
	                let cmtBtnBoxDiv = $('<div>').addClass('cmtBtnBox');
	                let replyButton = $('<button>').attr('type', 'button').addClass('btn btn-outline-secondary openReReplyWriteBtn').text('답글쓰기');

	                if("${loginUser}" == resp.userId){
	                let deleteButton = $('<a>').attr('class', 'delRepleBtn').text('삭제');
	                deleteButton.attr('data-repleSeq', resp.cReplySeq);
	                cmtDateDiv.append(deleteButton);
	                }
	                
	                cmtBtnBoxDiv.append(replyButton);
	                cmtDateDiv.append(cmtBtnBoxDiv);
	                commentDiv.append(cmtUserDiv, cmtCttDiv, cmtDateDiv);

	                let reReplyWriteBoxDiv = $('<div>').addClass('reReplyWriteBox');
	                let writeCmtWriterDiv = $('<div>').addClass('writeCmtWriter').text(`└ ${loginUser}님의 답글`);
	                let writeCmtCttRowDiv = $('<div>').addClass('writeCmtCttRow');
	                let textarea = $('<textarea>')
	                    .attr('placeholder', '비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다. (글자수 최대 1000자)')
	                    .addClass('writeCmtCtt')
	                    .attr('maxlength', '1000');
	                let submitButton = $('<button>').attr('type', 'button').addClass('btn btn-dark writeReplyReplyBtn').text('등록');
	                writeCmtCttRowDiv.append(textarea, submitButton);
	                reReplyWriteBoxDiv.append(writeCmtWriterDiv, writeCmtCttRowDiv);
	                cmtGroup.append(commentDiv, reReplyWriteBoxDiv);
	                totalReplyCount = totalReplyCount + 1;
	                $(".commentTitle").html("댓글 (" + totalReplyCount + ")").append($('<a class="commentAnker scroll_move" href="#writeCmtBox">댓글쓰러가기</a>'));
	                $('.commentList').append(cmtGroup);
	                $('#repleContent').val("");
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
				}).done(function(resp){
					getTotalReplyCount();
				});
            }else{
            	return false;
            }
            $(this).closest(".cmtGroup").remove();
        });
    	
    	$(".commentList").on("click", ".delRepleRepleBtn", function(){
            let isRepleDel = confirm("이 대댓글을 정말로 삭제하시겠습니까?");
            
            if(isRepleDel){
            	$.ajax({
					url : "/delRepleReple.reply",
					data : {
						seq : $(this).attr("data-repleseq")
					}
				});
            }else{
            	return false;
            }
            $(this).closest(".comment").remove();
            totalReplyCount = totalReplyCount - 1
            $(".commentTitle").html("댓글 (" + totalReplyCount + ")").append($('<a class="commentAnker scroll_move" href="#writeCmtBox">댓글쓰러가기</a>'));
        });
    	
    	$(".commentList").on("click", ".openReReplyWriteBtn", function(e){
    		if(${loginId == null}){
    			alert("로그인 후 이용해주세요!");
    			e.preventDefault();
    		}else{
    			$(this).closest(".cmtGroup").find(".reReplyWriteBox").css("display", "block");
        		$(this).attr("class", 'btn btn-outline-secondary closeReReplyWriteBtn');
        		$(this).html("답글취소");
    		}
    	})
    	
    	$(".commentList").on("click", ".closeReReplyWriteBtn", function(){
    		$(this).closest(".cmtGroup").find(".reReplyWriteBox").css("display", "none");
    		$(this).attr("class", 'btn btn-outline-secondary openReReplyWriteBtn');
    		$(this).html("답글쓰기");
    	});
    	
    	$(".commentList").on("click", ".writeReplyReplyBtn", function(){
    		$.ajax({
    			url : "/addReplyReply.reply",
    			type : "post",
    			dataType: "json",
    			data : {
    			parentBoardSeq : $("#delBtn").attr("data-seq"),
    			parentReplySeq : $(this).closest(".cmtGroup").attr("id"),
    			content : $(this).prev().val()
    			}
    		}).done(function(resp){
    			function formatDate(timestamp) {
                    let date = new Date(timestamp);
                    let year = date.getFullYear().toString().slice(2);
                    let month = ('0' + (date.getMonth() + 1)).slice(-2);
                    let day = ('0' + date.getDate()).slice(-2);
                    let hours = ('0' + date.getHours()).slice(-2);
                    let minutes = ('0' + date.getMinutes()).slice(-2);
                    return year + "." + month + "." + day + " " + hours + ":" + minutes;
                }

                let formattedDate = formatDate(resp.cReplyDate);

                let commentDiv = $('<div>').addClass('comment');
                commentDiv.css("margin-top", "15px");
                let userId = resp.userId;
                let cmtUserDiv = $('<div>').addClass('cmtUser').text("└ " + userId);
                let cmtCttDiv = $('<div>').addClass('cmtCtt').text(resp.cReplyContent);
                let cmtDateDiv = $('<div>').addClass('cmtDate').text(formattedDate);

                if("${loginUser}" == resp.userId){
                	let deleteButton = $('<a>').attr('class', 'delRepleRepleBtn').text('삭제');
                    deleteButton.attr('data-repleSeq', resp.cReplySeq);
                    cmtDateDiv.append(deleteButton);
	            }
                
                commentDiv.append(cmtUserDiv, cmtCttDiv, cmtDateDiv);

                $("#" + resp.cReplyReply).append(commentDiv);
                
                totalReplyCount = totalReplyCount + 1;
                $(".commentTitle").html("댓글 (" + totalReplyCount + ")").append($('<a class="commentAnker scroll_move" href="#writeCmtBox">댓글쓰러가기</a>'));
				
    		});
    		$(this).prev().val("");
    		$(this).closest(".cmtGroup").find(".reReplyWriteBox").css("display", "none");
    		$(this).closest(".cmtGroup").find(".closeReReplyWriteBtn").html("답글쓰기");
    		$(this).closest(".cmtGroup").find(".closeReReplyWriteBtn").attr("class", 'btn btn-outline-secondary openReReplyWriteBtn');
    	});
    	
    	$(".commentTitle").on("click", ".commentAnker", function(e){
    		if(${loginId == null}){
    			alert("로그인 후 이용해주세요!");
    			e.preventDefault();
    		}else{
    			window.scrollTo(0, document.body.scrollHeight);
    		}
    	});
    </script>
</body>
</html>