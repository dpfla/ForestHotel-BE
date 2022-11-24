<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="boardList" value="${boardMap.boardList }"/>
<c:set var="totBoards" value="${boardMap.totBoards }"/>
<c:set var="section" value="${boardMap.section }"/>
<c:set var="pageNum" value="${boardMap.pageNum }"/>
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
   
    <!--CSS-->
    <link rel="stylesheet" href="${contextPath }/baseweb/css/common.css">
    <link rel="stylesheet" href="${contextPath }/baseweb/css/boardList.css">
    
</head>
<body>
 <!--Wrapper 시작-->
    <div id="wrapper">
        
        <jsp:include page="header.jsp"/>

        <!--컨텐츠 영역 시작-->
        <div id="contentsArea">
            <h2>이벤트</h2>
            <table class="noticeTable">
                <thead>
                    <tr>
                        <th>NO.</th><th>글제목</th><th>작성일자</th>
                    </tr>
                </thead>
                <tbody>
	                <c:choose>
						<c:when test="${empty boardList}">
							<tr>
								<td colspan="4">등록된 글이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty boardList}">
		                	<c:forEach var="board" items="${boardList }" varStatus="boardNum">
			                    <tr>
			                        <td>${totBoards - boardNum.count - (pageNum-1)*10 + 1 }</td>
			                        <td><a href="${contextPath }/board/viewBoard.do?articleNo=${board.articleNo}&section=${section}&pageNum=${pageNum}">
			                        	${board.title }</a></td>
			                        <td>${board.writeDate }</td>
			                    </tr>
		                    </c:forEach>
		                </c:when>
		            </c:choose>
                </tbody>
            </table>
            <!-- 
	            <div class="pagingArea">
	                <a href="#" class="selected">1</a>
	                <a href="#">2</a>
	                <a href="#">3</a>
	            </div>
	         -->   
            <div class="pagingArea">
				<c:if test="${totBoards != null}">
					<c:choose>
						<c:when test="${totBoards > 50 }">
							<c:forEach var="page" begin="1" end="5" step="1">
								<c:if test="${section > 1 && page == 1 }">  
									<a href="${contextPath }/board/boardList.do?
									section=${section}&pageNum=${(section-1)*5+1}"> prev</a>
								</c:if>
								<a href="${contextPath }/board/boardList.do?
								section=${section}&paegNum=${page}">${(section-1)*5+page }</a>
								<c:if test="${page == 5}">
									<a href="${contextPath }/board/boardList.do?
									section=${section+1}&pageNum=${(section)*5+1}"> next</a>
								</c:if>
							</c:forEach>
						</c:when>
						
						<c:when test="${totBoards == 50 }">
							<c:forEach var="page" begin="1" end="5" step="1">
								<a href="#">${page }</a>
							</c:forEach>
						</c:when>
						
						<c:when test="${totBoards < 50 }">
							<c:forEach var="page" begin="1" end="${totBoards/5 }" step="1">
								<c:choose>
									<c:when test="${pageNum == page }">
										<a class="selected" href="${contextPath }/board/boardList.do?
										section=${section}&pageNum=${page }">${page }</a> 
									</c:when>
									<c:otherwise>
										<a href="${contextPath }/board/boardList.do?
										section=${section}&pageNum=${page }">${page }</a> 
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:if>
			</div>
        </div>
        <!--컨텐츠 영역 종료-->

        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>