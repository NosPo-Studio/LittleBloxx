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
local firstTest = {
    devMode = true,
	pause = false,

	testBlocks = {},
}

--===== local vars =====--

--===== local functions =====--
local function print(...)
	global.log(...)
end

--===== shared functions =====--
function firstTest.init()
	--===== debug =====--
	spawnTestBlock = nil
	
	--===== debug end =====--
	
	global.load({
		toLoad = {
			gameObjects = true,
			parents = true,
			firstTestObjects = true,
			textures = true,
			animations = true,
		},
	})
end

function firstTest.start()
	global.clear()

	global.log("firsTest init start")

    if firstTest.devMode then
        firstTest.raMain = global.addRA({
			posX = 2, 
			posY = 3, 
			sizeX = global.resX -2, 
			sizeY = global.resY -4 - global.conf.consoleSizeY, 
			name = "raMain", 
			drawBorders = true,
		})
    else
        firstTest.raMain = global.addRA({
			posX = 1, 
			posY = 1, 
			sizeX = global.resX, 
			sizeY = global.resY - global.conf.consoleSizeY, 
			name = "raMain", 
			drawBorders = true,
		})
    end


	local xBlocks, yBlocks = 12, 1
	for x = 0, xBlocks * 8 - 8, 8 do
		for y = 0, yBlocks * 8 - 8, 8 do
			local gameObject = firstTest.raMain:addGO("Stone", 
				{posX = x -8, posY = y + 38}
			)
			if gameObject ~= nil then
				table.insert(firstTest.testBlocks, gameObject)
			else
				global.warn("Cant add Block")
			end
		end
	end

	table.insert(firstTest.testBlocks, firstTest.raMain:addGO("Stone", {posX = 80, posY = 34}))
	table.insert(firstTest.testBlocks, firstTest.raMain:addGO("Stone", {posX = 80, posY = 30}))
	table.insert(firstTest.testBlocks, firstTest.raMain:addGO("Stone", {posX = 80, posY = 26}))
	table.insert(firstTest.testBlocks, firstTest.raMain:addGO("Stone", {posX = 76, posY = 26}))
	table.insert(firstTest.testBlocks, firstTest.raMain:addGO("Stone", {posX = 72, posY = 26}))
	table.insert(firstTest.testBlocks, firstTest.raMain:addGO("Stone", {posX = 64, posY = 26}))

	firstTest.player = firstTest.raMain:addGO("Player", {
		posX = 20,
		posY = 26,
	})
	
	global.log("firsTest init done")
end

function firstTest.update()	
	--print("=====New frame=====")


	while firstTest.pause do
		os.sleep(.1)
		if global.keyboard.isKeyDown("z") or global.keyboard.isKeyDown(60) or global.keyboard.isKeyDown(63) or global.keyboard.isControlDown() then
			firstTest.pause = not firstTest.pause
		end
	end
end

function firstTest.draw()
	
end

function firstTest.stop()
	
end

function firstTest.ctrl_camLeft_key_pressed()
	firstTest.raMain:moveCamera(-1, 0)
end
function firstTest.ctrl_camRight_key_pressed()
	firstTest.raMain:moveCamera(1, 0)
end
function firstTest.ctrl_camLeftBlock_key_down()
	firstTest.raMain:moveCamera(-8, 0)
end
function firstTest.ctrl_camRightBlock_key_down()
	firstTest.raMain:moveCamera(8, 0)
end
function firstTest.ctrl_spawnTest_key_down()
	if firstTest.spawnTestBlock then
		firstTest.raMain:remGO(firstTest.spawnTestBlock)
		firstTest.spawnTestBlock = nil
	else
		firstTest.spawnTestBlock = firstTest.raMain:addGO("Stone", {
			posX = 0, posY = 0
		})
	end
end

return firstTest





