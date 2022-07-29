CountdownState = Class{__includes = BaseState}
function CountdownState:init()
    self.count = 3
    self.timerr = 0
end
function CountdownState:update(dt)
    self.timerr = self.timerr + dt
    if self.timerr > 0.75 then
        self.timerr = self.timerr % 0.75
        self.count = self.count - 1
        if self.count == 0 then
            gStatetable:change('play')
        end
    end
end
function CountdownState:render()
    love.graphics.setFont(thiccfont)
    love.graphics.printf(tostring(self.count),0,VIRTUAL_HEIGHT/2 - 26,VIRTUAL_WIDTH,'center')
end