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
    $scope.current_month = $scope.now.getMonth()
    $scope.current_year = $scope.now.getFullYear()
    $scope.current_day = $scope.now.getDate()
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
    
    
# Events controller
@EventCtrl = ($scope) ->
  $scope.events = [
    {minute : 0, hour : 7, header : 'Get up!', description : 'It`s time to wake up:)'}
    {minute : 30, hour : 7, header : 'Run', description : 'It`s time to run.'}
    {minute : 0, hour : 8, header : 'Twitter news', description : 'Read twitter news.'}
    {minute : 10, hour : 8, header : 'Learn rails', description : 'Read something new about Ruby on Rails or watch new Ruby on Rails screencast.
     Don`t forget to use rspec for tests.'}
    {minute : 50, hour : 8, header : 'Go on the bus', description : 'Go on the bus.'}
  ]

#Groups Controller
@GroupCtrl = ($scope) ->
  $scope.groups = [
    {name : 'Subscribes', users : [
      'Anonymous', 'Anon', 'Anonymouse', 'Anonymous', 'Anon' 
    ]}
    {name : 'Legion', users : [
      'Anonymous', 'Anon', 'Anonymouse', 'Anonymous', 'Anon' 
    ]}
  ]
    
