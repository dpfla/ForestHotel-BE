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
    <script src="${contextPath }/baseweb/js/api-key.js"></script>
    <script src="${contextPath }/baseweb/js/common.js"></script>
    <script src="${contextPath }/baseweb/js/viewBoard.js"></script>
   
    <!--CSS-->
    <link rel="stylesheet" href="${contextPath }/baseweb/css/common.css">
    <link rel="stylesheet" href="${contextPath }/baseweb/css/viewBoard.css">
    
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
	        <form action="${contextPath }/board/modBoard.do?articleNo=${board.articleNo}&section=${section}&pageNum=${pageNum}" method="post">
	            <h2>공지사항</h2>
	            <div class="noticeArea">
	                <div class="noticeHeader">
	                    <input value="${board.title }" name="title" readonly>
	                    <span>${board.writeDate }</span>
	                </div>
	                <textarea class="noticeContent" name="content" readonly>${board.content }</textarea>
	            </div>
	            <div class="btnArea">
		            <a href="${contextPath }/board/boardList.do?section=${section}&pageNum=${pageNum}">목록</a>
		            <div class="btn_delmod">                	
		            	 <a type="button" onclick="fn_hide();">수정하기</a>
		            	 <a href="${contextPath }/board/delBoard.do?articleNo=${board.articleNo}&section=${section}&pageNum=${pageNum}">삭제하기</a>
		            </div>
		            <div class="btn_savecancle hidden">                	
		            	 <input type="submit" value="저장하기">
		            	 <a type="button" onclick="fn_show();">취소하기</a>
		            </div>
		        </div>
	        </form>
        </div>
        <!--컨텐츠 영역 종료-->

        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>