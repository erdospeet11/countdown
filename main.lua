local Button = require("button")

local buttons = {}
local hand_cursor
local arrow_cursor
local turns_left = 10

function love.load()
    love.window.setMode(1280, 720, { resizable = false, vsync = true })

    love.graphics.setBackgroundColor(0.1, 0.1, 0.12)
    hand_cursor = love.mouse.getSystemCursor("hand")
    arrow_cursor = love.mouse.getSystemCursor("arrow")

    local screen_width, screen_height = love.graphics.getDimensions()
    local bw, bh, gap, margin = 200, 50, 20, 40
    local x = screen_width - bw - margin
    local total_h = bh * 2 + gap
    local y = (screen_height - total_h) / 2

    buttons = {
        Button.new(x, y, bw, bh, "End Turn", function()
            if turns_left > 0 then
                turns_left = turns_left - 1
            end
        end),
        Button.new(x, y + bh + gap, bw, bh, "Combine", function()
            print("Combine clicked")
        end),
    }
end

function love.update(dt)
    local screen_width, screen_height = love.graphics.getDimensions()

    local hovering = false
    for _, button in ipairs(buttons) do
        if button:isHovered() then
            hovering = true
            break
        end
    end
    love.mouse.setCursor(hovering and hand_cursor or arrow_cursor)
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(turns_left .. " turn left", 20, 20)

    local objective = "- Kill the deer"
    local font = love.graphics.getFont()
    local tw = font:getWidth(objective)
    local screen_width = love.graphics.getWidth()
    love.graphics.print(objective, screen_width - tw - 20, 20)

    for _, button in ipairs(buttons) do
        button:draw()
    end
end

function love.mousepressed(x, y, button)
    if button ~= 1 then return end
    for _, btn in ipairs(buttons) do
        if btn:contains(x, y) then
            btn:click()
            break
        end
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
