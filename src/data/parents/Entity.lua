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

Entity = {}
Entity.__index = Entity

--Called once when the class is loaded by the engine.
function Entity.init(this) 
	
end

--Calles on the bject creation of the class. Here you define/initiate the class.
function Entity.new(args) 
	--===== gameObject definition =====--
	args = args or {} 
	
	args.sizeX = args.sizeX or global.conf.blockSize
	args.sizeY = args.sizeY or global.conf.blockSize / 2
	
	table.insert(args.components, {
		"BoxCollider",
		sx = args.sizeX,
		sy = args.sizeY,
	})
	table.insert(args.components, {
		"RigidBody",
		mass = 1,
		gravity = 10,
	})

	--===== construct object =====--
	local this = global.newGameObject(args)
	this = setmetatable(this, Entity) 

	--===== variables =====--
	this.looksToLeft = false

	--===== custom functions =====--
	this.turn = function(this, toLeft)
		local tmpTexture = nil
		if toLeft then
			this.looksToLeft = true
			tmpTexture = this.texture.left
		else
			this.looksToLeft = false
			tmpTexture = this.texture.right
		end
		if tmpTexture ~= nil then
			for _, s in pairs(this.gameObject:getSprites()) do
				s:clear(global.backgroundColor)
				s:changeTexture(tmpTexture)
			end
		end
	end
	
	return this
end

return Entity