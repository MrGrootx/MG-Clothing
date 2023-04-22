Config = {
	Language = "en",					
	ExtrasEnabled = true,				
	Debug = false,						
	GUI = {
		Position = {x = 0.65, y = 0.7},	
		AllowInCars = true,			
		AllowWhenRagdolled = false,			
		Enabled = true, 				
		Key = GetKey("Y"), 			
		Sound = true,					
		TextColor = {255,255,255},
		TextOutline = true,
		TextFont = 1,					
		TextSize = 0.21,				
		Toggle = false,					
	}
}


Config.Commands = {
	[Lang("TOP")] = {
		Func = function() ToggleClothing("Top") end,
		Sprite = "top",
		Desc = Lang("Top2"),
		Button = 1,
		Name = Lang("Top")
	},
	[Lang("GLOVES")] = {
		Func = function() ToggleClothing("Gloves") end,
		Sprite = "gloves",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Gloves"))),
		Button = 2,
		Name = Lang("Gloves")
	},
	[Lang("VISOR")] = {
		Func = function() ToggleProps("Visor") end,
		Sprite = "visor",
		Desc = Lang("Visor2"),
		Button = 3,
		Name = Lang("Visor")
	},
	[Lang("BAG")] = {
		Func = function() ToggleClothing("Bag") end,
		Sprite = "bag",
		Desc = Lang("Bag2"),
		Button = 8,
		Name = Lang("Bag")
	},
	[Lang("SHOES")] = {
		Func = function() ToggleClothing("Shoes") end,
		Sprite = "shoes",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Shoes"))),
		Button = 5,
		Name = Lang("Shoes")
	},
	[Lang("VEST")] = {
		Func = function() ToggleClothing("Vest") end,
		Sprite = "vest",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Vest"))),
		Button = 14,
		Name = Lang("Vest")
	},
	[Lang("HAIR")] = {
		Func = function() ToggleClothing("Hair") end,
		Sprite = "hair",
		Desc = Lang("Hair2"),
		Button = 7,
		Name = Lang("Hair")
	},
	[Lang("HAT")] = {
		Func = function() ToggleProps("Hat") end,
		Sprite = "hat",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Hat"))),
		Button = 4,
		Name = Lang("Hat")
	},
	[Lang("GLASSES")] = {
		Func = function() ToggleProps("Glasses") end,
		Sprite = "glasses",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Glasses"))),
		Button = 9,
		Name = Lang("Glasses")
	},
	[Lang("EAR")] = {
		Func = function() ToggleProps("Ear") end,
		Sprite = "ear",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Ear2"))),
		Button = 10,
		Name = Lang("Ear")
	},
	[Lang("NECK")] = {
		Func = function() ToggleClothing("Neck") end,
		Sprite = "neck",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Neck2"))),
		Button = 11,
		Name = Lang("Neck")
	},
	[Lang("WATCH")] = {
		Func = function() ToggleProps("Watch") end,
		Sprite = "watch",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Watch"))),
		Button = 12,
		Name = Lang("Watch"),
		Rotation = 5.0
	},
	[Lang("BRACELET")] = {
		Func = function() ToggleProps("Bracelet") end,
		Sprite = "bracelet",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Bracelet"))),
		Button = 13,
		Name = Lang("Bracelet")
	},
	[Lang("MASK")] = {
		Func = function() ToggleClothing("Mask") end,
		Sprite = "mask",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Mask"))),
		Button = 6,
		Name = Lang("Mask")
	}
}

local Bags = {				
	[40] = true,
	[41] = true,
	[44] = true,
	[45] = true
}

Config.ExtraCommands = {
	[Lang("PANTS")] = {
		Func = function() ToggleClothing("Pants", true) end,
		Sprite = "pants",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Pants"))),
		Name = Lang("Pants"),
		OffsetX = -0.04,
		OffsetY = 0.0,
	},
	[Lang("SHIRT")] = {
		Func = function() ToggleClothing("Shirt", true) end,
		Sprite = "shirt",
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Shirt"))),
		Name = Lang("Shirt"),
		OffsetX = 0.04,
		OffsetY = 0.0,
	},
	[Lang("RESET")] = {
		Func = function() if not ResetClothing(true) then Notify(Lang("AlreadyWearing")) end end,
		Sprite = "reset",
		Desc = Lang("Reset2"),
		Name = Lang("Reset"),
		OffsetX = 0.12,
		OffsetY = 0.2,
		Rotate = true
	},
	["clothingexit"] = {
		Func = function() MenuOpened = false end,
		Sprite = "exit",
		Desc = "",
		Name = Lang("Exit"),
		OffsetX = 0.12,
		OffsetY = -0.2,
		Enabled = Config.GUI.Toggle
	},
	[Lang("BAGOFF")] = {
		Func = function() ToggleClothing("Bagoff", true) end,
		Sprite = "bagoff",
		SpriteFunc = function()
			local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
			local BagOff = LastEquipped["Bagoff"]
			if LastEquipped["Bagoff"] then
				if Bags[BagOff.Drawable] then
					return "bagoff"
				else
					return "paraoff"
				end
			end
			if Bag ~= 0 then
				if Bags[Bag] then
					return "bagoff"
				else
					return "paraoff"
				end
			else
				return false
			end
		end,
		Desc = string.format(Lang("TakeOffOn"), string.lower(Lang("Bag"))),
		Name = Lang("Bag"),
		OffsetX = -0.12,
		OffsetY = 0.2,
	},
}