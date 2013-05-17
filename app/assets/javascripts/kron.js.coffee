# Here is JQuery
$(document).ready ->
  $(window).scroll ->
      if $(this).scrollTop() > 100
        $("#scroller").fadeIn(500)
      else
        $("#scroller").fadeOut(500)

    $("#scroller").click ->
      $("body,html").animate
        scrollTop: 0, 750