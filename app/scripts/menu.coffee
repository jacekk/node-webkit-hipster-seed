'use strict'

gui = require('nw.gui')

win = gui.Window.get()

# Create the main menubar menu
menu = new gui.Menu
  type: 'menubar'

# Add 'App' menu
itemApp = new gui.MenuItem
  type: 'normal'
  label: 'App'

itemAppQuit = new gui.MenuItem
  type: 'normal'
  label: 'Quit'
  click: ->
    gui.App.quit();

itemAppMenu = new gui.Menu
itemAppMenu.append(itemAppQuit)
itemApp.submenu = itemAppMenu

# Add 'View' menu
itemView = new gui.MenuItem
  type: 'normal'
  label: 'View'

itemViewFullscreen = new gui.MenuItem
  type: 'normal'
  label: 'Toggle Full Screen'
  key: 'f11'
  click: ->
    win.toggleFullscreen()

itemViewMenu = new gui.Menu
itemViewMenu.append(itemViewFullscreen)
itemView.submenu = itemViewMenu

# Attach all of our menu items
menu.append(itemApp)
menu.append(itemView)

# Attach our menu to the window
win.menu = menu