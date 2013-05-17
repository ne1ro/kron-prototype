# Here is JQuery
$(document).ready ->
  # Scrolling 
  $(window).scroll ->
    if $(this).scrollTop() > 100
      $("#scroller").fadeIn(500)
    else
      $("#scroller").fadeOut(500)

    $("#scroller").click ->
      $("body,html").animate
        scrollTop: 0, 750

  # Eventboxes
  $('#eventshead .icon-plus-sign').click ->
    if $('.eventbox#new').is(':hidden')
      if $('.eventbox#edit').is(':visible')
        $('.eventbox#edit').slideUp(500)
      $('.eventbox#new').slideDown(500)

    # if $('.eventbox#edit').is(':hidden')
    #   if $('.eventbox#new').is(':visible')
    #     $('.eventbox#new').slideUp(500)
    #   $('.eventbox#edit').slideDown(500)

  $('.eventbox#new').mouseleave ->
    $('.eventbox#new').slideUp(500)

  $('.eventbox#edit').mouseleave ->
    $('.eventbox#edit').slideUp(500)
