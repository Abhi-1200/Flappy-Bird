Pipe = Class{}
PIPE_IMG = love.graphics.newImage('Pictures/pipe.png')
function Pipe:init(orientation,y)
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.width = PIPE_IMG:getWidth()
    self.height = PIPE_IMG:getHeight()
    self.orientation = orientation
end
function Pipe:render()
    love.graphics.draw(PIPE_IMG,self.x,self.y,0,1,(self.orientation == 'top') and -1 or 1)
end