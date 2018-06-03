local addonName, L = ...

ITrackU = LibStub("AceAddon-3.0"):NewAddon("ITrackU", "AceConsole-3.0") 

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
				WIDTH_GLOBAL = {
					type = "range",
					desc = "test",
					name = "range",
					min = 100,
					max = 300,
					step = 1
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
    LibStub("AceConfig-3.0"):RegisterOptionsTable("ITrackU", options)     
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ITrackU", "ITrackU")     
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