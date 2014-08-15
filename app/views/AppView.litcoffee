
    define (require, exports, module) ->

      View          = require 'famous/core/View'
      Surface       = require 'famous/core/Surface'
      ImageSurface  = require 'famous/surfaces/ImageSurface'
      Transform     = require 'famous/core/Transform'
      Modifier      = require 'famous/core/Modifier'
      StateModifier = require 'famous/modifiers/StateModifier'

      class AppView extends View
        constructor: (options) ->
          super options
          @_position = [0,0]
          @_createView()
          @startTracking()

        _createView: () ->
          surface = new ImageSurface
            size : [1200,true]
            content: 'http://img2.wikia.nocookie.net/__cb20130731050533/superjail/images/9/91/WPrUk7O.jpg'
            origin: [0.5,0.5]
            align: [0.5,0.5]
          positionModifier = new Modifier
            transform: () =>
              Transform.translate @_position[0], @_position[1], 0
          centerModifier = new Modifier
            origin : [0.5, 0.5]
          @add(centerModifier)
            .add(positionModifier)
            .add(surface)

        startTracking: () ->
          gy = gyro.getOrientation()
          a = gy.alpha
          b = gy.beta
          g = gy.gamma
          gyro.frequency = 16
          speed = 2.21
          gyro.startTracking (o) =>
            _a = Math.round o.alpha
            _b = Math.round o.beta
            _g = Math.round o.gamma
            da = a - _a
            db = b - _b
            dg = g - _g
            a = _a
            b = _b
            g = _g
            @_position[0] += dg*speed
            @_position[1] += db*speed

      # class
