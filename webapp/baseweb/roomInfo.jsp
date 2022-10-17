<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="shortcut" href="images/forest-hotel-logo.ico">

    <!--폰트 링크-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Serif+KR&family=Noto+Sans+KR:wght@400;500&family=Reem+Kufi+Fun:wght@500&display=swap" rel="stylesheet">

    <!--JS-->
    <script src="js/api-key.js"></script>
    <script src="js/common.js"></script>
    <!--스와이퍼-->
    <script src="js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <script defer src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script defer src="js/swipper.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/roomInfo.css">
    
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
            <!--객실 영역 시작-->
            <h2 class="title">객실</h2>
            <div class="roomInfo">
                <h3 class="roomName">디럭스</h3>
                <p>모던하면서 아늑한 인테리어가 돋보이는 객실</p>
                <div class="roomInfo-all">
                    <div class="roomInfo-img">
                        <img src="images/room-디럭스.jfif" alt="디럭스 객실 사진">
                    </div>
                    <div class="roomInfo-parah">
                        <h3>디럭스 포레스트</h3>
                        <table>
                            <tr><td>인원</td><td>2명</td></tr>
                            <tr><td>침대</td><td>더블, 트윈</td></tr>
                            <tr><td>건물</td><td>본관, 신관</td></tr>
                        </table>
                        <p>상세보기</p>
                    </div>
                </div>
            </div>
            <div class="roomInfo">
                <h3 class="roomName">패밀리</h3>
                <p>편안한 분위기의 침실과 우아한 감성의 거실</p>
                <div class="roomInfo-all">
                    <div class="roomInfo-img">
                        <img src="images/room-프리미어.jfif" alt="프리미어 객실 사진">
                    </div>
                    <div class="roomInfo-parah">
                        <h3>프리미어 포레스트</h3>
                        <table>
                            <tr><td>인원</td><td>2명</td></tr>
                            <tr><td>침대</td><td>더블, 트윈</td></tr>
                            <tr><td>건물</td><td>본관, 신관</td></tr>
                        </table>
                        <p>상세보기</p>
                    </div>
                </div>
            </div>
            <div class="roomInfo">
                <h3 class="roomName">스위트</h3>
                <p>편안한 침실과 안락한 거실이 분리되어 있는 객실</p>
                <div class="roomInfo-all">
                    <div class="roomInfo-img">
                        <img src="images/room-스위트.jfif" alt="스위트 객실 사진">
                    </div>
                    <div class="roomInfo-parah">
                        <h3>럭셔리 포레스트</h3>
                        <table>
                            <tr><td>인원</td><td>4명</td></tr>
                            <tr><td>침대</td><td>더블1 & 트윈2</td></tr>
                            <tr><td>건물</td><td>본관, 신관</td></tr>
                        </table>
                        <p>상세보기</p>
                    </div>
                </div>
            </div>
        </div>
        <!--컨텐츠 영역 종료-->

        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>