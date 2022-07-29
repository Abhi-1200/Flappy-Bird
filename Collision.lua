Collision = Class{}
function Collision:collides(bird,pipe)
    if pipe.orientation == 'top' then
        if bird.x-2 <= pipe.x + pipe.width and bird.x-2+bird.width+4 >= pipe.x and bird.y + 2 < pipe.y then
            return true
        end
    else
        if bird.x-2 <= pipe.x + pipe.width and bird.x-2+bird.width+4 >= pipe.x and bird.y + 2+bird.height-4 > pipe.y then
            return true
        end
    end
end