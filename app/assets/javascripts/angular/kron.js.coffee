# Define AngularJS app
@app = angular.module("Kron", ["ngResource", "Filters", "Directives"])

$(document).on('ready page:load', ->
  angular.bootstrap(document, ['Kron'])
)

# Resources
app.factory "Event" , ["$resource", ($resource) ->
  $resource("/users/:uid/events/:id", {uid: '@uid', id: '@id'}, {update: {method: "PUT"}})
]

app.factory "User" , ["$resource", ($resource) ->
  $resource("/users/:uid", {uid: '@uid'}, {update: {method: "PUT"}})
]

app.factory "Notification", ["$resource", ($resource) ->
  $resource("/users/:uid/events/:eid/notifications/:id", {uid: '@uid', eid: '@eid', id: '@id'}, {update: {method: "PUT"}})
]

# Socket.io
app.factory "socket", ($rootScope) ->
  socket = io.connect('http://localhost:8000')
