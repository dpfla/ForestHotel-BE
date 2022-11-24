<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="now" value="<%=new Date() %>" />
<fmt:formatDate var="fnow" value="${now }" type="date" pattern="yyyy-MM-dd" />

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
    <script src="${contextPath }/baseweb/js/boardForm.js"></script>
   
    <!--CSS-->
    <link rel="stylesheet" href="${contextPath }/baseweb/css/common.css">
    <link rel="stylesheet" href="${contextPath }/baseweb/css/boardForm.css">
    
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
            <h2>공지사항 작성</h2>
            <form action="${contextPath }/board/addBoard.do" method="post" name="frm_board">
                <p>
                    <label for="title">제목</label>
                    <input type="text" name="title" id="title">
                </p>
                <p>
                    <label for="date">작성일자</label>
                    <span>${fnow }</span>
                </p>
                <p>
                    <label for="content">내용</label>
                    <textarea name="content" id="content" cols="30" rows="10"></textarea>
                </p>
                <div class="btnArea">
                    <input type="button" onclick="fn_board_submit();" class="btn" name="btn_submit" id="btn_submit" value="등록하기">
                    <a href="${contextPath }/board/boardList.do" class="btn">목록가기</a>
                </div>
            </form>
        </div>
        <!--컨텐츠 영역 종료-->

        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>