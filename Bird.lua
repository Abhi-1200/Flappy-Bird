Bird = Class{}
BIRD_IMG = love.graphics.newImage('Pictures/Bird.png')
local GRAVITY = 300
function Bird:init()
    self.width = BIRD_IMG:getWidth()
    self.height = BIRD_IMG:getHeight()
    self.x = VIRTUAL_WIDTH/2 - (self.width/2)
    self.y = VIRTUAL_HEIGHT/2 - (self.height/2)
    self.dy = 0
end
function Bird:update(dt)
    if keyinput['space'] == true then
        sounds['jump']:play()
        self.dy = -150
    end
    self.dy = self.dy + GRAVITY*dt
    self.y = self.y + self.dy*dt
end
function Bird:render()
    love.graphics.draw(BIRD_IMG,self.x,self.y)
end