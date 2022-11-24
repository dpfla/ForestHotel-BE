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
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Serif+KR&family=Noto+Sans+KR:wght@400;500&family=Reem+Kufi+Fun:wght@500&display=swap" rel="stylesheet">
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
    <link rel="stylesheet" href="${contextPath }/baseweb/css/index.css">
    
	<c:if test="${msg=='addMember' }">
		<script>
			window.onload=function() {
				alert("회원을 등록했습니다");
			}	
		</script>
	</c:if>
	<c:if test="${msg=='deleteTrue' }">
		<script>
			window.onload=function() {
				alert("회원탈퇴되었습니다.");
			}	
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

        <!--스와이퍼 영역 시작-->
        <div id="MainSwiperArea">
            <div class="swiper MainSwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide slide1">
                        <img src="${contextPath }/baseweb/images/pakage-delight.jpg" alt="delight패키지 이미지">
                        <div class="info">
                            <h3>Delight Pakage</h3>
                            <p>함께하는 사람들과 야외풀에서 즐거운 시간을 가져보세요</p>
                        </div>
                    </div>
                    <div class="swiper-slide slide2">
                        <img src="${contextPath }/baseweb/images/pakage-forest.png" alt="forest패키지 이미지">
                        <div class="info">
                            <h3>Forest Pakage</h3>
                            <p>포레스트의 뷔페와 함께 로맨틱한 시간을 가져보세요</p>
                        </div>
                    </div>
                    <div class="swiper-slide slide3">
                        <img src="${contextPath }/baseweb/images/pakage-relax1.jpg" alt="relax패키지 이미지">
                        <div class="info info3">
                            <h3>Relax Pakage</h3>
                            <p>포레스트만의 특별한 스파로 편안한 시간을 가져보세요</p>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
        <!--스와이퍼 영역 종료-->

        <!--컨텐츠 영역 시작-->
        <div id="contentsArea">
            <!--객실 영역 시작-->
            <div id="roomArea">
                <h2>객실</h2>
                <div class="roomSwiperArea">
                    <div class="swiper RoomSwiper">
                        <div class="swiper-pagination"></div>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="roomImage">
                                    <img src="${contextPath }/baseweb/images/room-디럭스.jfif" alt="디럭스 룸 사진">
                                </div>
                                <div class="roomInfoParah">
                                    <p>
                                        모던하면서 아늑한 인테리어와 
                                        편안한 여유로움을 느낄 수 있는 디럭스 룸
                                    </p>
                                    <p>
                                        편안한 분위기와 세련된 실내 디자인의 디럭스 룸은 
                                        45평방미터의 공간으로 안락하고 편안한 휴식을 제공합니다.
                                    </p>
                                </div>
                            </div>
                            <div class="swiper-slide">  
                                <div class="roomInfoParah">
                                    <p>
                                        편안한 분위기의 침실과 우아한 감성의 거실이 
                                        분리되어 독립적 공간 활용이 매력적인 프리미어
                                    </p>
                                    <p>
                                        여유로운 휴식 공간을 원하는 가족단위 고객이 선호하는 객실입니다.
                                        53평방미터의 객실 공간은 Full HD TV, 캡슐 커피머신, 다양한 어메니티를 갖추고 있으며, 
                                        무료 와이파이 서비스는 호텔 투숙을 더욱 편안하게 만들어 줄 것입니다.
                                    </p>
                                </div>
                                <div class="roomImage">
                                    <img src="${contextPath }/baseweb/images/room-프리미어.jfif" alt="프리미어 룸 사진">
                                </div>  
                            </div>
                            <div class="swiper-slide">
                                <div class="roomImage">
                                    <img src="${contextPath }/baseweb/images/room-스위트.jfif" alt="스위트 룸 사진">
                                </div>
                                <div class="roomInfoParah">
                                    <p>
                                        발코니에서 더 가까이 바다를 느낄 수 있고 편안한 침실과 
                                        안락한 거실이 분리되어 품격 있는 휴식을 누릴 수 있는 스위트 룸
                                    </p>
                                    <p> 
                                        편안한 침실과 안락한 거실이 분리되어 있어 품격 있는 휴식을 누리실 수 있으며 
                                        간결하게 정돈된 우드 톤으로 본관 특유의 세련되면서도 모던한 감각이 배어 있습니다.
                                        오션-테라스 스위트는 침실과 거실 모두에 발코니가 구비되어 있어 바다를 보다 가까이서 느낄 수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--객실 영역 종료-->

            <!--이벤트 영역 시작-->
            <div id="eventArea">
                <h2>이벤트</h2>
                <p>포레스트에서 진행하는 다양한 이벤트를 소개합니다</p>
                <div class="eventInfo">
                    <div class="event">
                        <div class="eventImg">
                            <img src="${contextPath }/baseweb/images/event-BBQ.jpg" alt="글램핑 BBQ 사전 예약 이미지">
                        </div>
                        <p>그릴 X 포레스트</p>
                        <p>
                            포레스트 전경이 펼쳐지는 글램핑 공간에서
                            셀프 BBQ를 즐겨보세요
                        </p>
                    </div>
                    <div class="event">
                        <div class="eventImg">
                            <img src="${contextPath }/baseweb/images/event-진로.jpg" alt="일품 진로 이벤트 이미지">
                        </div>
                        <p>드링크 with 일품진로</p>
                        <p>
                            편안한 휴식으로 채운 한 잔의 일품진로 칵테일
                            나만의 칵테일을 만들며 여름밤을 추억하세요    
                        </p>
                    </div>
                    <div class="event">
                        <div class="eventImg">
                            <img src="${contextPath }/baseweb/images/event-goods.jpg" alt=" 예약 이미지">
                        </div>
                        <p>포레스트 컬렉션</p>
                        <p>
                            포레스트의 감성을 담아 제작한 컬렉션을
                            웹 회원 특별 프로모션으로 제공합니다
                        </p>
                    </div>
                </div>
            </div>
            <!--이벤트 영역 종료-->
        </div>
        <!--컨텐츠 영역 종료-->

        <!--푸터 영역 시작-->
        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>