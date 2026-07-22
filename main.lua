local Button = require("button")

local player = {
    x = 100,
    y = 100,
    speed = 250,
    size = 40,
    color = {0.2, 0.6, 1.0}
}

local end_button
local combine_button

function love.load()
    love.window.setTitle("Love2D Starter Project")
    love.window.setMode(1280, 720, { resizable = false, vsync = true })

    love.graphics.setBackgroundColor(0.1, 0.1, 0.12)

    local screen_width, screen_height = love.graphics.getDimensions()
    local bw, bh, gap, margin = 200, 50, 20, 40
    local x = screen_width - bw - margin
    local total_h = bh * 2 + gap
    local y = (screen_height - total_h) / 2

    end_button = Button.new(x, y, bw, bh, "End Turn")
    combine_button = Button.new(x, y + bh + gap, bw, bh, "Combine")
end

function love.update(dt)
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
    end
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
    end

    local screen_width, screen_height = love.graphics.getDimensions()
    player.x = math.max(0, math.min(screen_width - player.size, player.x))
    player.y = math.max(0, math.min(screen_height - player.size, player.y))
end

function love.draw()
    end_button:draw()
    combine_button:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "r" then
        player.x = 100
        player.y = 100
    end
end
