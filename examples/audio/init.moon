PATH = (...)\gsub('%.init$', '')
filepath = PATH\gsub("%.", "/")

class Example
    [[
        This example will create a Source object that loops and plays when 'a' is pressed.
        When 'b' is pressed, the music will stop.
        It will also draw a rotating square in the center of the screen.
    ]]

    new: =>
        @audio = love.audio.newSource("#{filepath}/pants.ogg", "stream")
        @audio\setLooping(true)

        @angle = 0

        w = love.graphics.getWidth!
        h = love.graphics.getHeight!

        rectWidth  = (w * 0.25)
        rectHeight = (h * 0.25)

        @rect =
            x: (w - rectWidth) * 0.5
            y: (h - rectHeight) * 0.5
            w: rectWidth
            h: rectHeight

    update: (dt) =>
        @angle = @angle + dt * math.pi / 2
        @angle = @angle % (2 * math.pi)

    draw: =>
        width = love.graphics.getWidth!
        height = love.graphics.getHeight!

        -- rotate around the center of the screen by angle radians
        love.graphics.translate(width / 2, height /2)
        love.graphics.rotate(@angle)
        love.graphics.translate(-width / 2, -height / 2)

        -- draw a white rectangle
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", (width / 2) - @rect.w / 2, (height / 2) - @rect.h / 2, @rect.w, @rect.h)

    gamepadpressed: (button) =>
        if button == "a"
            @audio\play!
        elseif button == "b"
            @audio\stop!
        elseif button == "start"
            @audio\stop!
            love.load!