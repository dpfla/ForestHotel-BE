function fn_mod_submit(){
    let myInfoForm = document.querySelector("#myInfoForm")

    
    rexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!*#?_])[A-Za-z\d@!*#?_]{8,12}$/;
    result = rexp.test(myInfoForm.password.value);
    if(!result){
        alert("규칙에 맞는 비밀번호를 입력해주세요");
        myInfoForm.password.focus();
        myInfoForm.password.value = "";
        return false;
    }

    if(myInfoForm.password.value != userPwCheck.value){
        alert("비밀번호와 확인이 일치하지 않습니다.");
        myInfoForm.password.focus();
        return false;
    }

    rexp =  /^[0-9]{11}/;
    result = rexp.test(myInfoForm.tel.value);
    if(!result){
        alert("전화번호는 숫자만 입력해주세요");
        myInfoForm.tel.focus();
        return false;
    }

    rexp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z]+\.[a-zA-Z]{2,4}(\.[a-zA-Z]{2,4}){0,2}/;
    result = rexp.test(myInfoForm.email.value);
    if(!result){
        alert("이메일을 확인해주세요");
        myInfoForm.email.focus();
        return false;
    }
    
    myInfoForm.submit();
    
}
