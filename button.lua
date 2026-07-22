local Button = {}
Button.__index = Button

function Button.new(x, y, width, height, text)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
    return self
end

function Button:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(0, 0, 0)

    local font = love.graphics.getFont()
    local tw = font:getWidth(self.text)
    local th = font:getHeight()

    love.graphics.print(self.text, self.x + (self.width - tw) / 2, self.y + (self.height - th) / 2)
end

return Button
