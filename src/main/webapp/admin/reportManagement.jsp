<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>관리자페이지 커뮤니티 신고현황</title>
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
.active {
	border-bottom: 0;
	background-color: #888;
}

.header {
	height: 100px;
	display: flex;
	font-size: 36px;
	align-items: center;
	padding-left: 40px;
	font-weight: bold;
	background-color: #f4f4f4;
	border-bottom: 2px solid gray;
}

.main {
	display: flex;
}

.main .navi {
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #E2E3E5;
	border-bottom: 2px solid gray;
}

.main .navi .profileBox {
	display: flex;
    justify-content: center;
    align-items: center;
	width: 85%;
	height: 50px;
	margin-top: 30px;
	background-color: white;
	border: 1px solid black;
}

.main .navi .profileBox .profile {
	height: 250px;
	width: 80%;
	margin: 20px auto 0 auto;
	border: 1px solid black;
	background-color : #ddd;
}

.main .navi .profileBox .name {
	text-align: center;
	height: 70px;
	padding-top: 20px;
	font-size: 16px;
	font-weight: bold;
	margin-top: 10px;
}

.main .navi .naviBox {
	width: 85%;
	height: 450px;
	margin-top: 30px;
}

.main .navi .naviBox .bigNavi {
	height: 70px;
	border-top: 2px solid gray;
	display: flex;
	align-items: center;
	font-size: 24px;
	font-weight: bold;
	padding-left: 20px;
}

.main .navi .naviBox .smallNavi {
	height: 40px;
	display: flex;
	align-items: center;
	font-size: 20px;
	font-weight: bold;
	padding-left: 20px;
}

.main .contentBox {
	flex: 5;
	border: 2px solid gray;
	border-right: 0;
	border-top: 0;
}

.main .contentBox .contentTitle {
	height: 150px;
	border-bottom: 2px solid gray;
	font-size: 48px;
	font-weight: bold;
	display: flex;
	align-items: center;
	padding-left: 40px;
	background-color: lightgray;
	color: rgb(59, 59, 59);
}

#dashboard {
	border-bottom: 0;
}

.postBox {
	width: 95%;
	margin: 20px auto 0 auto;
}

.postBox .postHeader {
	height: 60px;
	display: flex;
	border-bottom: 2px solid gray;
}

.postBox .postHeader div {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
	font-weight: bold;
}

.postBox .postList {
	min-height: 400px;
}

.postBox .post {
	border-top: 0;
	height: 40px;
	display: flex;
	border-bottom: 1px solid gray;
	padding: 25px 0 25px 0;
}

.postBox .post div {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
}

.searchBox {
	display: flex;
	justify-content: end;
	align-items: center;
	height: 60px;
	margin-top: 20px;
	margin-right: 20px;
}

.searchBox input {
	width: 300px;
	border: 1px solid gray;
}

.pageNavi {
	margin: 60px 0 40px 0;
	display: flex;
	justify-content: center;
	font-size: 24px;
}

.pageNavi a {
	display: inline-block;
	padding: 0 10px;
	min-width: 38px;
	height: 36px;
	line-height: 35px;
	font-size: 20px;
}

.modal-content {
	background-color: #303544;
	color: white;
	width: 720px;
	padding: 15px;
}

.modal-body {
	background-color: #f8f9fb;
	color: black;
}

.modal-header h5 {
	margin-left: 45%;
	font-size: 21px;
}

.modal-footer {
	display: flex;
	justify-content: center;
}

.modalInfoBox {
	height: 56px;
	width: 660px;
	display: flex;
	align-items: center;
	border: 2px solid gray;
	border-bottom: 0;
	font-size: 14px;
	font-weight: 500;
	color: black;
}

.modalInfoBox .infoTitle {
	width: 160px;
	padding-left: 30px;
	color: black;
}

.modalInfoBox .info {
	width: 500px;
	font-weight: bold;
	padding-left: 10px;
	color: black;
}

#reportBoxtitle {
	margin: 20px 0 0 10px;
	font-weight: 500;
}

.reportBox {
	width: 660px;
	height: 282px;
	margin-top: 10px;
	overflow-y: auto;
	border-top: 1px solid gray;
}

.report {
	display: flex;
	height: 56px;
	border: 1px solid gray;
	border-top: 0;
	font-size: 14px;
}

.report div:not(.rTitle) {
	display: flex;
	justify-content: center;
	align-items: center;
}

.report .rTitle {
	display: flex;
	align-items: center;
	padding-left: 50px;
}

.btnBox {
	margin-top: 20px;
}

.delAllBtn {
	margin-left: 40px;
}

.dropdown-item:active{
	background-color:black;
	
}
</style>
</head>

