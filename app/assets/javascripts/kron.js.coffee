# Here is JQuery
$(document).ready ->

  # Fix timeline
  $('#timeline').css "height", $(window).height() - $('footer').height() - $('#nav_wrap').height()
  
  $('#timeline').click ->
    if $('#timeline #times').is(':hidden')
      $('#eventside').animate 
        padding : '0 1em 0 4em'
        width : '33em'
      , 500
      $(@).animate
        width : '4em'
      , 500

      setTimeout (->
        $('#timeline #times').slideDown 500
      ), 500
      
    else
      $('#timeline #times').css "display", "none"
      $('#eventside').animate 
        width : '36em'
        padding : '0 1em 0 1em'
      , 500
      $(@).animate
        width : '1em'
      , 500

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

  $('.eventbox#new').mouseleave ->
    $('.eventbox#new').slideUp(500)

  $('.eventbox#edit').mouseleave ->
    $('.eventbox#edit').slideUp(500)
