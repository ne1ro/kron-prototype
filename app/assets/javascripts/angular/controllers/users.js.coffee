# Users controller
@UsersCtrl = ($scope, User) ->
  $scope.users = User.query()