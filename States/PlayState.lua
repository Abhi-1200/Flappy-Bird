PlayState = Class{__includes = BaseState}
function PlayState:init()
    self.last_y = 100
    self.timer = 0
    self.pairstable = {}
    self.bird = Bird()
    self.score = 0
    self.pause = false
end
function PlayState:update(dt)
    if keyinput['enter'] == true or keyinput['return'] == true then
        if self.pause == true then
            self.pause = false
        else
            self.pause = true
        end
    end
    if self.pause == false then
        self.timer = self.timer + dt
        if self.timer > 2 then
            y = math.max(50,math.min(self.last_y + math.random(-30,30),VIRTUAL_HEIGHT-130))
            table.insert(self.pairstable,PipePair(y))
            self.timer = 0
            self.last_y = y
        end
        if keyinput['enter'] == true or keyinput['return'] == true then
            gStatetable:change('pause')
        end
        for k,pair in pairs(self.pairstable) do
            pair:update(dt)
            for l,pipe in pairs(pair.pipepairtable) do
                if Collision:collides(self.bird,pipe) then
                    sounds['explosion']:play()
                    sounds['hurt']:play()
                    gStatetable:change('score',{score = self.score})
                end
            end
            if not pair.scored then
                if pair.x + PIPE_IMG:getWidth() < self.bird.x then
                    self.score = self.score + 1
                    sounds['score']:play()
                    pair.scored = true
                end
            end
            if pair.remove then
                table.remove(self.pairstable,k)
            end
        end
        self.bird:update(dt)
        if self.bird.y > VIRTUAL_HEIGHT-15 then
            sounds['explosion']:play()
            sounds['hurt']:play()
            gStatetable:change('score',{score = self.score})
        end
    end
end
function PlayState:render()
    if self.pause == false then
        self.bird:render()
        for k,pair in pairs(self.pairstable) do
            pair:render()
        end
        love.graphics.setFont(medium)
        love.graphics.print('Score : '..tostring(self.score),8,8)
    end
    if self.pause == true then
        love.graphics.setFont(flappy)
        love.graphics.printf('PAUSE',0,40,VIRTUAL_WIDTH,'center')
        love.graphics.printf('Press ENTER To Play :)',0,80,VIRTUAL_WIDTH,'center')
    end
end