player = {}

function player.load()
	player.x = 50
	player.y = 50
	player.xvel = 0
	player.yvel = 0
	player.width = 50
	player.height = 50
	player.friction = 7
	player.speed = 2250
end

function player.draw()
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function player.physics(dt)
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.yvel = player.yvel + gravity * dt
	player.xvel = player.xvel * (1-math.min(dt * player.friction,1))
end

function player.move(dt)
	if love.keyboard.isDown('right') and
		player.xvel < player.speed 
	then
			player.xvel = player.xvel + player.speed * dt
	end
			
	if love.keyboard.isDown('left') and
		player.xvel > -player.speed 
	then
			player.xvel = player.xvel - player.speed * dt
	end
end

function player.boundary()
	if player.x < 0
	then
		player.x = 0
		player.xvel = 0
	end
	
	if player.y < 0
	then
		player.y = 0
		player.yvel = 0
	end
	
	if player.y + player.height > groundlevel then
		player.y = groundlevel - player.height
		player.yvel = 0
	end
end



function UPDATE_PLAYER(dt)
	player.physics(dt)
	player.move(dt)
	--anim:update(dt)  	
end

function DRAW_PLAYER()
	--player.draw()
	player.boundary()
	--anim:draw(100, 100) 	
end