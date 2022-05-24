--[[
    This file is a GameObject example for the NosGa Engine.
	
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

local global = ... --Here we get global.

Block = {}
Block.__index = Block

--Called once when the class is loaded by the engine.
function Block.init(this) 
	
end

--Calles on the bject creation of the class. Here you define/initiate the class.
function Block.new(args) 
	--===== gameObject definition =====--
	args = args or {} 

	args.sizeX = args.sizeX or global.conf.blockSize
	args.sizeY = args.sizeY or global.conf.blockSize / 2

	table.insert(args.components, {
		"BoxCollider",
		sx = args.sizeX,
		sy = args.sizeY,
	})

	--===== contruct object =====--
	local this = global.newGameObject(args) 
	this = setmetatable(this, Block) 
	
	return this
end

return Block