p = require 'push'
Class = require 'class'
require 'Bird'
require 'Pipe'
require 'PipePair'
require 'StateMachine'
require 'States/BaseState'
require 'States/TitleScreenState'
require 'States/PlayState'
require 'States/ScoreState'
require 'States/CountdownState'
require 'Collision'
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288
bgi = love.graphics.newImage('Pictures/background.png')
gi = love.graphics.newImage('Pictures/ground.png')
bgi_start = -1
gi_start = -1
bgi_speed = 30
gi_speed = 60
function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')
    love.window.setTitle('Floppy Bird')
    math.randomseed(os.time())
    small = love.graphics.newFont('Fonts/font.ttf',8)
    medium = love.graphics.newFont('Fonts/flappy.ttf',14)
    flappy = love.graphics.newFont('Fonts/flappy.ttf',28)
    thiccfont = love.graphics.newFont('Fonts/flappy.ttf',52)
    sounds = {
        ['jump'] = love.audio.newSource('Sounds/jump.wav','static'),
        ['hurt'] = love.audio.newSource('Sounds/hurt.wav','static'),
        ['explosion'] = love.audio.newSource('Sounds/explosion.wav','static'),
        ['score'] = love.audio.newSource('Sounds/score.wav','static'),
        -- https://freesound.org/people/xsgianni/sounds/388079/
        ['mario_way'] = love.audio.newSource('Sounds/marios_way.mp3','static'),
    }
    sounds['mario_way']:setLooping(true)
    sounds['mario_way']:play()
    keyinput = {}
    gStatetable = StateMachine{
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function()
            P1 = PlayState()
            return  P1
            end,
        ['score'] = function() return ScoreState() end,
        ['countdown'] = function() return CountdownState() end,
    }
    p:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{fullscreen = false,vsync= true,resizable = true})
    gStatetable:change('title')
end
function love.resize(w,h)
    p:resize(w,h)
end
function love.update(dt)
    bgi_start = bgi_start < -413 and -1 or bgi_start - bgi_speed*dt
    gi_start = gi_start < -413 and -1 or gi_start - gi_speed*dt
    gStatetable:update(dt)
    keyinput = {}
end
function love.keypressed(key)
    keyinput[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end
function love.draw()
    p:start()
    love.graphics.draw(bgi,bgi_start,0)
    gStatetable:render()
    love.graphics.draw(gi,gi_start,VIRTUAL_HEIGHT-16)
    p:finish()
end