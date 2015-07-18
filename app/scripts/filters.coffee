'use strict'

### Filters ###

# register the module with Angular
angular.module('app.filters', [
  # require the 'app.service' module
  'app.services'
])

.filter('interpolate', [
  'appConfig',

(appConfig) ->
  keys =
    APP_VERSION:     appConfig.version
    APP_MAIN:        appConfig.main
    APP_AUTHOR:      appConfig.author
    APP_NAME:        appConfig.name
    APP_DESCRIPTION: appConfig.description
  (text) ->
    out = text
    for own key of keys
      re = new RegExp("%" + key + "%", "mg")
      out = out.replace(re, keys[key])
    return out
])
