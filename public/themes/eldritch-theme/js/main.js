function checkScroll() {
    let sticky_header = $('#sticky-header');
    if ($(this).scrollTop() > 200) {
        sticky_header.addClass("sticky-menu");
    } else {
        sticky_header.removeClass("sticky-menu");
    }
}

$(document).ready(function () {
    checkScroll();
    if ($(window).width() > 992) {
        $(window).scroll(function () {
            checkScroll();
        });
    }
})

