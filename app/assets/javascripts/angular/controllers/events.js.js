// Generated by CoffeeScript 1.6.2
(function() {
  this.EventCtrl = [
    "$scope", "$filter", "Event", "socket", function($scope, $filter, Event, socket) {
      $scope.events = Event.query();
      $scope.data = new Date();
      $scope.newEvent = {};
      $scope.editEvent = {};
      socket.on('notify', function(data) {
        $scope.notify = data;
        $('#black').fadeIn(500);
        return $('#notify').slideDown(500);
      });
      $scope.createEvent = function() {
        var event;

        event = Event.save($scope.newEvent);
        socket.emit('notify', event);
        $scope.events.push(event);
        return $scope.newEvent = {};
      };
      $scope.showEvent = function(event, $index) {
        return $scope.editEvent = Event.get({
          id: event._id
        });
      };
      $scope.updateEvent = function() {
        $scope.editEvent.$update({
          id: $scope.editEvent._id
        });
        socket.emit('notify', $scope.editEvent);
        return $scope.events = Event.query();
      };
      $scope.deleteEvent = function(event, $index) {
        Event["delete"]({
          id: event._id
        });
        return $scope.events.splice($index, 1);
      };
      return $scope.newDate = function() {
        $scope.newEvent.time = new Date();
        return $scope.month = $scope.newEvent.time.getMonth();
      };
    }
  ];

}).call(this);
