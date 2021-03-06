class Menu

    new: =>
        @examples = {}

        items = love.filesystem.getDirectoryItems("examples")
        for item in *items
            prettyName = item\sub(1, 1)\upper! .. item\sub(2)
            table.insert(@examples, {require("examples.#{item}"), prettyName})

        @currentExample = nil
        @currentIndex = 1

        love.graphics.setNewFont("assets/hack.ttf", 14)


    update: (dt) =>
        if @currentExample and @currentExample.update
            @currentExample\update(dt)

    draw: =>
        if @currentExample and @currentExample.draw
            @currentExample\draw!
        else
            for index, value in ipairs(@examples)
                fmt = index
                if index == @currentIndex
                    fmt = "* [#{index}]"
                love.graphics.print("#{fmt}: #{value[2]}", 8, 8 + (index - 1) * 16)

    gamepadpressed: (button) =>
        if @currentExample and @currentExample.gamepadpressed
            @currentExample\gamepadpressed(button)
        else
            if button == "start"
                love.event.quit!
            elseif button == "dpdown"
                @currentIndex = math.min(@currentIndex + 1, #examples)
            elseif button == "dpup"
                @currentIndex = math.max(@currentIndex - 1, 1)
            elseif button == "a"
                @currentExample = @examples[@currentIndex][1]!

return Menu