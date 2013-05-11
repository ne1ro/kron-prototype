# Define AngularJS app
@app = angular.module("Kron", ["ngResource"])

# Resources
app.factory "Event" , ["$resource", ($resource) ->
  $resource("/events/:id", {id: '@id'}, {update: {method: "PUT"}})
]