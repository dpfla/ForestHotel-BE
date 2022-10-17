window.onload = function() {
    let joinForm = document.querySelector("#joinForm")
    let userId = document.querySelector("#userId");
    let userPw = document.querySelector("#userPw");
    let userPwCheck = document.querySelector("#userPwCheck");
    let userName = document.querySelector("#userName");
    let userBirth = document.querySelectorAll(".inputBirthArea > input");
    let userTel = document.querySelector("#userTel");
    let userEmailId = document.querySelector("#userEmailId");
    let userInforeceiveEmail = document.querySelector("#userInforeceiveEmail");
    let userInforeceiveSMS = document.querySelector("#userInforeceiveSMS");


    joinForm.onsubmit = () => {
        let rexp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
        let result = rexp.test(userId.value);
        if(!result){
            alert("영문, 숫자를 혼합하여 6자~15자");
            userId.focus();
            return false;
        }

        rexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!*#?_])[A-Za-z\d@!*#?_]{8,12}$/;
        result = rexp.test(userPw.value);
        if(!result){
            alert("규칙에 맞는 비밀번호를 입력해주세요");
            userPw.focus();
            userPw.value = "";
            return false;
        }

        if(userPw.value != userPwCheck.value){
            alert("비밀번호와 확인이 일치하지 않습니다.");
            userPw.focus();
            return false;
        }

        if(userName.value === "" || userName.value.length === 0){
            alert("이름을 입력해주세요");
            return false;
        }

        let rexpY = /^[0-9]{4}/;
        let rexpMD = /^[0-9]{1,2}/;
        let resultY = rexpY.test(userBirth[0].value);
        let resultM = rexpMD.test(userBirth[1].value);
        let resultD = rexpMD.test(userBirth[2].value);

        if(!resultY || userBirth[0].value*1 < 1850){
            alert("출생년도를 확인해주세요");
            console.log(userBirth[0].value*1 <= 1850)
            userBirth[0].focus;
            return false;
        }else if(!resultM || (userBirth[1].value*1 <1 || userBirth[1].value*1 > 12)){
            alert("출생월을 확인해주세요");
            userBirth[1].focus;
            return false;
        }else if(!resultD || (userBirth[2].value*1 <1 || userBirth[2].value*1 > 31)){
            alert("출생일을 확인해주세요");
            userBirth[2].focus;
            return false;
        }

        rexp =  /^[0-9]{11}/;
        result = rexp.test(userTel.value);
        if(!result){
            alert("전화번호는 숫자만 입력해주세요");
            userTel.focus();
            return false;
        }

        rexp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z]+\.[a-zA-Z]{2,4}(\.[a-zA-Z]{2,4}){0,2}/;
        result = rexp.test(userEmailId.value);
        if(!result){
            alert("이메일을 확인해주세요");
            userEmailId.focus();
            return false;
        }
    }
}