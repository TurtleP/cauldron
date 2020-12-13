instance = require("menu")
menu     = nil

love.load = ->
    menu = instance!

love.update = (dt) ->
    menu\update(dt)

love.draw = (screen) ->
    return if screen and screen == "bottom"
    menu\draw!

love.gamepadpressed = (joy, button) ->
    menu\gamepadpressed(button)

love.gamepadreleased = (joy, button) ->
    return

love.gamepadaxis = (joy, axis, button) ->
    return

love.touchpressed = (id, x, y, dx, dy, pressure) ->
    return

love.touchreleased = (id, x, y, dx, dy, pressure) ->
    return

love.touchmoved = (id, x, y, dx, dy, pressure) ->
    return
