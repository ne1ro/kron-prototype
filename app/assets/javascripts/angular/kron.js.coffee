# Define AngularJS app
@app = angular.module("Kron", ["ngResource", "Filters", "Directives"])

$(document).on('ready page:load', ->
  angular.bootstrap(document, ['Kron'])
)

# Resources
app.factory "Notification", ["$resource", ($resource) ->
  $resource("/users/:uid/events/:eid/notifications/:id", {uid: '@user_id', eid: '@event_id', id: '@_id'}, {update: {method: "PUT"}})
]

app.factory "Event" , ["$resource", ($resource) ->
  $resource("/users/:uid/events/:id", {uid: '@user_id', id: '@_id'}, {update: {method: "PUT"}})
]

app.factory "User" , ["$resource", ($resource) ->
  $resource("/users/:uid", {uid: '@_id'}, {update: {method: "PUT"}})
]

# Socket.io
app.factory "socket", ($rootScope) ->
  socket = io.connect('http://localhost:8000')
