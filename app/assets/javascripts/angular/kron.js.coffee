# Define AngularJS app
@app = angular.module("Kron", ["ngResource", "Filters", "Directives"])

$(document).on('ready page:load', ->
  angular.bootstrap(document, ['Kron'])
)

# Resources
app.factory "Event" , ["$resource", ($resource) ->
  $resource("/users/:usernick/events/:id", {usernick: '@usernick', id: '@id'}, {update: {method: "PUT"}})
]

# Socket.io
app.factory "socket", ($rootScope) ->
  socket = io.connect('http://localhost:8000')
