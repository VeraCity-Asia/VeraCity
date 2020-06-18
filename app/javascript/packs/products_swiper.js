const swiperNoSwiping = () => {  
    console.log("swiper no swiping!")
    const swiper = new Swiper('.swiper4', {
        console.log("swiped")
        effect: 'coverflow',
        slidesPerView: 'auto',
        slidesPerView: 5,
        centeredSlides: true,
        coverflowEffect: {
            rotate: 30,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows : true,
        },
    });
}

export { swiperNoSwiping };