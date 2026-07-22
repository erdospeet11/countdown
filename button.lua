local Button = {}
Button.__index = Button

function Button.new(x, y, width, height, text, onClick)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
    self.onClick = onClick
    return self
end

function Button:contains(mx, my)
    return mx >= self.x and mx <= self.x + self.width
       and my >= self.y and my <= self.y + self.height
end

function Button:isHovered()
    local mx, my = love.mouse.getPosition()
    return self:contains(mx, my)
end

function Button:click()
    if self.onClick then
        self.onClick()
    end
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
