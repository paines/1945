require "player"
--require("AnAL")

local anim8 = require 'anim8'
local image, animation

function love.load()
	--love.graphics.setBackgroundColor(255, 255, 255)
	--Loading classes
	
	groundlevel = 500
	gravity = 900
	
	player.load()	
    --local img  = love.graphics.newImage("explosion.png")

    --anim = newAnimation(img, 96, 96, 0.1, 0)	
	

    
	image = love.graphics.newImage('1945.png')
    local g = anim8.newGrid(32, 32, image:getWidth(), image:getHeight())
	animation = anim8.newAnimation(g('1-8',1), 0.1)
end

function love.update(dt)
	UPDATE_PLAYER(dt)
	animation:update(dt)	
end

function love.draw()
	DRAW_PLAYER()
	animation:draw(image, 100, 200)
end