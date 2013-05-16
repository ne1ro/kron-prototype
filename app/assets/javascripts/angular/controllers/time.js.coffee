# Controlling time
@TimeCtrl = ($scope, $timeout, Calendar)->

  # Declare months and week days
  $scope.wdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  # Get current date
  $scope.getNow = ->
    $scope.now = new Date()
    $timeout($scope.getNow,1000)
    $scope.isScroll = if document.height > window.innerHeight then true else false

  $timeout($scope.getNow,1000)
  
  # Get calendar
  $scope.calendar = Calendar
  $scope.shapshot = new Date()
  $scope.time = $scope.shapshot
  $scope.current_month = $scope.time.getMonth()
  $scope.current_year = $scope.time.getFullYear()
  $scope.current_date = $scope.time.getDate()

  # Incrementation and decrementation for years and months
  $scope.incMonth = ->  
    if $scope.current_month < 11
      $scope.current_month += 1
    else
      $scope.current_month = 0
      $scope.current_year += 1
    $scope.time.setFullYear($scope.current_year, $scope.current_month)
    $scope.daysInMonth()

  $scope.decMonth = ->
    if $scope.current_month > 0
      $scope.current_month -= 1
      $scope.time.setMonth($scope.current_month)
    else
      $scope.current_month = 11
      $scope.current_year -= 1
    $scope.time.setFullYear($scope.current_year, $scope.current_month)
    $scope.daysInMonth()

  $scope.incYear = ->
    $scope.current_year +=1
    $scope.time.setFullYear($scope.current_year)
    $scope.daysInMonth()

  $scope.decYear = ->
    if $scope.current_year > 0
      $scope.current_year -= 1
      $scope.time.setFullYear($scope.current_year)
      $scope.daysInMonth()

   # Get days in current month
  $scope.daysInMonth = ->
    $scope.days = []
    $scope.prevDays = []
    $scope.nextDays = []

    last = new Date($scope.current_year, $scope.current_month+1, 0)
    lastDay = last.getDate()
    firstDay = new Date($scope.current_year, $scope.current_month, 1).getDay()
    prevLastDay = new Date($scope.current_year, $scope.current_month, 0).getDate()

    # Get previous days
    for day in [prevLastDay-firstDay+1 .. prevLastDay]
      $scope.prevDays.push day

    # Get currrent month days
    for day in [1..lastDay]
      $scope.days.push day

    # Get next month days
    for day in [1..6-last.getDay()]
      $scope.nextDays.push day

  # Set current month and year
  $scope.setToday = ->
    $scope.time.setFullYear($scope.now.getFullYear(), $scope.now.getMonth(), $scope.now.getDate())
    $scope.current_month = $scope.time.getMonth()
    $scope.current_year = $scope.time.getFullYear()
    $scope.daysInMonth()
      
  $scope.daysInMonth()   