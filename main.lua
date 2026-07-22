local player = {
    x = 100,
    y = 100,
    speed = 250,
    size = 40,
    color = {0.2, 0.6, 1.0}
}

function love.load()
    love.window.setTitle("Love2D Starter Project")
    love.window.setMode(800, 600, { resizable = false, vsync = true })

    love.graphics.setBackgroundColor(0.1, 0.1, 0.12)
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
    love.graphics.setColor(player.color)
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Use WASD or Arrow Keys to move", 10, 10)
    love.graphics.print("Press ESC to exit, R to reset", 10, 30)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 570)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "r" then
        player.x = 100
        player.y = 100
    end
end
