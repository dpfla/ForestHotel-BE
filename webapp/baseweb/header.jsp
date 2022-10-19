<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--헤더 영역 시작-->
        <header>
            <!--글로벌 메뉴 시작-->
            <div class="globalMenu">
                <ul class="globalMenuinner">
                    <li class="weather"><span></span><span></span><span></span></li>
                    <li class="clickLogin">로그인</li>
                    <li><a href="${contextPath }/baseweb/join.jsp">회원가입</a></li>
                </ul>
            </div>
            <!--글로벌 메뉴 종료-->

            <div class="logoMenu">
                <h1 class="logo">
                    <a href="${contextPath }/baseweb/index.jsp">
                        Forest Hotel
                    </a>
                </h1>

                <div class="topMenu">
                    <!--메인 메뉴 시작-->
                    <nav role="navigation">
                        <h2 class="hidden">메인메뉴</h2>
                        <ul class="mainMenu" id="mainMenu">
                            <li>
                                <a href="${contextPath }/baseweb/roomInfo.jsp">객실</a>
                                <ul class="roomInfoMenu underMenu">
                                    <li><a href="roomInfo.jsp">디럭스</a></li>
                                    <li><a href="roomInfo.jsp">패밀리</a></li>
                                    <li><a href="roomInfo.jsp">스위트</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${contextPath }/baseweb/facilityInfo.jsp">부대시설</a>
                                <ul class="facilityInfoMenu underMenu">
                                    <li><a href="facilityInfo.jsp">야외풀</a></li>
                                    <li><a href="facilityInfo.jsp">사우나</a></li>
                                    <li><a href="facilityInfo.jsp">스파</a></li>
                                    <li><a href="facilityInfo.jsp">피트니스</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${contextPath }/baseweb/event.jsp">이벤트</a>
                                <ul class="eventMenu underMenu">
                                    <li><a href="event.jsp">패키지</a></li>
                                    <li><a href="event.jsp">프로모션</a></li>
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
                <form action="login.jsp" method="post">
                    <legend>로그인</legend>
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