<body>
	<div class="modal" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">신고 현황</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modalInfoBox">
						<div class="infoTitle">신고 대상자</div>
						<div class="info" id="reportedPerson"></div>
					</div>
					<div class="modalInfoBox" style="border-bottom: 2px solid gray;">
						<div class="infoTitle">신고 제목</div>
						<div class="info" id="reportedTitle"></div>
					</div>
					<h5 id="reportBoxtitle">신고 내역</h5>
					<div class="reportBox"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="header">관리자페이지</div>
	<div class="main">
		<div class="navi">
			<div class="profileBox name">${loginId}관리자님, 환영합니다!</div>
			<div class="naviBox">
				<a href="/index.jsp" target="_blank"
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi">메인사이트
					이동</a> <a href="/dashBoard.admin"
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi"
					id="dashboard">대시보드</a>

				<div class="dropdown">
					<a style="width: 100%; text-align: left; border-radius: 0;"
						class="btn btn-secondary dropdown-toggle bigNavi active"
						href="/memberList.admin" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> 회원관리 </a>

					<ul style="width: 100%" class="dropdown-menu"
						style="border-radius:0;">
						<li><a class="dropdown-item" href="/memberList.admin">회원목록</a></li>
						<li><a class="dropdown-item" href="/reportList.admin">신고현황</a></li>
						<li><a class="dropdown-item" href="/blackList.admin">블랙회원관리</a></li>
					</ul>
				</div>
				<!-- <a
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi disabled">회원관리</a>
					<a href="/memberList.admin"
					class="list-group-item list-group-item-action list-group-item-secondary smallNavi">회원
					목록</a> <a href="/reportList.admin"
					class="list-group-item list-group-item-action list-group-item-secondary smallNavi">신고
					현황</a> <a href="/blackList.admin"
					class="list-group-item list-group-item-action list-group-item-secondary smallNavi">블랙회원
					관리</a> <a href="/index.jsp" target="_blank"
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi">메인사이트
					이동</a> -->
			</div>

		</div>
		<div class="contentBox">
			<div class="contentTitle" style="height:113px">신고 현황</div>
			<div class="content">
				<form action="/searchPostList.admin" id="searchForm">
					<div class="searchBox">
						<input class="form-control me-2" type="search"
							placeholder="작성자명 검색" aria-label="Search" name="searchInput"
							id="searchInput">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
				</form>
				<div class="postBox">
					<div class="postHeader">
						<div class="col-1">글번호</div>
						<div class="col-5"
							style="justify-content: start; padding-left: 100px;">제목</div>
						<div class="col-2">작성자</div>
						<div class="col-2">작성일</div>
						<div class="col-2">신고 횟수</div>
					</div>
					<div class="postList">
						<c:choose>
							<c:when test="${fn:length(list) == 0}">
								<p
									style="text-align: center; margin-top: 20px; font-size: 18px;">신고된
									게시글이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="DTO" items="${list}">
									<div class="post">
										<div class="col-1 postSeq">${DTO.cBoardSeq}</div>
										<div class="col-5 postTitle"
											style="justify-content: start; padding-left: 100px;">
											<a href="/detail.cboard?seq=${DTO.cBoardSeq}" target="_blank"
												style="font-weight: bold;">${DTO.cBoardTitle}</a>
										</div>
										<div class="col-2 postWriter">${DTO.userNickname}</div>
										<div class="col-2 postWriteDate">
											<fmt:formatDate value="${DTO.cBoarDate}" pattern="yy. MM. dd" />
										</div>
										<div class="col-2 postReportCount">
											<button type="button" class="btn btn-link viewReportBtn"
												style="font-weight: bold; text-decoration : none;">${DTO.cBoardReport}</button>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
				<div class="btnBox">
					<button type="button" class="btn btn-danger btn-lg delAllBtn">전체
						삭제</button>
				</div>
				<div class="pageNavi"></div>
			</div>
		</div>
	</div>
	<script>
                    function getNaviString() {
                        let currentPage = ${ cpage }
                        let recordTotalCount = ${ record_total_count }
                        let recordCountPerPage = ${ record_count_per_page }
                        let naviCountPerPage = ${ navi_count_per_page }

                        let pageTotalCount = 0;
                        if (recordTotalCount % recordCountPerPage == 0) {
                            pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage);
                        } else {
                            pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage) + 1;
                        }

                        let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
                        let endNavi = startNavi + naviCountPerPage - 1;
                        if (endNavi > pageTotalCount) {
                            endNavi = pageTotalCount;
                        }

                        let needNext = true;
                        let needPrev = true;

                        if (pageTotalCount <= naviCountPerPage) {
                            needPrev = false;
                            needNext = false;
                        } else if (startNavi == 1) {
                            needPrev = false;
                        } else if (endNavi == pageTotalCount) {
                            needNext = false;
                        }

                        let naviString = "";
                        if (needPrev) {
                            if (${ isSearchedList == 1 }) {
                                naviString = naviString + "<a href = '/reportList.admin?searchInput=${searchInput}" + "&cpage=1'>《</a>";
                                naviString = naviString + "<a href = '/reportList.admin?searchInput=${searchInput}" + "&cpage=" + (startNavi - 1) + "'>〈</a>";
                            }else {
                                naviString = naviString + "<a href = '/reportList.admin?cpage=1'>《</a>";
                                naviString = naviString + "<a href = '/reportList.admin?cpage=" + (startNavi - 1) + "'>〈</a>";
                            }
                        }
                        for (let i = startNavi; i <= endNavi; i++) {
                            if (${ isSearchedList == 1 }) {
                                if (i == currentPage) {
                                    naviString = naviString + "<a class='fw-bold' href = '/reportList.admin?searchInput=${searchInput}" + "&cpage=" + i + "'>" + i + "</a> ";
                                } else {
                                    naviString = naviString + "<a class='text-muted' href = '/reportList.admin?searchInput=${searchInput}" + "&cpage=" + i + "'>" + i + "</a> ";
                                }
                            }else {
                                if (i == currentPage) {
                                    naviString = naviString + "<a class='fw-bold' href = '/reportList.admin?cpage=" + i + "'>" + i + "</a> ";
                                } else {
                                    naviString = naviString + "<a class='text-muted' href = '/reportList.admin?cpage=" + i + "'>" + i + "</a> ";
                                }
                            }
                        }
                        if (needNext) {
                            if (${ isSearchedList == 1 }) {
                                naviString = naviString + "<a href = '/reportList.admin?searchInput=${searchInput}" + "&cpage=" + (endNavi + 1) + "'>〉</a>";
                                naviString = naviString + "<a href = '/reportList.admin?searchInput=${searchInput}" + "&cpage=" + pageTotalCount + "'>》</a>";
                            }else {
                                naviString = naviString + "<a href = '/reportList.admin?cpage=" + (endNavi + 1) + "'>〉</a>";
                                naviString = naviString + "<a href = '/reportList.admin?cpage=" + pageTotalCount + "'>》</a>";
                            }
                        }

                        return naviString;
                    };

                    $(document).ready(function () {
                        let naviString = getNaviString();
                        $(".pageNavi").html(naviString);

                        $("#searchInput").val("${searchInput}");
                    });

                    $(".postList").on("click", ".viewReportBtn", function () {
                        $.ajax({
                            url: "/viewReport.admin",
                            async: false,
                            dataType: "json",
                            data: {
                                seq: $(this).closest(".post").find(".postSeq").text()
                            }
                        }).done(function (resp) {
                            $(".reportBox").html("");
                            function formatDate(timestamp) {
                                let date = new Date(timestamp);
                                let year = date.getFullYear().toString().slice(2);
                                let month = ('0' + (date.getMonth() + 1)).slice(-2);
                                let day = ('0' + date.getDate()).slice(-2);
                                let hours = ('0' + date.getHours()).slice(-2);
                                let minutes = ('0' + date.getMinutes()).slice(-2);
                                return year + "." + month + "." + day + " " + hours + ":" + minutes;
                            }

                            let count = 1;
                            resp.forEach(function (dto) {
                                let formattedDate = formatDate(dto.reportDate);

                                let newReport = $('<div class="report"></div>');
                                let seq = $('<div class="col-1 rSeq"></div>').text(count);
                                let title = $('<div class="col-7 rTitle"></div>');

                                if (Number(dto.reportType) == 1) {
                                    title.text("스팸홍보/도배글입니다.");
                                } else if (Number(dto.reportType) == 2) {
                                    title.text("욕설/생명경시/혐오/차별적 표현입니다.");
                                } else if (Number(dto.reportType) == 3) {
                                    title.text("개인정보 노출 게시물입니다.");
                                } else {
                                    title.text("청소년에게 유해한 내용입니다.");
                                }

                                let nickname = $('<div class="col-2 rNickname"></div>').text(dto.userNickname);
                                let date = $('<div class="col-2 rDate"></div>').text(formattedDate);

                                newReport.append(seq);
                                newReport.append(title);
                                newReport.append(nickname);
                                newReport.append(date);

                                $('.reportBox').append(newReport);
                                count = count + 1;
                            });
                        });
                        $("#reportedPerson").html($(this).closest(".post").find(".postWriter").text());
                        $("#reportedTitle").html($(this).closest(".post").find(".postTitle").text());

                        $("#staticBackdrop").modal('show');
                    });

                    $("#searchForm").on("submit", function (e) {
                        if ($("#searchInput").val() == "") {
                            alert("검색할 작성자명을 입력해주세요!");
                            e.preventDefault();
                        }
                    });
                    
                    $(".delAllBtn").on("click", function(){
                    	let isDel = confirm("신고 현황에 집계된 모든 게시글이 삭제됩니다. 계속하시겠습니까?");
                    	
                    	if(isDel){
                    		location.href = "/delAllPost.admin";
                    	}else{
                    		return;
                    	}
                    	
                    	
                    	
                    });

                </script>

</body>

</html>