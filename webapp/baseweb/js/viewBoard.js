function fn_hide() {
	document.querySelector(".btn_delmod").classList.add("hidden");
	document.querySelector(".btn_savecancle").classList.remove("hidden");
	document.querySelector("input[name='title']").removeAttribute("readonly");
	document.querySelector("input[name='title']").classList.add("mod");
	document.querySelector("input[name='title']").focus();
	document.querySelector(".noticeContent").removeAttribute("readonly");
	document.querySelector(".noticeContent").classList.add("mod");
}

function fn_show() {
	document.querySelector(".btn_delmod").classList.remove("hidden");
	document.querySelector(".btn_savecancle").classList.add("hidden");
	document.querySelector("input[name='title']").setAttribute("readonly", "readonly");
	document.querySelector("input[name='title']").classList.remove("mod");
	document.querySelector(".noticeContent").setAttribute("readonly", "readonly");
	document.querySelector(".noticeContent").classList.remove("mod");
}