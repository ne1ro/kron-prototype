# Here is the AngularJS directives
app = angular.module("Directives", [])

# Apply JQuery to events
app.directive "event", ->
  (scope, element, attrs) ->
    # Slide eventbox
    $(element).children('.icon-edit').click ->
      if $('.eventbox#edit').is(':hidden')
        if $('.eventbox#new').is(':visible')
          $('.eventbox#new').slideUp(500)
        $('.eventbox#edit').slideDown(500)
      
    # Show description on hover
    $(element).mouseover ->
      unless $(element).children('.description').html() == ""
        $(element).children('p.description').slideDown 500
    $(element).mouseleave ->
      $(element).children('.description').slideUp 500


# Date filter
app.directive "timeFilter", (dateFilter) ->
  require: "ngModel"
  link: (scope, element, attr, ctrl) ->
    format = attr.timeFilter
    ctrl.$parsers.push (data) ->
      data

    ctrl.$formatters.push (data) ->
      dateFilter(data, format)
   

