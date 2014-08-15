
    define (require, exports, module) ->
      'use strict'

      require 'less!/less/main'

      Engine       = require 'famous/core/Engine'
      EventHandler = require 'famous/core/EventHandler'

      AppView      = require 'cs!./views/AppView.litcoffee'

      context      = Engine.createContext()
      eventbus     = new EventHandler()
      screensize   = [screen.width,screen.height]

      Engine.on 'resize', () ->
        _s = Context.getSize()
        eventbus.trigger 'orientation/resize', { size: _s, original: screensize }
        if _s[0] > _s[1]
          eventbus.trigger 'orientation/landscape'
        else
          eventbus.trigger 'orientation/portrait'
      # #

      appView = new AppView()
      context.add appView
