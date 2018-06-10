local addonName, L = ...

ITrackU = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") 

---------------------------------------------------------------------------------------------------
-------------------------------------   INIT RAID DISPONIBLE   ------------------------------------
---------------------------------------------------------------------------------------------------

local raid_select = nil
local raid_boss = {}
local raid_spell = {}

local raids = {
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

---------------------------------------------------------------------------------------------------
-----------------------------------------   FUNCTION TOOLS   --------------------------------------
---------------------------------------------------------------------------------------------------

local function update_raid_boss(raid)
	boss_select = nil
  spell_select = nil
	for k,v in pairs(raid_boss) do
		raid_boss[k] = nil
	end	
	for k, v in pairs(raid_spell) do
		raid_spell[k] = nil
	end
	for k, v in pairs(raids) do
		if k == raid then
			for l, w in pairs(raids[k]) do
				raid_boss[l] = w
			end
		end
	end
end

local function update_spell_raid_boss(boss)
	for k, v in pairs(raid_spell) do
    spell_select = nil
		raid_spell[k] = nil
	end
	for k, v in pairs(debuffs_table) do
		if k == boss_select then
			for l, w in pairs(debuffs_table[k]) do
				raid_spell[l] = select(1, GetSpellInfo(l))
			end
		end
	end
end

---------------------------------------------------------------------------------------------------
---------------------------------------------   OPTIONS   -----------------------------------------
---------------------------------------------------------------------------------------------------

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
				-- POS_X = {
					-- type = "range",
					-- desc = "test",
					-- name = "Position X",
					-- min = -1000,
					-- max = 1000,
					-- step = 1,
					-- set = function(info,val)
						-- db_variable.POSITION_X = val
						-- update_main_frame_x(val)
					-- end,
					-- get = function(info) return db_variable.POSITION_X end,
				-- },
				-- POS_Y = {
					-- type = "range",
					-- desc = "test",
					-- name = "Position Y",
					-- min = -1000,
					-- max = 1000,
					-- step = 1,
					-- set = function(info,val)
						-- db_variable.POSITION_Y = val
						-- update_main_frame_y(val)
					-- end,
					-- get = function(info) return db_variable.POSITION_Y end,
				-- },
				LOCK = {
					type = "execute",
          width = "full",
					name = "Move main frame",
					func = show_lock_dialog,
			}
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
						for k, v in pairs(raids) do
							t[k] = k
						end
						return t
					end,
					set = function(info, val)
						raid_select = val
						update_raid_boss(val)
					end,
					get = function(val) return raid_select end,
				},
				SELECT_BOSS = {
					type = "select",
					name = "Select Boss",
					style = "dropdown",
					order = 2,
          hidden = function() if raid_select ~= nil then return false else return true end end,
					values = raid_boss,
					set = function(info, val)
						boss_select = val
						update_spell_raid_boss(val)
					end,
					get = function(val) return boss_select end,
				},
        ADD_SPELL = {
          type = "input",
          order = 3,
          name = "Spell to add",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          set = function(info, val)
            spell_add = val
          end,
          get = function(val) return spell_add end,
        },
        ADD_SPELL_BUTTON = {
          type = "execute",
          name = "Add Spell",
          order = 4,
          hidden = function () if spell_add ~= nil then return false else return true end end,
        },
				SELECT_SPELL = {
					type = "select",
					name = "Select Spell",
					style = "radio",
					order = 5,
					width = "full",
          hidden = function() if boss_select ~= nil then return false else return true end end,
					values = raid_spell,
					set = function(info, val)
						spell_select = val
					end,
					get = function(val) return spell_select end,
				},
        IF_ACTIVE = {
          type = "toggle",
          name = "Open if active",
          tristate = false,
          order = 6,
          width = "full",
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["IfActive"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["IfActive"] end,
        },
        TYPE = {
          type = "select",
          name = "Buff/Debuff Type",
          style = "dropdown",
          order = 7,
          values = {["Classic"] = "Classic", ["Spread"] = "Spread", ["Stack"] = "Stack"},
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["Type"] = val
            debuffs_table[boss_select][spell_select]["TypeDistance"] = nil
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["Type"] end,
        },
        TYPE_DISTANCE = {
          type = "select",
          name = "Buff/Debuff Distance",
          order = 8,
          disabled = function() if debuffs_table[boss_select][spell_select]["Type"] == "Spread" or debuffs_table[boss_select][spell_select]["Type"] == "Stack" then return false else return true end end,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          values = {[5] = 5, [8] = 8},
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["TypeDistance"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["TypeDistance"] end,
        },
        PLAYERONLY = {
          type = "select",
          name = "Players to track",
          order = 9,
          width = "full",
          hidden = function() if spell_select ~= nil then return false else return true end end,
          values = {["All"] = "All", ["Player"] = "Player", ["Focus"] = "Focus", ["Player_Focus"] = "Player_Focus"},
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["PlayerOnly"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["PlayerOnly"] end,
        },
        MAXSTACKS = {
          type = "toggle",
          name = "Stacks Alert",
          order = 10,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["MaxStacks"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["MaxStacks"] end,
        },
        MAXSTACKSNUMBER = {
          type = "range",
          name = "Stacks Number",
          order = 11,
          min = 0,
          max = 50,
          step = 1,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          disabled = function() if debuffs_table[boss_select][spell_select]["MaxStacks"] == true then return false else return true end end,
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["MaxStacksNumber"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["MaxStacksNumber"] end,
        },
        DELETE_SPELL_BUTTON = {
          type = "execute",
          name = "Delete",
          hidden = function() if spell_select ~= nil then return false else return true end end,
          --validate
        },
			},
		},
	},
}	

---------------------------------------------------------------------------------------------------
-------------------------------------------   INITIALIZE   ----------------------------------------
---------------------------------------------------------------------------------------------------

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