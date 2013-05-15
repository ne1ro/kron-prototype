# Controlling time
@TimeCtrl = ($scope, $timeout)->

  # Declare months and week days
  
  $scope.wdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  # Get current date
  $scope.getNow = ->
    $scope.now = new Date()
    $timeout($scope.getNow,1000)

  $timeout($scope.getNow,1000)
  
  # Get 
    
