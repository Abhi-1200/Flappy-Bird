PipePair = Class{}
PIPE_DIFFERENCE = 90
function PipePair:init(y)
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.pipepairtable = {
        ['top'] = Pipe('top',self.y),
        ['bottom'] = Pipe('bottom',self.y+PIPE_DIFFERENCE)
    }
    self.dx = 60
    self.remove = false
    self.scored = false 
end
function PipePair:update(dt)
    if self.x < -PIPE_IMG:getWidth() then
        self.remove = true
    else
        self.pipepairtable['top'].x = self.pipepairtable['top'].x - self.dx*dt
        self.pipepairtable['bottom'].x = self.pipepairtable['bottom'].x - self.dx*dt
        self.x = self.x- self.dx*dt
    end 
end
function PipePair:render()
    for k,pipe in pairs(self.pipepairtable) do
        pipe:render()
    end
end