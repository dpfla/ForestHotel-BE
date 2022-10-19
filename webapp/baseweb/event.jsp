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
    <link rel="shortcut" href="${contextPath }/baseweb/images/forest-hotel-logo.ico">

    <!--폰트 링크-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Changa:wght@500&family=Nanum+Gothic&family=Reem+Kufi+Fun:wght@500&display=swap" rel="stylesheet">

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
    <link rel="stylesheet" href="css/event.css">
    
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
            <h2>이벤트</h2>
            <div class="event-flexBox">
                <div class="event">
                    <div class="event-img">
                        <img src="images/event-BBQ.jpg" alt="글램핑 BBQ 사전 예약 이미지">
                    </div>
                    <p>
                        <span class="event-title">그릴 X 포레스트</span><br>
                        <span class="event-term">이용기간: 2022-9-30 ~ 2022-11-30</span>
                    </p>
                </div>
                <div class="event">
                    <div class="event-img">
                        <img src="images/event-진로.jpg" alt="일품 진로 이벤트 이미지">
                    </div>
                    <p>
                        <span class="event-title">스테이 앤 드링크 with 일품진로</span><br>
                        <span class="event-term">이용기간: 2022-8-31 ~ 2022-10-31</span>
                    </p>
                </div>
                <div class="event">
                    <div class="event-img">
                        <img src="images/event-goods.jpg" alt=" 예약 이미지">
                    </div>
                    <p>
                        <span class="event-title">포레스트 컬렉션</span><br>
                        <span class="event-term">이용기간: 2022-9-30 ~ 종료시까지</span>
                    </p>
                </div>
            </div>
        </div>
        <!--컨텐츠 영역 종료-->

        <!--푸터 영역 시작-->
        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>