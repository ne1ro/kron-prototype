# Define AngularJS app
@app = angular.module("Kron", ["ngResource", "Filters"])

# Resources
app.factory "Event" , ["$resource", ($resource) ->
  $resource("/events/:id", {id: '@id'}, {update: {method: "PUT"}})
]

# Calendar
app.factory "Calendar", ->
  wDay = null