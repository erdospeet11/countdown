local Card = require("card")

local Hand = {}
Hand._index = Hand
setmetatable(Hand)

local cards = {}
local cardCount = 0

function Hand.new()
    if Hand._instance then
        return Hand._instance
    end

    local instance = setmetatable({}, Hand)
    if instance.ctor then
        instance:ctor()
    end

    Hand._instance = instance
    return Hand._instance
end

function Hand:addCard(card)
    cards[cardCount] = card
    cardCount = cardCount + 1
end

function Hand:getCard(index)
    return cards[index]
end

function Hand:popCard(index)
    local popped = cards[index]
    for i=index,cardCount-1,1 do
        cards[i] = cards[i+1]
    end
    cardCount = cardCount - 1
    return popped
end

return Hand