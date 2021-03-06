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

GameObjectsTemplate = {}
GameObjectsTemplate.__index = GameObjectsTemplate

--Called once when the class is loaded by the engine.
function GameObjectsTemplate.init(this) 
	
end


--Calles on the bject creation of the class. Here you define/initiate the class.
function GameObjectsTemplate.new(args) 
	--===== gameObject definition =====--
	--Take given GameObject args if present and prevents it from being nil if not.
	args = args or {} 
	
	args.sizeX = 6
	args.sizeY = 6
	args.components = { --Define the GameObjects components.
		{"Sprite", 
			x = 0, 
			y = 0, 
			texture = "exampleTexture",
		},
		{"Sprite", 
			x = 0, 
			y = 3, 
			texture = "exampleTexture",
		},
		{"BoxCollider",
			sx = args.sizeX,
			sy = args.sizeY,
		},

	}
	--args.deco = true
	args.internalGameObject = false
	args.physics = false
	args.solid = false
	
	--===== default stuff =====--
	--Inheritance from the GameObject main class.
	local this = global.core.GameObject.new(args) 
	
	--[[Not sure to be honest, 
		I only know that this is necessary to declare a class/create an object (.^.)
	]]
	this = setmetatable(this, GameObjectsTemplate) 
	
	--===== init =====--
	
	--===== custom functions =====--
	--[[Same as the function equevalent in the stateTemplate
		but called with the additionally conditions as "this.update()".
	]]
	this.key_down = function(this, signal) 
		
	end
	
	--[[Same as the function ctrl_... fucntion in the stateTemplate
		but called with the additionally conditions from "this.update()".
	]]
	this.ctrl_right_key_pressed = function(this, signal, sname) 
		--Addign force to move the object.
		--this:addForce(5, 0, args.maxSpeed) 
	end
	
	--[[Same as the function ctrl_... fucntion in the stateTemplate
		but called with the additionally conditions from "this.update()".
	]]
	this.ctrl_left_key_pressed = function(this, signal, sname) 
		--Addign negative force to move the object.
		--this:addForce(-5, 0, args.maxSpeed) 
	end
	
	--===== default functions =====--
	--Called when this GameObject is added to a RenderArea.
	this.start = function(this) 
		
	end
	
	--Called up to once a frame.
	this.update = function(this, dt, ra) 
	
	end
	
	--[[Called every time the GameObject is drawed. 
		That can happen multiple times a frame if the GameObject is visible in multiple RenderAreas.
	]]
	this.draw = function(this) 
	
	end
	
	--[[Called every time the GameObject graphics are removed from the screen. 
		That can happen multiple times a frame if the GameObject is visible in multiple RenderAreas.
	]]
	this.clear = function(this, acctual) 
		
	end
	
	--Called when this GameObject is removed from a RenderArea.
	this.stop = function(this) 
		
	end
	
	return this
end

return GameObjectsTemplate