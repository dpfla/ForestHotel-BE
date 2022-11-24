window.onload = function(){
    /* 날씨, 위치, 시간 */
    const weather = document.querySelector(".weather span:last-child");
    const time = document.querySelector(".weather span:nth-child(2)");
    const city = document.querySelector(".weather span:first-child");
    

    function onGeoOk(position) {
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;
        const API_KEY = config.API_KEY;
        const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
        fetch(url).then((response) => response.json())
            .then((data) => {
                city.innerHTML = data.name;
                let temp = Math.round(data.main.temp*10)/10;
                weather.innerText=`${data.weather[0].main}  ${temp}℃`;

                let d = new Date()
                let localTime = d.getTime()
                let localOffset = d.getTimezoneOffset() * 60000
                let utc = localTime + localOffset;
                let local = new Date(utc + (1000 * data.timezone))
                time.innerHTML = `${local.getHours()}:${local.getMinutes()}`;
            });
    }
    function onGeoErr() {
        alert("위치를 찾을 수 없습니다.");
    }
    navigator.geolocation.getCurrentPosition(onGeoOk, onGeoErr);

    /* 하위메뉴 */
    const mainMenu = document.querySelectorAll("#mainMenu > li");
    const menu = document.querySelector(".logoMenu");

    mainMenu.forEach((mainmenu) => {
        mainmenu.addEventListener("mouseover", function () {
            menu.style.height = "95px";
            this.querySelector(".underMenu").style.display = "block";
            this.querySelector(".underMenu").style.zIndex = "9999";
        })
        mainmenu.addEventListener("mouseout", function () {
            menu.style.height = "60px";
            this.querySelector(".underMenu").style.display = "none";
            this.querySelector(".underMenu").style.zIndex = "0";
        });
    });

    /* 스크롤 */
    window.addEventListener("scroll", function() {
        document.querySelector("header").style.left = -1*window.scrollX + "px";
    });
    
    /* 로그인 폼 */
    const loginForm = document.querySelector("header .loginForm");
    const li = document.querySelector("header #loginClick");
    const animateHide = [
        {color: "rgba(255, 255, 255, 1)"}, 
        {color: "rgba(255, 255, 255, 0)"}
    ];
    const animateblockShow = [
        {color: "rgba(255, 255, 255, 0)"}, 
        {color: "rgba(255, 255, 255, 1)", backgroundColor: "rgb(29, 90, 32)"}
    ];
    const animatenoneShow = [
        {color: "rgba(255, 255, 255, 0)"}, 
        {color: "rgba(255, 255, 255, 1)", backgroundColor: "rgb(0, 0, 0)"}
    ];
    const animateTiming = {duration: 200, iterations: 1};
    if(li){
	    li.addEventListener("click", function() {
	        if(loginForm.style.display === "none" || loginForm.style.display === ""){
	            
	
	            li.animate(animateHide, animateTiming);
	            setTimeout(function() {
	                li.innerText = "창닫기";
	            }, 100);
	            li.animate(animateblockShow, animateTiming);
	            setTimeout(function() {
	                li.style.color = "rgba(255, 255, 255, 1)";
	                li.style.backgroundColor = "rgb(29, 90, 32)";
	                loginForm.style.display = "block";
	            }, 200);
	            
	        } else if(loginForm.style.display === "block"){
	            
	
	            li.animate(animateHide, animateTiming);
	            setTimeout(function() {
	                li.innerText = "로그인";
	            }, 100);
	            li.animate(animatenoneShow, animateTiming);
	            setTimeout(function() {
	                li.style.color = "rgba(255, 255, 255, 1)";
	                li.style.backgroundColor = "rgb(0, 0, 0)";
	                loginForm.style.display = "none";
	            }, 200);
	        }
	    });
	}
}