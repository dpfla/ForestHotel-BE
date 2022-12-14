let idChResult;

function fn_idCheck(contextPath) {
		let _id = $("#id").val();
		if(_id == ""){
			alert("중복 체크할 아이디를 입력하세요");
			//서버에 넘겨주지 않기 위해 그냥 return 
			return;
		}
		
		$.ajax({
			type: "post",
			async: true,
			dataType: "text",
			url: contextPath+'/member/idCheck.do',
			data: {id: _id},
			success: function (data, textStatus) {
				let result = data.split(",");
				if(result[0] == "usable"){
					$(".inputIdArea>p").html(result[1] + "은 사용할 수 있는 ID입니다.").css("color", "blue");
					$("#idDuplication").val("idCheck");
				} else {
					$(".inputIdArea>p").html(result[1] + "은 사용할 수 없는 ID입니다.").css("color", "red");
					$("#idDuplication").val("idUncheck");
				}
			},
			error: function (data, textStatus) {
				alert("에러 발생");
			}
		});	
	}

function joinFormCheck (){
    let rexp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,15}$/;
    let result = rexp.test(document.joinForm.id.value);
    if(!result){
        alert("영문, 숫자를 혼합하여 6자~15자");
        document.joinForm.id.focus();
        return false;
    }
    
    if(document.joinForm.idDuplication.value != "idCheck"){
		alert("아이디 중복 체크를 해주세요");
		document.joinForm.id.focus();
		return false;
	}

    rexp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!*#?_])[A-Za-z\d@!*#?_]{8,12}$/;
    result = rexp.test(document.joinForm.password.value);
    if(!result){
        alert("규칙에 맞는 비밀번호를 입력해주세요");
        document.joinForm.password.focus();
        document.joinForm.password.value = "";
        return false;
    }

    if(document.joinForm.password.value != document.joinForm.userPwCheck.value){
        alert("비밀번호와 확인이 일치하지 않습니다.");
        document.joinForm.password.focus();
        return false;
    }

    if(document.joinForm.name.value === "" || document.joinForm.name.value.length === 0){
        alert("이름을 입력해주세요");
        return false;
    }

    let rexpY = /^[0-9]{4}/;
    let rexpMD = /^[0-9]{1,2}/;
    let resultY = rexpY.test(document.joinForm.birthY.value);
    let resultM = rexpMD.test(document.joinForm.birthM.value);
    let resultD = rexpMD.test(document.joinForm.birthD.value);

    if(!resultY || document.joinForm.birthY.value*1 < 1850){
        alert("출생년도를 확인해주세요");
        document.joinForm.birthY.focus;
        return false;
    }else if(!resultM || (document.joinForm.birthM.value*1 <1 || document.joinForm.birthM.value*1 > 12)){
        alert("출생월을 확인해주세요");
        document.joinForm.birthM.focus;
        return false;
    }else if(!resultD || (document.joinForm.birthD.value*1 <1 || document.joinForm.birthD.value*1 > 31)){
        alert("출생일을 확인해주세요");
        document.joinForm.birthD.focus;
        return false;
    }

    rexp =  /^[0-9]{11}/;
    result = rexp.test(document.joinForm.tel.value);
    if(!result){
        alert("전화번호는 숫자만 입력해주세요");
        document.joinForm.tel.focus();
        return false;
    }

    rexp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z]+\.[a-zA-Z]{2,4}(\.[a-zA-Z]{2,4}){0,2}/;
    result = rexp.test(document.joinForm.email.value);
    if(!result){
        alert("이메일을 확인해주세요");
        document.joinForm.email.focus();
        return false;
    }
    
    document.joinForm.submit();
}