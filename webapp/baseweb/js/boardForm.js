function fn_board_submit() {
    let boardForm = document.frm_board;

    let title = boardForm.title.value.trim();
    let content = boardForm.content.value.trim();
    if(title == "" || title.length == 0){
        alert("제목을 입력해주세요");
        return false;
    }
    if(content == "" || content.length == 0){
        alert("내용을 입력해주세요");
        return false;
    }

    boardForm.submit();
}