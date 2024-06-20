<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 대시보드</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- Chart.js -->
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

div {
	border: 1px solid black;
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
	width: 85%;
	height: 350px;
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

#dashboard {
	border-bottom: 0;
}

.main .navi .naviBox .bigNavi {
	height: 70px;
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
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

.detailA:hover {
	background-color: darkgray;
}
</style>
</head>
<body>
	<div class="header">관리자페이지</div>
	<div class="main">
		<div class="navi">
			<div class="profileBox">
				<div class="profile">
					<img src="/image/admin.png" style="width : 100%; height : 100%; padding : 40px;">
				</div>
				<div class="name">${loginId} 관리자님, 환영합니다!</div>
			</div>
			<div class="naviBox">
				<a href="/dashBoard.admin"
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi active"
					id="dashboard">대시보드</a> <a
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi disabled">회원관리</a>
				<a href="/memberList.admin"
					class="list-group-item list-group-item-action list-group-item-secondary smallNavi">회원
					목록</a> <a href="/reportList.admin"
					class="list-group-item list-group-item-action list-group-item-secondary smallNavi">신고
					현황</a> <a href="/blackList.admin"
					class="list-group-item list-group-item-action list-group-item-secondary smallNavi">블랙회원
					관리</a> <a href="/index.jsp" target="_blank"
					class="list-group-item list-group-item-action list-group-item-secondary bigNavi">메인사이트
					이동</a>
			</div>

		</div>
		<div class="contentBox">
			<div class="contentTitle">대시보드</div>
			<div class="content"
				style="display: flex; flex-direction: column; width: 1761px; height: 863px;">
				<div class="col1" style="flex: 1; display: flex;">
					<div class="row1" style="flex: 1;">
						<canvas id="gameNumberOfChart" style="width: 100%; height: 100%"></canvas>
					</div>
					<div class="row2" style="flex: 1;">
						<canvas id="genderRatioOfChart" style="width: 100%; height: 100%"></canvas>
					</div>
					<div class="row3" style="flex: 1;">
						<canvas id="ageNumberOfChart" style="width: 100%; height: 100%"></canvas>
					</div>
				</div>
				<div class="co12" style="flex: 1; display: flex;">
					<div class="row4" style="flex: 1;">
						<canvas id="gameAvgOfChart" style="width: 100%; height: 100%"></canvas>
					</div>
					<div class="row5" style="flex: 1; display: flex;">
						<div class="qa" style="flex: 7; padding: 20px">
							<h5>질문과 답변</h5>
							<hr>
							<div class="list"
								style="display: flex; flex-direction: column; overflow: auto; height: 320px; text-align: center">
								<c:forEach var="dto" items="${list}">
									<a class="detailA" data-postOwnerId="${dto.userId}"
										data-qBoardSeq="${dto.qBoardSeq}"
										data-qBoardSecret="${dto.qBoardSecret}">
										<div class="list_data_row row"
											style="height: 40px; width: 100%; margin: 0px; line-height: 37px;">
											<div class="list_data_seq center" style="flex: 0.5;">${dto.qBoardSeq}</div>
											<div class="list_data_title center" style="flex: 6.0;">${dto.qBoardTitle}</div>
											<div class="list_data_date center" style="flex: 1.5;">
												<fmt:formatDate value="${dto.qBoardDate}"
													pattern="yyyy.MM.dd"></fmt:formatDate>
											</div>
											<c:choose>
												<c:when test="${dto.qBoardAnswer eq 'N'}">
													<div class="list_data_answer center"
														style="flex: 2; color: orangered">답변예정</div>
												</c:when>
											</c:choose>
										</div>
									</a>
								</c:forEach>


							</div>
						</div>
						<div class="fn" style="flex: 3; padding: 20px">
							<h5>공지사항</h5>
							<button class="btn btn-secondary"
								onclick="location.href='/list.nboard'">이동하기</button>
							<button class="btn btn-secondary"
								onclick="location.href='/nboard/nBoardWrite.jsp'">작성하기</button>
							<hr>
							<h5>즐겨찾는 질문</h5>
							<button class="btn btn-secondary"
								onclick="location.href='/list.fboard'">이동하기</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
  		//디테일페이지 앵커 권한 설정
		$($(".detailA")).on("click",function(){	
			window.location.href="/detail.qboard?seq="+$(this).attr("data-qBoardSeq");
		});
    
    	
    	let ctx1= document.getElementById("gameNumberOfChart").getContext("2d");
    	
    	let mybarChart1 = new Chart(ctx1, {
    		  type: 'bar',
    		  data: {
    		    labels: ['게임별 이용 횟수 현황'],
    		    datasets: [{
    		      label: '게임1',
    		      backgroundColor: "#000080",
    		      data: [${gameNumberOfArr[1]}]
    		    }, {
    		      label: '게임2',
    		      backgroundColor: "#e17055",
    		      data: [${gameNumberOfArr[2]}]
    		    }, {
    		      label: '게임3',
    		      backgroundColor: "#add8e6",
    		      data: [${gameNumberOfArr[3]}]
    		    }, {
    		      label: '게임4',
    		      backgroundColor: "#fdcb6e",
    		      data: [${gameNumberOfArr[4]}]
    		    }, {
    		      label: '게임5',
    		      backgroundColor: "#a29bfe",
    		      data: [${gameNumberOfArr[5]}]
    		    }]
    		  },

    		  options: {
    		    legend: {
    		      display: true,
    		      position: 'bottom',
    		      labels: {
    		        fontColor: "#000080",
    		      }
    		    },
    		    scales: {
    		      yAxes: [{
    		        ticks: {
    		          beginAtZero: true
    		        }
    		      }]
    		    }
    		  }
    		});
    	
    	//성별 분포
    	let ctx2= document.getElementById("genderRatioOfChart").getContext("2d");
    	
         let myPieChart2 = new Chart(ctx2, {
           type: 'pie',
           data: {
             labels: ['남자', '여자'],
             datasets: [{
               backgroundColor: ["#add8e6","#e17055"],
               data: [${genderRatioOfMem[1]}, ${genderRatioOfMem[2]}]
             }]
           },
           options: {
             plugins: {
               legend: {
                 display: true,
                 position: 'bottom',
                 labels: {
                   fontColor: "#000080"
                 }
               },
               title: {
                 display: true,
                 text: '회원 성별 분포',
                 font: {
                   size: 16,
                   weight: 'bold'
                 }
               },
               tooltip: {
                 callbacks: {
                   label: function(context) {
                     let label = context.label || '';
                     if (label) {
                       label += ': ';
                     }
                     label += context.raw + '%';
                     return label;
                   }
                 }
               }
             },
             responsive: true,
             maintainAspectRatio: false
           }
         });
    	
    	
    	
    	
		let ctx3= document.getElementById("ageNumberOfChart").getContext("2d");
    	
    	let mybarChart3 = new Chart(ctx3, {
    		  type: 'bar',
    		  data: {
    		    labels: ['연령별 이용 횟수 현황'],
    		    datasets: [{
    		      label: '10대',
    		      backgroundColor: "#000080",
    		      data: [${ageNumberOfArr[1]}]
    		    }, {
    		      label: '20대',
    		      backgroundColor: "#e17055",
    		      data: [${ageNumberOfArr[2]}]
    		    }, {
    		      label: '30대',
    		      backgroundColor: "#add8e6",
    		      data: [${ageNumberOfArr[3]}]
    		    }, {
    		      label: '40대',
    		      backgroundColor: "#fdcb6e",
    		      data: [${ageNumberOfArr[4]}]
    		    }, {
    		      label: '50대',
    		      backgroundColor: "#a29bfe",
    		      data: [${ageNumberOfArr[5]}]
    		    }]
    		  },

    		  options: {
    		    legend: {
    		      display: true,
    		      position: 'bottom',
    		      labels: {
    		        fontColor: "#000080",
    		      }
    		    },
    		    scales: {
    		      yAxes: [{
    		        ticks: {
    		          beginAtZero: true
    		        }
    		      }]
    		    }
    		  }
    		});
    	
    	 let ctx4 = document.getElementById('gameAvgOfChart').getContext('2d');
         let mybarChart4 = new Chart(ctx4, {
           type: 'bar',
           data: {
             labels: ['게임1', '게임2', '게임3', '게임4', '게임5'],
             datasets: [{
               label: '게임별 평균 플레이 시간',
               backgroundColor: [
                 "#000080",
                 "#e17055",
                 "#add8e6",
                 "#fdcb6e",
                 "#a29bfe"
               ],
               data: [
                 ${gameAvgOfTime[1]},
                 ${gameAvgOfTime[2]},
                 ${gameAvgOfTime[3]},
                 ${gameAvgOfTime[4]},
                 ${gameAvgOfTime[5]}
               ]
             }]
           },
           options: {
             indexAxis: 'y',
             plugins: {
               legend: {
                 display: true,
                 position: 'bottom',
                 labels: {
                   fontColor: "#000080",
                 }
               }
             },
             scales: {
               x: {
                 beginAtZero: true
               }
             },
             responsive: true,
             maintainAspectRatio: false
           }
         });
    	
    	
    </script>


</body>
</html>