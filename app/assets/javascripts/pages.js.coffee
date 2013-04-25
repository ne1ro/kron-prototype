# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@TimeCtrl = ($scope)->
  # Declare months
  $scope.months = [
    {month : "January"}
    {month : "February"}
    {month : "March"}
    {month : "April"}
    {month : "May"}
    {month : "June"}
    {month : "July"}
    {month : "August"}
    {month : "September"}
    {month : "October"}
    {month : "November"}
    {month : "December"}
    ]
  $scope.current_month = 3
  $scope.current_year = 2013

  # Decrementation month by one
  $scope.decMonth = ->
    if $scope.current_month > 0
      $scope.current_month -= 1
    else
      $scope.current_month = 11

  # Incrementation month by one
  $scope.incMonth = ->
    if $scope.current_month < 11
      $scope.current_month += 1
    else 
      $scope.current_month = 0

  # Decrementation year by one
  $scope.decYear = ->
    $scope.current_year -= 1
  # Incrementation month by one
  $scope.incYear = ->
    $scope.current_year += 1
    
    

    
