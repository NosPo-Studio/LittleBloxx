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

Stone = {}
Stone.__index = Stone

--Called once when the class is loaded by the engine.
function Stone.init(this) 
	
end

--Calles on the bject creation of the class. Here you define/initiate the class.
function Stone.new(args) 
	--===== gameObject definition =====--
	args = args or {}
    
    args.sizeX = 6
    args.sizeY = 7
	args.components = {
        {"Sprite",
            texture = global.texture.player.right,
        },
	}
	
	--===== construct object =====--
	local this = global.parent.Entity.new(args)
	this = setmetatable(this, Stone) 
	
	return this
end

return Stone