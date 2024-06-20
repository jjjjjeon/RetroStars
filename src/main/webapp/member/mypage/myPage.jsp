<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">


<style>

    body{background-image:url("/image/background.png"); background-size:100% 100%;color:white;}

    *{box-sizing: border-box;}
    
    .navbar {
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

    .container{
        margin: auto;
        display: flex;
        flex-direction: column;
        height: 900px;
        width: 1200px;
        justify-content: center;
        align-items: center;
        background-color:#323232;
        border-radius:15px;
    }
    
    /*div{border:1px solid red;}*/
	.emptybox{height:35px; width:100% };
    .header{flex:2; width: 100%;}
    .row{display: flex;}
    .headertitle{width: 100%; display: flex; justify-content: start; align-items: center; font-size:30px; margin-bottom:15px; margin-top:15px;}
    .header_user_id{width: inline; font-weight:600;}

    .profilebox{flex:2.5; width: 90%; border:1px solid white; display: flex; border-radius:10px;}
    .profile{height: 100%;width: 95%;margin: auto; display: flex; justify-content: center; align-items: center} 
    .main_profile{height: 100%;width: 50%;display: flex; justify-content: center; align-items: center}
    .profile_img{width:40%; height: 80%;display: flex;justify-content: center;align-items: center;}
    .profile_data{width:60%; height: 75%;}

    .user_value_box{display: flex; font-size: 17px; height: 42px;}
    .user_id{flex:1.5; display:flex; justify-content: start; text-indent: 5px;}
    .user_id_value{flex:4;align-items: center}
    .user_level{flex:2; display:flex; justify-content: end;}
    .user_level_value{flex:2.5;text-indent: 5px; display:flex; justify-content: start;}

    .value_title{flex:2.5; display:flex; justify-content: start;text-indent: 5px;}
    .value_content{flex:7.5;}
    .value_content1{flex:2.5;}
    .value_content2{flex:5;}
    .value_content3{flex:4.5;}
    .value_content4{flex:3;}
    .gender_value{display: flex;justify-content: start;align-items: center;} 
    .gender_img{width: 40%; height: 90%;margin-bottom:10px;}
     #update_btn{width:90%; height:90%;}
    
    .rpg{background-image:url("/image/rpg_background.png"); background-size:100% 100%;}
    .rpg{height: 90%; width: 50%; display: flex; flex-direction: column; border:1px solid white; justify-content: center; align-items: center;}
    .rpg_title{flex:2; width: 100%; display: flex; align-items: center; font-size: 20px; font-weight: 700; text-indent: 20px;}
    .rpg_main_box{display:flex; width: 100%; flex:8;}
    .rpg_main_img{flex:5.5; display: flex; align-items: center; justify-content: center;}
    .rpg_img{height:90%; width: 90%; border:1px solid white;}
    .rpg_main_content{flex:4.5;display: flex; flex-direction: column;}
    .rpg_content_title{flex:4; font-size: 25px; font-weight: 700; display: flex; justify-content: start; align-items: end;}
    .rpg_content_date{flex:2; font-size: 15px; font-weight: 500; display: flex; justify-content: start; align-items: center; margin-bottom: 8px;}
    .rpg_content_score{flex:4; font-size: 35px; font-weight: 500; display: flex; justify-content: start; align-items: center; margin-bottom: 8px;}
    .no_data{display:flex; justify-content: center; align-items: center; font-size:20px;margin-bottom:20px;}

	.favorite_game{flex:0.5; width: 80%; display: flex;}
	.favorite_game_title{flex:2; font-size:25px; font-weight:700; display: flex; justify-content: start; align-items: center;}
	.favorite_game_main{flex:8;text-indent:10px; display: flex; justify-content: start; align-items: center;}
	
    .freeboard{flex:2.5; width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;}
    .board_title{flex:2; width: 90%; display: flex; justify-content: start; align-items: end; text-indent: 10px; font-size: 20px; font-weight: 700; margin-bottom: 5px;}
    .board_main{flex:8; width: 90%;border:1px solid white; overflow-y:auto; display:flex;flex-direction: column; justify-content: start; align-items: center;}
	.board_bookmark_row{display:flex; width:100%; justify-content: center; align-items: center; height:32px;}
    .board_bookmark_title{flex:6;display: flex; justify-content: center; align-items: center;}
    .board_bookmark_writer{flex:2;display: flex; justify-content: center; align-items: center;}
    .board_bookmark_date{flex:2;display: flex; justify-content: center; align-items: center;}
    .list_header{background-color:white;  font-size:18px; color:#323232; width:100%; display: flex; justify-content: center; align-items: center;}


    .tipboard{flex:2.5; width: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;}

	.board_link{color:white; text-decoration-line: none;}
	
    .footer{flex:0.5; width:90%; display: flex; justify-content: start; align-items: center;}
    .footer_delete_btn{flex:4;}
    .footer_gohome_btn{flex:6;display: flex; justify-content: end; align-items: center;}
    .join_date{display:inline;}


    #basic_img{width: 80%; height: 80%;}
    
    .main_footer { width: 100%;background-color: #323232;height: 150px; }
    .leftfooter{color : white;font-weight : bold;margin-top: 20px;}
    .rightfooter {display: flex;align-items: center;}
   	.footerbox {width: 1000px;height: 100%;margin: auto;display: flex;justify-content: space-between;align-items: center;}
    .iconbox {display: flex;align-items: center;}
	.iconbox a {margin: 0 10px;font-size: 50px;color: white;}
    .coinbox {display: flex;align-items: center;margin-left: 20px;}
    .coinbox img {width: 120px;height: 100px;margin-left : 20px;}
    
</style>

</head>
<body>

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
                            <li><a class="dropdown-item" href="/lstt.fboard">FAQ게시판</a></li>
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
    
    <div class ="emptybox"></div>
    <div class="container">
        <div class="header row">
            <div class="headertitle"><div class="header_user_id">${mydata.userNickname}</div> &nbsp;님의 My page</div>
        </div> 
        <div class="profilebox">
            <div class="profile">
                <div class="main_profile">
                    <div class="profile_img">
                        <img id="basic_img" src="/profile/${userProfileUrl}">
                    </div>
                    <div class="profile_data">
                        <div class="user_value_box">
                            <div class="user_id">ID : </div>
                            <div class="user_id_value">${mydata.userId}</div>
                            <div class="user_level">LEVEL</div>
                            <div class="user_level_value">${mydata.userLevel}</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_name value_title">NAME : </div>
                            <div class="user_name_value value_content">${mydata.userName} ( ${mydata.userNickname} )</div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_birth value_title">BRITH : </div>
                            <div class="user_birth_value value_content1"> ${birth} </div>
                            <div class="gender_value  value_content2"> 
                            	<c:choose>
                            		<c:when test="${gender == 'Male'}">
                            			<img class="gender_img" src="/image/male.png">
                            		</c:when>
                            		<c:when test="${gender == 'Female'}">
                            			<img class="gender_img" src="/image/female.png">
                            		</c:when>
                            		<c:otherwise>
                            			
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_email value_title">E-MAIL : </div>
                            <div class="user_email_value value_content"> ${mydata.userEmail} </div>
                        </div>

                        <div class="user_value_box">
                            <div class="user_phone value_title">PHONE : </div>
                            <div class="user_phone_value value_content3"> ${phone} </div>
                            <div class="user_phone_value value_content4"> 
                            	<button type="button" class="btn btn-dark" id="update_btn">Update</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="rpg">
                    <div class="rpg_title">Recently Played Game</div>
                    <c:choose>
                    <c:when test="${gprDto.gameSeq == 0}">
                     <div class="rpg_main_box no_data">
                     	최근 play 기록이 없습니다.
                     </div>
                    </c:when>
                    <c:otherwise>
                    <div class="rpg_main_box">
                        <div class="rpg_main_img">
                            <div class="rpg_img">
                            	<c:choose>
                            		<c:when test="${gprDto.gameSeq.equals('1')}">
                            			이미지1
                            		</c:when>
                            		<c:when test="${gprDto.gameSeq.equals('2')}">
                            			이미지2
                            		</c:when>
                            		<c:when test="${gprDto.gameSeq.equals('3')}">
                            			이미지3
                            		</c:when>
                            		<c:when test="${gprDto.gameSeq.equals('4')}">
                            			이미지4
                            		</c:when>
                            		<c:otherwise>
                            			이미지5
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                        </div>
                        <div class="rpg_main_content">
                            <div class="rpg_content_title rpg_content">${gprDto.gameTitle}</div>
                            <div class="rpg_content_date rpg_content"><fmt:formatDate value="${gprDto.playDate}" pattern="yy.MM.dd" /></div>
                            <div class="rpg_content_score rpg_content">${gprDto.playScore}</div>
                        </div>
                    </div>
                    </c:otherwise>
                  </c:choose>
                </div>
            </div>
        </div>
        <div class="favorite_game">
            <div class="favorite_game_title">Favorite Games</div>
            <div class="favorite_game_main">
            	<c:forEach var="seq" items="${seq}">
            		<c:choose>
            			<c:when test="${seq.equals('1')}">
            				<div class="game_seq">오버워치</div>
            			</c:when>
            			<c:when test="${seq.equals('2')}">
            				<div class="game_seq">심즈</div>
            			</c:when>
            			<c:when test="${seq.equals('3')}">
            				<div class="game_seq">apex 레전드</div>
            			</c:when>
            			<c:when test="${seq.equals('4')}">
            				<div class="game_seq">grimm's hollow</div>
            			</c:when>
            			<c:when test="${seq.equals('5')}">
            				<div class="game_seq">배틀 그라운드</div>
            			</c:when>
            			<c:otherwise>
            				<div class="game_seq">즐겨찾기를 하시면 바로 해당 게임으로 이동 됩니다.</div>
            			</c:otherwise>
            		</c:choose>
            </c:forEach>
            </div>
        </div>
        <div class="freeboard">
            <div class="free_title board_title">Community Board (자유)</div>
            <div class="free_main board_main">
            	<div class="board_bookmark_row list_header">
					<div class="board_bookmark_title">TITLE</div>
					<div class="board_bookmark_writer">WRITER</div>
					<div class="board_bookmark_date">DATE</div>
				</div>
            
            	<c:forEach var="listCategory1" items="${listCategory1}">
							<div class="free_row board_bookmark_row">
								<div class="free_title board_bookmark_title"><a class="board_link" href="/detail.cboard?seq=${listCategory1.cBoardSeq}">${listCategory1.cBoardTitle}</a></div>
								<div class="free_writer board_bookmark_writer">${listCategory1.userNickname}</div>
								<div class="free_date board_bookmark_date">
									<fmt:formatDate value="${listCategory1.cBoardDate}" pattern="yy.MM.dd" />
								</div>
							</div>
				</c:forEach>
			</div>
        </div>
        <div class="tipboard">
            <div class="tip_title board_title">Community Board (공략)</div>
            <div class="tip_main board_main">
            <div class="board_bookmark_row list_header">
					<div class="board_bookmark_title ">TITLE</div>
					<div class="board_bookmark_writer">WRITER</div>
					<div class="board_bookmark_date">DATE</div>
				</div>
            	<c:forEach var="listCategory2" items="${listCategory2}">
							<div class="tip_row board_bookmark_row">
								<div class="tip_title board_bookmark_title"><a class="board_link" href="/detail.cboard?seq=${listCategory2.cBoardSeq}">${listCategory2.cBoardTitle}</a></div>
								<div class="tip_writer board_bookmark_writer">${listCategory2.userNickname}</div>
								<div class="tip_date board_bookmark_date">
									<fmt:formatDate value="${listCategory2.cBoardDate}" pattern="yy.MM.dd" />
								</div>
							</div>
				</c:forEach></div>
        </div>
        <div class="footer">
        	<div class="footer_delete_btn">
        		<button type="button" class="btn btn-dark" id="memberOut">회원 탈퇴</button>
        	</div>
        	<div class="footer_gohome_btn">
        		<div class="join_date"><fmt:formatDate value="${mydata.userJoinDate}" pattern="yy.MM.dd" /> 부터 함께 하는 중</div>  &nbsp; &nbsp; &nbsp;
            	<button type="button" class="btn btn-dark" id="gohome">Home</button>
        	</div> 
        </div>
    </div>
    <div class ="emptybox"></div>
    <div class="main_footer">
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
</body>

    <script>
    
    $("#update_btn").on("click",function(){
    	location.href="/updateList.member"
    })
    
    $("#gohome").on("click",function(){
    	location.href="/index.jsp";
    })

    $("#memberOut").on("click",function(){
    	Swal.fire({
			  title: "Are you sure?",
			  text: "You won't be able to revert this!",
			  icon: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#3085d6",
			  cancelButtonColor: "#d33",
			  confirmButtonText: "Yes, delete it!"
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire({
			      title: "Deleted!",
			      text: "Your file has been deleted.",
			      icon: "success"
			    });
			    location.href="/memberout.members";
			  }
			});
    }) 	
    </script>
</body>
</html>