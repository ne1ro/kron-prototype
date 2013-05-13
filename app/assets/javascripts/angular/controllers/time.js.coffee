# Controlling time
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
    
