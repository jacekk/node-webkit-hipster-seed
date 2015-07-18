'use strict'

### Controllers ###

# register the module with Angular
angular.module('app.controllers', [
  # require the 'app.service' module
  'app.services'
])

.controller('AppCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  'appConfig'

($scope, $location, $resource, $rootScope, appConfig) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  $scope.appName = appConfig.longname

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''
])

.controller('HeadCtrl', [
  '$scope'
  'appConfig'

($scope, appConfig) ->
  $scope.appTitle = appConfig.name
  $scope.appAuthor = appConfig.author
  $scope.appDescription = appConfig.description
  $scope.appVersion = appConfig.version
])

.controller('TodoCtrl', [
  '$scope'

($scope) ->

  $scope.todos = [
    text: "learn angular"
    done: true
  ,
    text: "build an angular app"
    done: false
  ]

  $scope.addTodo = ->
    $scope.todos.push
      text: $scope.todoText
      done: false

    $scope.todoText = ""

  $scope.remaining = ->
    count = 0
    angular.forEach $scope.todos, (todo) ->
      count += (if todo.done then 0 else 1)

    count

  $scope.archive = ->
    oldTodos = $scope.todos
    $scope.todos = []
    angular.forEach oldTodos, (todo) ->
      $scope.todos.push todo  unless todo.done

])
