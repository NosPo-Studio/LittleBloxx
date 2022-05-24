--Setting in here are overwriting the nosGaConf settings.

local conf = {
	texturePack = "default",
	
	particles = 0,
	
	uiForegroundColor = 0xaaaaaa,
	uiBackgroundColor = 0x666666,
	
	saveGame = "saveGame.lua",

	blockSize = 8, --have to be a even number
	
	colors = {
		button = {
			0x333333, 0x888888, 0x777777, 0xaaaaaa,
		},
		background = {0x777777, 0xaaaaaa,},
	}
}

return conf