'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'app.templates'
])

App.config([
  '$routeProvider'
  '$locationProvider'
  '$compileProvider'

($routeProvider, $locationProvider, $compileProvider, config) ->

  $routeProvider

    .when('/todo',  { templateUrl: 'app/templates/todo.jade' })
    .when('/view1', { templateUrl: 'app/templates/partial1.jade' })
    .when('/view2', { templateUrl: 'app/templates/partial2.jade' })

    # Catch all
    .otherwise({redirectTo: '/todo'})

  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|file|nw|app):/)

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false).hashPrefix('!')
])
