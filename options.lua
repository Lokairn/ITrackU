local addonName, L = ...

ITrackU = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") 

local defaults = {
	["NightHold"] = {
		[1111] = "TEST",
	},
	["Antorus, Burning Throne"] = {
		[2076] = "Garothi",
		[2074] = "Felbounds",
	},
	["Tombe de Sargeras"] = {
	},
}

local raid_select = nil

local options = {
     name = "ITrackU",
     handler = ITrackU,
     type = 'group',
     args = {
		GeneralPanel = {
			name = "General",
			type = "group",
			order = 1,
			args = {
				HEADER_POS = {
					type = "header",
					name = "ITrackU Position"
				},
				POS_X = {
					type = "range",
					desc = "test",
					name = "Position X",
					min = -1000,
					max = 1000,
					step = 1,
					set = function(info,val)
						db_variable.POSITION_X = val
						update_main_frame_x(val)
					end,
					get = function(info) return db_variable.POSITION_X end,
				},
				POS_Y = {
					type = "range",
					desc = "test",
					name = "Position Y",
					min = -1000,
					max = 1000,
					step = 1,
					set = function(info,val)
						db_variable.POSITION_Y = val
						update_main_frame_y(val)
					end,
					get = function(info) return db_variable.POSITION_Y end,
				},
			},
		},
		ColorPanel = {
			name = "Colors",
			type = "group",
			order = 3,
			args = {
				HEADER_COLOR_TITRE = {
				type = "header",
				name = "Titre",
				order = 1,
				},
				COLOR_BACKGROUND_TITRE = {
					type = "color",
					desc = "test",
					name = "color",
					hasAlpha = true,
					order = 2,
					set = function(info, val1, val2, val3, val4)
						db_variable.COLOR_R_TITRE = val1
						db_variable.COLOR_G_TITRE = val2
						db_variable.COLOR_B_TITRE = val3
						db_variable.COLOR_A_TITRE = val4
						update_background_color_titre(val1, val2, val3, val4)
					end,
					get = function(info) return db_variable.COLOR_R_TITRE, db_variable.COLOR_G_TITRE, db_variable.COLOR_B_TITRE, db_variable.COLOR_A_TITRE end,
				},
			},
		},
		DebuffsBDD = {
			name = "Debuffs",
			type = "group",
			order = 2,
			args = {
				SELECT_RAID = {
					type = "select",
					name = "Select Raid",
					style = "dropdown",
					order = 1,
					values = function()
						local t = {}
						for k, v in pairs(defaults) do
							t[k] = k
						end
						return t
					end,
					set = function(info, val)
						raid_select = val
					end,
					get = function(key) return raid_select end,
				},
				SELECT_BOSS = {
					type = "select",
					name = "Select Boss",
					style = "dropdown",
					order = 2,
					values = function()
						local t = {}
						t[1] = "2"
						return t
					end,
				},
			},
		},
	},
}	

function ITrackU:OnInitialize()     
-- Called when the addon is loaded 
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options)     
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName)     
	self:RegisterChatCommand("ITU", "ChatCommand")     
	self:RegisterChatCommand("ITrackU", "ChatCommand")     
end 
function ITrackU:ChatCommand(input)     
	if not input or input:trim() == "" then         
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)     
	else         
	LibStub("AceConfigCmd-3.0"):HandleCommand("ITU", "ITrackU", input)     
	end 
end