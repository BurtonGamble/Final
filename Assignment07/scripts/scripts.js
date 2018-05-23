$(function () {
    $("nav a").mouseenter(function () {
        $(this).animate({
            color: "#b86333"
        }, 400);
    });
    $("nav a").mouseleave(function () {
        $(this).animate({
            color: "#000000"
        }, 400);
    });
});