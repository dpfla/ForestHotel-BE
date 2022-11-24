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
    <link rel="shortcut" href="${contextPath }/images/forest-hotel-logo.ico">

    <!--폰트 링크-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Changa:wght@500&family=Nanum+Gothic&family=Reem+Kufi+Fun:wght@500&display=swap" rel="stylesheet">

    <!--JS-->
    <script src="${contextPath }/baseweb/js/api-key.js"></script>
    <script src="${contextPath }/baseweb/js/common.js"></script>
    <!--스와이퍼-->
    <script src="${contextPath }/baseweb/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <script defer src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script defer src="${contextPath }/baseweb/js/swipper.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="${contextPath }/baseweb/css/common.css">
    <link rel="stylesheet" href="${contextPath }/baseweb/css/facilityInfo.css">
    
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
            <h2>부대시설</h2>
            <div id="facilitySwiperArea">
                <div class="swiper facilitySwiper">
                    <div class="swiper-pagination"></div>
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="facilityInfoParahImg">
                                <img src="${contextPath }/baseweb/images/facility-수영장.jpg" alt="야외풀사진">
                            </div>
                            <div class="facilityInfoParah">
                                <h3>야외 풀</h3>
                                <p>하늘 위의 작은 바다, 야외 오션스파 풀</p>
                                <p>    
                                    유쾌한(Delightful) 오후, 호텔 위 바다 한 채가 둥실 떠있는 느낌의 야외 오션스파 풀입니다. <br>
                                    이 곳에서는 휴양지 특유의 유쾌한 분위기와 바다의 낭만이 열두 달 내내 흐릅니다.<br>
                                    아득한 바다와 여유롭게 맞닿아있는 인피니티 스파 풀, 해변의 시원함이 눈에 가득 담기는 선 베드 존, 
                                    눈이 펑펑 내리는 한겨울에도 맘껏 수영을 즐길 수 있는 따스함까지. <br>
                                    햇살이 쏟아지는 시간, 이국의 휴양지 느낌이 물씬 풍겨오는 매력적인 야외 오션스파 풀을 만나보세요.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="facilityInfoParahImg">
                                <img src="${contextPath }/baseweb/images/facility-사우나.jpg" alt="사우나 사진">
                            </div>
                            <div class="facilityInfoParah">
                                <h3>실내 사우나</h3>
                                <p>숲과 바다가 어우러진 자연경관, 온천수 사우나</p>
                                <p>
                                    온천수를 이용한 사우나로 수질 뿐만 아니라 바다가 한눈에 들어오는 빼어난 자연경관을 선사해드립니다.<br>
                                    옥돌베드, 자쿠지탕, 건·습식 사우나 등 다양한 시설과 세심한 서비스로 여유로운 시간을 전해드립니다.<br>
                                    남녀 사우나 모두 고급스러운 인테리어와 더불어 건강식을 선보이는 스낵 라운지를 함께 갖추고 있어 편안한 만족감을 드립니다.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="facilityInfoParahImg">
                                <img src="${contextPath }/baseweb/images/facility-스파.jpg" alt="스파 사진">
                            </div>
                            <div class="facilityInfoParah">
                                <h3>스파</h3>
                                <p>긴 여행의 쉼터, 홀리스틱 웰니스 스파</p>
                                <p>
                                    최고급 천연성분 화장품과 오리엔탈 테라피로 홀리스틱 웰니스를 제시하는 스파<br>
                                    오리지널 제품 컬렉션과 고대 인도의 지혜에서 전해진 독특한 식물성분과 
                                    현대과학의 만남으로 이루어진 압비얀가, 마르마 테라피를 선보입니다.<br>
                                    인생이란 긴 여행을 통해 균형 잡힌 마음, 몸, 정신을 소유하기 위한 라이프 스타일을 위해 
                                    탄생한 스파로 진정한 아름다움을 위한 여행을 시작해보세요.
                                </p>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="facilityInfoParahImg">
                                <img src="${contextPath }/baseweb/images/facility-피트니스.jpg" alt="피트니스 사진">
                            </div>
                            <div class="facilityInfoParah">
                                <h3>피트니스</h3>
                                <p>활기찬 하루의 시작, 피트니스</p>
                                <p>
                                    건강한 하루를 호텔에서도 유지할 수 있게 도와드립니다.<br>
                                    스포츠 과학을 토대로 개발된 최신식 시설과 전문 트레이너 및 
                                    강사들의 지도 아래 개인 맞춤 운동 프로그램으로 활기찬 라이프 스타일을 디자인 해드립니다.
                                </p>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!--컨텐츠 영역 종료-->

        <!--푸터 영역 시작-->
        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>