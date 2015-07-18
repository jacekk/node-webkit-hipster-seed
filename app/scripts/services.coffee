'use strict'

manifest = require('nw.gui').App.manifest
url = require('url')

### Sevices ###

angular.module('app.services', [])

.constant 'appConfig', {
  version:     manifest.version
  main:        manifest.main
  mainUrl:     url.parse(manifest.main, true)
  author:      manifest.author
  name:        manifest.name
  longname:    manifest.appinfo.longname
  description: manifest.description
}
