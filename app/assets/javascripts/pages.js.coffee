# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@TimeCtrl = ($scope, $timeout)->

  # Declare months and week days
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
  $scope.dayweeks = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  # Get current date
  $scope.getNow = ->
    $scope.now = new Date()
    $scope.current_month = $scope.now.getUTCMonth()
    $scope.current_year = $scope.now.getUTCFullYear()
    $scope.current_day = $scope.now.getUTCDate()
    $scope.current_date = $scope.months[$scope.current_month].month.substr(0,3) + ' ' + $scope.current_day.toString()
    $scope.current_time = $scope.now.getHours().toString() + ':' + $scope.now.getMinutes().toString()
    $scope.current_datetime = $scope.current_date + ' ' + $scope.current_time
    $scope.current_dayweek = $scope.now.getDay()
    $scope.current_weekday = $scope.dayweeks[$scope.current_weekday]
    $timeout($scope.getNow,1000)

  $timeout($scope.getNow,1000)
  
  
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
    
    

    
