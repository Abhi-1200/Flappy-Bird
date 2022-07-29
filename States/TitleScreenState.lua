TitleScreenState = Class{__includes = BaseState}
function TitleScreenState:update(dt)
    if keyinput['enter'] == true or keyinput['return'] == true then
        gStatetable:change('countdown')
    end
end
function TitleScreenState:render()
    love.graphics.setFont(flappy)
    love.graphics.printf('Flappy Bird',0,64,VIRTUAL_WIDTH,'center')
    love.graphics.setFont(medium)
    love.graphics.printf('Press enter to start',0,100,VIRTUAL_WIDTH,'center')
end