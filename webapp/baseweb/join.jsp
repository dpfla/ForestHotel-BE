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
    <link href="https://fonts.googleapis.com/css2?family=Changa:wght@500&family=Nanum+Gothic&family=Reem+Kufi+Fun:wght@500&display=swap" rel="stylesheet">

    <!--JS-->
    <script src="js/api-key.js"></script>
    <script src="js/join.js"></script>
    <script src="js/common.js"></script>
    
    <!--스와이퍼-->
    <script src="js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <script defer src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script defer src="js/swipper.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/join.css">
    
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
            <form action="/forest/joinController" method="post" id="joinForm" name="joinForm">
                <fieldset>
                    <legend>회원정보 입력 폼</legend>
                    <div class="inputIdArea">
                        <label for="userId">아이디</label><br>
                        <input type="text" name="userId" id="userId" placeholder="영문, 숫자를 혼합하여 6자~15자">
                        <a href="#" class="userIdCheck">아이디 중복 확인</a>
                    </div>
                    <div class="inputPw">
                        <div class="inputPwArea">
                            <label for="userPw">비밀번호</label><br>
                            <input type="password" name="userPw" id="userPw" placeholder="영문, 숫자, 특수문자(@, !, *, #, ?, _) 8자~12자">
                        </div>
                        <div class="inputPwCheckArea">
                            <label for="userPwCheck">비밀번호 확인</label><br>
                            <input type="password" name="userPwCheck" id="userPwCheck">
                            <p class="pwEqualCheck"></p>
                        </div>
                    </div>
                    <div class="inputNameArea">
                        <label for="userName">이름</label><br>
                        <input type="text" name="userName" id="userName">
                    </div>
                    <div class="inputBirthArea">
                        <label for="userBirth">생년월일</label><br>
                        <input type="text" name="userBirthY" id="userBirthY" placeholder="1990">
                        <input type="text" name="userBirthM" id="userBirthM" placeholder="01">
                        <input type="text" name="userBirthD" id="userBirthD" placeholder="01">
                        <p></p>
                    </div>
                    <div class="inputTelArea">
                        <label for="userTel">전화번호</label><br>
                        <input type="tel" name="userTel" id="userTel" placeholder="숫자만 11자리">
                    </div>
                    <div class="inputInfo">
                        <div class="inputEmailArea">
                            <label for="userEmailId">이메일</label><br>
                            <input type="text" name="userEmailId" id="userEmailId" placeholder="example@forest.com">
                        </div>
                        <div class="inputReceiveArea">
                            <label for="userInforeceiveEmail" id="userInforeceive">정보 수신 여부</label><br>
                            <input type="checkbox" name="userInforeceiveEmail" id="userInforeceiveEmail" checked><label for="userInforeceiveEmail">이메일</label>
                            <input type="checkbox" name="userInforeceiveSMS" id="userInforeceiveSMS" checked><label for="userInforeceiveSMS">SMS</label>
                        </div>
                    </div> 
                    <div class="btnJoinArea">
                        <button type="submit" class="btnJoin">회원가입</button>
                        <a href="index.jsp">취소</a>
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