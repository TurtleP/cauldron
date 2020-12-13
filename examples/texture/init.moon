PATH = (...)\gsub('%.init$', '')
filepath = PATH\gsub("%.", "/")

class Example

    [[
        This example shows how to render a Texture (image) to the screen.
        It also animates it!
    ]]

    new: =>
        @texture = love.graphics.newImage("#{filepath}/jam.png")

        @quads = {}
        for i = 1, 2
            table.insert(@quads, love.graphics.newQuad((i - 1) * 240, 0, 240, 240, @texture))

        @timer = 0
        @quadIndex = 1

    update: (dt) =>
        @timer += 14 * dt
        @quadIndex = math.floor(@timer % #@quads) + 1

    draw: =>
        w, h = love.graphics.getDimensions!
        love.graphics.draw(@texture, @quads[@quadIndex], (w - 240) / 2, (h - @texture\getHeight!) / 2)

    gamepadpressed: (button) =>
        if button == "start"
            love.load!