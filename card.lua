local Card = {}
Card._index = Card

function Card.new(name, type, image_src)
    local self = setmetatable({}, Card)
    self.name = name
    self.type = type
    self.image_src = image_src
    return self
end

function Card:getName()
    return self.name
end

function Card:getType()
    return self.type
end

function Card:draw()
    -- no implementation yet
end

return Card