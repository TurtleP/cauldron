rand = love.math.random

class Example
    [[
        This example will create a Canvas object with a specific width and height.
        If either dimension is not provided, it uses the screen size.
        When the user presses 'a', it'll toggle a Scissor on the screen viewport.
        When the user presses 'b', it'll toggle drawing the Canvas.
    ]]

    new: (w, h) =>
        w = love.graphics.getWidth! if not w
        h = love.graphics.getHeight! if not h

        @canvas = love.graphics.newCanvas(w, h)

        rectWidth, rectHeight = (w * 0.25), (h * 0.25)
        rect =
            x: (w - rectWidth) * 0.5
            y: (h - rectHeight) * 0.5
            w: rectWidth
            h: rectHeight

        @canvas\renderTo(() ->
            love.graphics.clear(rand!, rand!, rand!)
            love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
        )

        @scissor = false
        @scissorBox = {w * 0.25, h * 0.25, w * 0.50, h * 0.50}

        @drawCanvas = true

    draw: =>
        if @scissor
            love.graphics.setScissor(unpack(@scissorBox))

        if @drawCanvas
            love.graphics.draw(@canvas)

        if @scissor
            love.graphics.setScissor()

    gamepadpressed: (button) =>
        if button == "a"
            @scissor = not @scissor
        elseif button == "b"
            @drawCanvas = not @drawCanvas
        elseif button == "start"
            love.load!

return Example