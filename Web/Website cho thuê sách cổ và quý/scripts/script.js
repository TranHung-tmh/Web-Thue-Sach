/* swiper - reponsive + arrow */
var swiper = new Swiper(".slide-content", {
  slidesPerView: 3,
  spaceBetween: 25,
  centerSlide: 'true',
  fade: true,
  loop: true,
  grabCursor:'true',
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
    dynamicBullets: true,
  },
  navigation: {
      nextE1: ".swiper-button-next",
      prevE1: ".swiper-button-prev",
  },
  breakpoints:{
      0:{
          slidesPerView: 1,
      },
      520:{
          slidesPerView: 2,
      },
      950:{
          slidesPerView: 3,
      },
  },
}); 
/* side bar menu  */
function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.querySelector(".openbtn").style.display = "none"

}
function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.querySelector(".openbtn").style.display = "flex";
}
  

/* slider carousel - thời gian chuyển tiếp chop toàn bộ slide */
var myCarousel = document.querySelector('#myCarousel')
var carousel = new bootstrap.Carousel(myCarousel, {
  interval: 2000,
  wrap: false
})

