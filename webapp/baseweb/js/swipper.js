
  var Mainswiper = new Swiper(".MainSwiper", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 3500,
      disableOnInteraction: false
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev"
    }
  });

  var roomname = ["디럭스", "프리미어", "스위트"];
  var swiper = new Swiper(".RoomSwiper", {
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      renderBullet: function (index, className) {
        return (
          '<span class="' + className + '">' + roomname[index] + "</span>"
        );
      }
    }
  });

  var roomname = ["야외풀", "사우나", "스파", "피트니스"];
  var swiper = new Swiper(".facilitySwiper", {
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      renderBullet: function (index, className) {
        return (
          '<span class="' + className + '">' + roomname[index] + "</span>"
        );
      }
    }
  });
