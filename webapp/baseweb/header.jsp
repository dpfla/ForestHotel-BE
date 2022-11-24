<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="curPage" value="${pageContext.request.servletPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<c:if test="${msg=='loginTrue' }">
		<script>
			$(document).ready(function(){
				alert("로그인 되었습니다.");
			})	
		</script>
	</c:if>
	<c:if test="${msg=='loginFalse' }">
		<script>
			$(document).ready(function(){
				alert("로그인에 실패했습니다");
			})	
		</script>
	</c:if>
</head>
<body>
	<!--헤더 영역 시작-->
        <header>
            <!--글로벌 메뉴 시작-->
            <div class="globalMenu">
                <ul class="globalMenuinner">
                    <li class="weather"><span></span><span></span><span></span></li>
                    <c:if test="${isLogin}">
                    	<li class="clickLogin"><a href="${contextPath }/member/logoutMember.do?curPage=${curPage}">로그아웃</a></li>
                    	<c:if test="${id != 'admin' }">                	
	                    	<li><a href="${contextPath }/member/mypage.do">마이페이지</a></li>
                    	</c:if>
                    	<c:if test="${id == 'admin' }">                	
	                    	<li><a href="${contextPath }/page/boardForm.do">공지사항 작성</a></li>
                    	</c:if>
                    </c:if>
                    <c:if test="${!isLogin }">
	                    <li class="clickLogin" id="loginClick">로그인</li>
	                    <li><a href="${contextPath }/member/joinForm.do">회원가입</a></li>
	                </c:if>
                </ul>
            </div>
            <!--글로벌 메뉴 종료-->

            <div class="logoMenu">
                <h1 class="logo">
                    <a href="${contextPath }/page/index.do">
                        Forest Hotel
                    </a>
                </h1>

                <div class="topMenu">
                    <!--메인 메뉴 시작-->
                    <nav role="navigation">
                        <h2 class="hidden">메인메뉴</h2>
                        <ul class="mainMenu" id="mainMenu">
                            <li>
                                <a href="${contextPath }/page/roomInfo.do">객실</a>
                                <ul class="roomInfoMenu underMenu">
                                    <li><a href="${contextPath }/page/roomInfo.do">디럭스</a></li>
                                    <li><a href="${contextPath }/page/roomInfo.do">패밀리</a></li>
                                    <li><a href="${contextPath }/page/roomInfo.do">스위트</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${contextPath }/page/facilityInfo.do">부대시설</a>
                                <ul class="facilityInfoMenu underMenu">
                                    <li><a href="${contextPath }/page/facilityInfo.do">야외풀</a></li>
                                    <li><a href="${contextPath }/page/facilityInfo.do">사우나</a></li>
                                    <li><a href="${contextPath }/page/facilityInfo.do">스파</a></li>
                                    <li><a href="${contextPath }/page/facilityInfo.do">피트니스</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${contextPath }/page/event.do">이벤트</a>
                                <ul class="eventMenu underMenu">
                                    <li><a href="${contextPath }/page/event.do">이벤트</a></li>
                                    <li><a href="${contextPath }/board/boardList.do">공지사항</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!--메인 메뉴 종료-->
                    <div class="reservation">
                        <a href="#">예약하기</a>
                    </div>
                </div>
            </div>
            
            <!--로그인 폼 시작-->
            <div class="loginForm">
                <form action="${contextPath }/member/loginMember.do" method="post">
                    <legend>로그인</legend>
                    <input type="hidden" name="curPage" value="${curPage}">
                    <label for="user_id">아이디</label>
                    <input type="text" id="user_id" name="user_id"> 
                    <label for="user_pw">비밀번호</label>
                    <input type="password" name="user_pw" id="user_pw">
                    <input type="submit" value="로그인">
                    <input type="hidden" name="command" value="memberLogin">
                </form>
            </div>
            <!--로그인 폼 종료-->
        </header>
        <!--헤더 영역 종료-->
</body>
</html>