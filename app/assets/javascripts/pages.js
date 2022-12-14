// JavaScript Document
$(window).load(function(){
    jQuery(".preloader").fadeOut("slow");
});

jQuery(document).ready(function ($) {
    'use strict';

    //jQuery for page scrolling feature - requires jQuery Easing plugin
    $('.page-scroll').on('click', function (event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });

    // collapsed menu close on click
    $(document).on('click', '.navbar-collapse.in', function (e) {
        if ($(e.target).is('a')) {
            $(this).collapse('hide');
        }
    });

    // add white background to nav with scrolling
    if ($(window).scrollTop() > 50) {
        $(".sticky-navigation").addClass("NavBg");
    }
    else {
        $(".sticky-navigation").removeClass("NavBg");
    }

    $(window).scroll(function(){
        if ($(window).scrollTop() > 50) {
            $(".sticky-navigation").addClass("NavBg");
        }
        else {
            $(".sticky-navigation").removeClass("NavBg");
        }
    });
}); // end Document.ready