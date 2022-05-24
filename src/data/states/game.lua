--[[
    This file is part of the NosGa Engine.
	
	NosGa Engine Copyright (c) 2019-2020 NosPo Studio

    The NosGa Engine is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    The NosGa Engine is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with the NosGa Engine.  If not, see <https://www.gnu.org/licenses/>.
]]

local global = ...

--===== shared vars =====--
local game = {
    devMode = true,
	pause = false,
}

--===== local vars =====--

--===== local functions =====--
local function print(...)
	global.log(...)
end

--===== shared functions =====--
function game.init()
	--===== debug =====--
	
	--===== debug end =====--
	
	global.load({
		toLoad = {
			parents = true,
			gameObjects = true,
			textures = true,
			animations = true,
		},
	})
end

function game.start()
	global.clear()

    if game.devMode then
        game.raMain = global.addRA({
			posX = 2, 
			posY = 3, 
			sizeX = global.resX -2, 
			sizeY = global.resY -4 - global.conf.consoleSizeY, 
			name = "raMain", 
			drawBorders = true,
		})
    else
        game.raMain = global.addRA({
			posX = 1, 
			posY = 1, 
			sizeX = global.resX, 
			sizeY = global.resY - global.conf.consoleSizeY, 
			name = "raMain", 
			drawBorders = true,
		})
    end

	
	--===== debug =====--
	


	--===== debug end =====--
	
end

function game.update()	
	--print("=====New frame=====")


	while game.pause do
		os.sleep(.1)
		if global.keyboard.isKeyDown("z") or global.keyboard.isKeyDown(60) or global.keyboard.isKeyDown(63) or global.keyboard.isControlDown() then
			game.pause = not game.pause
		end
	end
end

function game.draw()
	
end

function game.stop()
	
end

return game





