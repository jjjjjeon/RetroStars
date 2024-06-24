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
<title>관리자페이지 블랙회원관리</title>
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

.memberBox {
	width: 95%;
	margin: 20px auto 0 auto;
}

.memberBox .memberHeader {
	height: 60px;
	display: flex;
	border-bottom: 2px solid gray;
}

.memberBox .memberHeader div {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
	font-weight: bold;
}

.memberBox .memberList {
	min-height: 400px;
}

.memberBox .member {
	border-top: 0;
	height: 40px;
	display: flex;
	border-bottom: 1px solid gray;
	padding: 25px 0 25px 0;
}

.memberBox .member div {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
}

.memberBox .member .memberBtnBox {
	display: flex;
}

.memberBox .member .memberBtnBox button {
	width: 25%;
	font-weight: bold;
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

.dropdown-item:active{
	background-color:black;
	
}
</style>
</head>

<body>
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
			<div class="contentTitle" style="height:113px">블랙회원 관리</div>
			<div class="content">
				<form action="/searchBlackList.admin" id="searchForm">
					<div class="searchBox">
						<input class="form-control me-2" type="search"
							placeholder="회원 ID검색" aria-label="Search" name="searchInput"
							id="searchInput">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
				</form>
				<div class="memberBox">
					<div class="memberHeader">
						<div class="col-2">아이디</div>
						<div class="col-2">이름</div>
						<div class="col-2">닉네임</div>
						<div class="col-2">가입일</div>
						<div class="col-4"></div>
					</div>
					<div class="memberList">
						<c:choose>
							<c:when test="${fn:length(list) == 0}">
								<p
									style="text-align: center; margin-top: 20px; font-size: 18px;">블랙된
									회원이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="DTO" items="${list}">
									<div class="member">
										<div class="col-2 memberId">${DTO.userId}</div>
										<div class="col-2 memberName">${DTO.userName}</div>
										<div class="col-2 memberNickname">${DTO.userNickname}</div>
										<div class="col-2 memberJoinDate">
											<fmt:formatDate value="${DTO.userJoinDate}"
												pattern="yy. MM. dd" />
										</div>
										<div class="col-4 memberBtnBox">
											<button type="button" class="btn btn-dark blackCancelBtn">블랙해제</button>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
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
                                naviString = naviString + "<a href = '/searchBlackList.admin?searchInput=${searchInput}" + "&cpage=1'>《</a>";
                                naviString = naviString + "<a href = '/searchBlackList.admin?searchInput=${searchInput}" + "&cpage=" + (startNavi - 1) + "'>〈</a>";
                            }else {
                                naviString = naviString + "<a href = '/blackList.admin?cpage=1'>《</a>";
                                naviString = naviString + "<a href = '/blackList.admin?cpage=" + (startNavi - 1) + "'>〈</a>";
                            }
                        }
                        for (let i = startNavi; i <= endNavi; i++) {
                            if (${ isSearchedList == 1 }) {
                                if (i == currentPage) {
                                    naviString = naviString + "<a class='fw-bold' href = '/searchBlackList.admin?searchInput=${searchInput}" + "&cpage=" + i + "'>" + i + "</a> ";
                                } else {
                                    naviString = naviString + "<a class='text-muted' href = '/searchBlackList.admin?searchInput=${searchInput}" + "&cpage=" + i + "'>" + i + "</a> ";
                                }
                            }else {
                                if (i == currentPage) {
                                    naviString = naviString + "<a class='fw-bold' href = '/blackList.admin?cpage=" + i + "'>" + i + "</a> ";
                                } else {
                                    naviString = naviString + "<a class='text-muted' href = '/blackList.admin?cpage=" + i + "'>" + i + "</a> ";
                                }
                            }
                        }
                        if (needNext) {

                            if (${ isSearchedList == 1 }) {
                                naviString = naviString + "<a href = '/searchBlackList.admin?searchInput=${searchInput}" + "&cpage=" + (endNavi + 1) + "'>〉</a>";
                                naviString = naviString + "<a href = '/searchBlackList.admin?searchInput=${searchInput}" + "&cpage=" + pageTotalCount + "'>》</a>";
                            }else {
                                naviString = naviString + "<a href = '/blackList.admin?cpage=" + (endNavi + 1) + "'>〉</a>";
                                naviString = naviString + "<a href = '/blackList.admin?cpage=" + pageTotalCount + "'>》</a>";
                            }
                        }

                        return naviString;
                    };

                    $("#searchForm").on("submit", function (e) {
                        if ($("#searchInput").val() == "") {
                            alert("검색할 ID를 입력해주세요!");
                            e.preventDefault();
                        }
                    });

                    $(document).ready(function () {
                        let naviString = getNaviString();
                        $(".pageNavi").html(naviString);

                        $("#searchInput").val("${searchInput}");
                    });

                    $(".memberList").on("click", ".blackCancelBtn", function () {
                        let isThisUserBlackCancel = confirm("정말 이 유저의 블랙을 취소하시겠습니까?");
                        if (isThisUserBlackCancel) {
                            $.ajax({
                                url: "/blackCancelUser.admin",
                                async: false,
                                data: {
                                    id: $(this).closest(".member").find(".memberId").text()
                                }
                            }).done(function (resp) {
                                if (resp == 'success') {
                                    alert("유저 블랙이 취소되었습니다. 앞으로 이 유저의 로그인이 허용됩니다.");
                                    location.reload();
                                } else {
                                    alert("유저 블랙 취소 실패.");
                                }
                            });
                        } else {
                            return;
                        }
                    });
                </script>

</body>

</html>