<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="${contextPath }/baseweb/js/api-key.js"></script>
    <script src="${contextPath }/baseweb/js/common.js"></script>
    <script src="${contextPath }/baseweb/js/mypage.js"></script>
 
    <!--CSS-->
    <link rel="stylesheet" href="${contextPath }/baseweb/css/common.css">
    <link rel="stylesheet" href="${contextPath }/baseweb/css/mypage.css">
    
    <c:if test="${msg=='updateTrue' }">
		<script>
			$(document).ready(function(){
				alert("정보가 수정되었습니다");
			})	
		</script>
	</c:if>
	<c:if test="${msg=='updateFalse' }">
		<script>
			$(document).ready(function(){
				alert("정보 수정에 실패했습니다. 다시 시도해주세요");
			})	
		</script>
	</c:if>
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
            <h2>마이 페이지</h2>
            <h3>회원정보</h3>
            <form action="${contextPath }/member/modMember.do" method="post" id="myInfoForm" name="myInfoForm">
                <fieldset>
                	<div class="autoInfoArea">
                        <p>
	                        <span>회원번호: </span> <span>${member.num }</span>
	                    </p>
	                    <p>
	                        <span>가입일: </span> <span>${member.joinDate }</span>
	                    </p>
                    </div>
                    <div class="inputIdArea">
                        <label for="id">아이디</label>
                        <input type="text" name="id" id="id" value="${member.id }" readonly>
                    </div>
                    <div class="inputPwArea">
                        <label for="password">비밀번호</label>
                        <input type="password" name="password" id="password" placeholder="영문, 숫자, 특수문자(@, !, *, #, ?, _) 8자~12자">
                    </div>
                    <div class="inputPwCheckArea">
                        <label for="userPwCheck">비밀번호 확인</label>
                        <input type="password" name="userPwCheck" id="userPwCheck">
                        <p class="pwEqualCheck"></p>
                    </div>
                    <div class="inputNameArea">
                        <label for="name">이름</label>
                        <input type="text" name="name" id="name" value="${member.name }" readonly>
                    </div>
                    <div class="inputBirthArea">
                        <label for="userBirth">생년월일</label>
                        <input type="text" name="userBirthY" id="userBirthY" value="1998" readonly>
                        <input type="text" name="userBirthM" id="userBirthM" value="05" readonly>
                        <input type="text" name="userBirthD" id="userBirthD" value="23" readonly>
                    </div>
                    <div class="inputTelArea">
                        <label for="tel">전화번호</label>
                        <input type="tel" name="tel" id="tel" value="0${member.tel }">
                    </div>
                    <div class="inputEmailArea">
                        <label for="email">이메일</label>
                        <input type="text" name="email" id="email" value="${member.email }">
                    </div>
                    <div class="inputReceiveArea">
                        <label for="receiveEmail" id="userInforeceive">정보 수신 여부</label>
                        <input type="checkbox" name="receiveEmail" id="receiveEmail" ${member.receiveemail == "1" ? "checked" : "unckecked" }><label for="receiveEmail">이메일</label>
                        <input type="checkbox" name="receiveSMS" id="receiveSMS" ${member.receivesms == "1" ? "checked" : "unckecked" }><label for="receiveSms">SMS</label>
                    </div>
                    <div class="btnArea">
                        <input type="button" class="btnSave" value="저장하기" onclick="fn_mod_submit()">
                        <a href="${contextPath }/member/delMember.do">회원탈퇴</a>
                    </div>
                </fieldset>
            </form>
        </div>
        <!--컨텐츠 영역 종료-->

       <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>