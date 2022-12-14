<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="LeeYeRim">
    <meta name="description" content="Forest Hotel">
    <meta name="robot" content="all">
    <title>Forest Hotel</title>
    <link rel="shortcut" href="${contextPath }/baseweb/images/forest-hotel-logo.ico">

    <!--폰트 링크-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Changa:wght@500&family=Nanum+Gothic&family=Reem+Kufi+Fun:wght@500&display=swap" rel="stylesheet">

    <!--JS-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="${contextPath }/baseweb/js/api-key.js"></script>
    <script type="text/javascript" src="${contextPath }/baseweb/js/join.js"></script>
    <script type="text/javascript" src="${contextPath }/baseweb/js/common.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="${contextPath }/baseweb/css/common.css">
    <link rel="stylesheet" href="${contextPath }/baseweb/css/join.css">
    
</head>
<body>
    <!--건너뛰기 링크-->
    <a href="#contentsArea" class="skipNav">본문 바로가기</a>
    <a href="#mainMenu" class="skipNav">메뉴 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--Wrapper 시작-->
    <div id="wrapper">
        <jsp:include page="header.jsp"/>

        <!--컨텐츠 영역 시작-->
        <div id="contentsArea">
            <h2>회원가입</h2>
            <p>모든 항목을 입력해주세요</p>
            <form action="${contextPath }/member/addMemeber.do" method="post" id="joinForm" name="joinForm">
                <fieldset>
                    <legend>회원정보 입력 폼</legend>
                    <div class="inputIdArea">
                        <label for="id">아이디</label><br>
                        <input type="text" name="id" id="id" placeholder="영문, 숫자를 혼합하여 6자~15자" onchange="$('#idDuplication').val('idUncheck');">
                        <button type="button" class="userIdCheck" onclick="fn_idCheck(`${contextPath}`);">아이디 중복 확인</button>
                        <input type="hidden" id="idDuplication" value="idUncheck">
                        <p></p>
                    </div>
                    <div class="inputPw">
                        <div class="inputPwArea">
                            <label for="password">비밀번호</label><br>
                            <input type="password" name="password" id="password" placeholder="영문, 숫자, 특수문자(@, !, *, #, ?, _) 8자~12자">
                        </div>
                        <div class="inputPwCheckArea">
                            <label for="userPwCheck">비밀번호 확인</label><br>
                            <input type="password" name="userPwCheck" id="userPwCheck">
                            <p class="pwEqualCheck"></p>
                        </div>
                    </div>
                    <div class="inputNameArea">
                        <label for="name">이름</label><br>
                        <input type="text" name="name" id="name">
                    </div>
                    <div class="inputBirthArea">
                        <label for="Birth">생년월일</label><br>
                        <input type="text" name="birthY" id="birthY" placeholder="1990">
                        <input type="text" name="birthM" id="birthM" placeholder="01">
                        <input type="text" name="birthD" id="birthD" placeholder="01">
                        <p></p>
                    </div>
                    <div class="inputTelArea">
                        <label for="tel">전화번호</label><br>
                        <input type="tel" name="tel" id="tel" placeholder="숫자만 11자리">
                    </div>
                    <div class="inputInfo">
                        <div class="inputEmailArea">
                            <label for="email">이메일</label><br>
                            <input type="text" name="email" id="email" placeholder="example@forest.com">
                        </div>
                        <div class="inputReceiveArea">
                            <label id="userInforeceive">정보 수신 여부</label><br>
                            <input type="checkbox" name="receiveEmail" id="receiveEmail" checked><label for="userInforeceiveEmail">이메일</label>
                            <input type="checkbox" name="receiveSMS" id="receiveSMS" checked><label for="userInforeceiveSMS">SMS</label>
                        </div>
                    </div> 
                    <div class="btnJoinArea">
                        <button type="button" class="btnJoin" onclick="joinFormCheck()">회원가입</button>
                        <a href="${contextPath }/baseweb/index.jsp">취소</a>
                    </div>
                </fieldset>
            </form>
        </div>
        <!--컨텐츠 영역 종료-->

        <!--푸터 영역 시작-->
        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>