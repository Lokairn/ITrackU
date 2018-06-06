local addonName, L = ...

ITrackU = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") 

local defaults = {
}

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
					name = "HEADER"
				},
				POS_X = {
					type = "range",
					desc = "test",
					name = "Position X",
					min = -1000,
					max = 1000,
					step = 1
					--set = db_variable.POSITION_X,
					--get = db_variable.POSITION_X
				},
				POS_Y = {
					type = "range",
					desc = "test",
					name = "Position Y",
					min = -1000,
					max = 1000,
					step = 1
					--set = db_variable.POSITION_Y,
					--get = db_variable.POSITION_Y
				},
			},
		},
		ColorPanel = {
			name = "Colors",
			type = "group",
			order = 3,
			args = {
				COLOR = {
					type = "color",
					desc = "test",
					name = "color",
				},
			},
		},
		DebuffsBDD = {
			name = "Debuffs",
			type = "group",
			order = 2,
			args = {
			
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