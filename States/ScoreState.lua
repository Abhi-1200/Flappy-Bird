ScoreState = Class{__includes = BaseState}
function ScoreState:enter(p)
    self.score = p.score
end
function ScoreState:update(dt)
    if keyinput['enter'] == true or keyinput['return'] == true then
        gStatetable:change('play')
    end
end
function ScoreState:render()
    love.graphics.setFont(flappy)
    love.graphics.printf('Oops You Have Lost',0,64,VIRTUAL_WIDTH,'center')
    love.graphics.setFont(medium)
    love.graphics.printf('Score: '..tostring(self.score),0,100,VIRTUAL_WIDTH,'center')
    love.graphics.printf('Press Enter To Play Again!',0,VIRTUAL_HEIGHT -150,VIRTUAL_WIDTH,'center')
end
