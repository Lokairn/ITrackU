local addonName, L = ...

ITrackU = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") 

---------------------------------------------------------------------------------------------------
-------------------------------------   INIT RAID DISPONIBLE   ------------------------------------
---------------------------------------------------------------------------------------------------

local raid_select = nil
local raid_boss = {}
local raid_spell = {}

local raids = {
	["Antorus, Burning Throne"] = {
		[2076] = "Garothi",
		[2074] = "Felbounds",
    [2070] = "High Command",
    [2064] = "Hasabel",
    [2075] = "Eonar",
    [2082] = "Imonar",
    [2088] = "Kin'garoth",
    [2069] = "Varimathras",
    [2073] = "Shivarra",
    [2063] = "Aggramar",
    [2092] = "Argus"
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
  				name = "Titres",
  				order = 1,
				},
        HEADER_COLOR_TITRE_DESCRIPTION = {
          type = "description",
          name = "You can modify the color of the title frames and the police.",
          order = 2,
        },
				COLOR_BACKGROUND_TITRE = {
					type = "color",
					desc = "",
					name = "Title Color",
					hasAlpha = true,
					order = 3,
					set = function(info, val1, val2, val3, val4)
						db_variable.COLOR_R_TITRE = val1
						db_variable.COLOR_G_TITRE = val2
						db_variable.COLOR_B_TITRE = val3
						db_variable.COLOR_A_TITRE = val4
						update_background_color_titre(val1, val2, val3, val4)
					end,
					get = function(info) return db_variable.COLOR_R_TITRE, db_variable.COLOR_G_TITRE, db_variable.COLOR_B_TITRE, db_variable.COLOR_A_TITRE end,
				},
        HEADER_COLOR_PLAYERDEBUFFED = {
          type = "header",
          name = "Player Debuffed",
          order = 4,
        },
        HEADER_COLOR_PLAYERDEBUFFED_DESCRIPTION = {
          type = "description",
          name = "You can modify the color of player debuffed frames if You / Focus / Another Player / Max Stacks",
          order = 5,
        },
        COLOR_BACKGROUND_PLAYER = {
          type = "color",
          desc = "",
          name = "Player Color",
          hasAlpha = true,
          order = 6,
          set = function(info, val1, val2, val3, val4)
            db_variable.COLOR_R_DEBUFFED_PLAYER = val1
            db_variable.COLOR_G_DEBUFFED_PLAYER = val2
            db_variable.COLOR_B_DEBUFFED_PLAYER = val3
            db_variable.COLOR_A_DEBUFFED_PLAYER = val4
            update_background_color_player(val1, val2, val3, val4)
          end,
          get = function(info) return db_variable.COLOR_R_DEBUFFED_PLAYER, db_variable.COLOR_G_DEBUFFED_PLAYER, db_variable.COLOR_B_DEBUFFED_PLAYER, db_variable.COLOR_A_DEBUFFED_PLAYER end,
        },
        --ALPHA_STATUSBAR_PLAYER = {
        --order = 7,
        --},
        COLOR_BACKGROUND_FOCUS = {
          type = "color",
          desc = "",
          name = "Focus Color",
          hasAlpha = true,
          order = 8,
          set = function(info, val1, val2, val3, val4)
            db_variable.COLOR_R_DEBUFFED_FOCUS = val1
            db_variable.COLOR_G_DEBUFFED_FOCUS = val2
            db_variable.COLOR_B_DEBUFFED_FOCUS = val3
            db_variable.COLOR_A_DEBUFFED_FOCUS = val4
            update_background_color_focus(val1, val2, val3, val4)
          end,
          get = function(info) return db_variable.COLOR_R_DEBUFFED_FOCUS, db_variable.COLOR_G_DEBUFFED_FOCUS, db_variable.COLOR_B_DEBUFFED_FOCUS, db_variable.COLOR_A_DEBUFFED_FOCUS end,
        },
        --ALPHA_STATUSBAR_FOCUS = {
        --order = 9,
        --},
        COLOR_BACKGROUND_MATE = {
          type = "color",
          desc = "",
          name = "Mate Color",
          hasAlpha = true,
          order = 10,
          set = function(info, val1, val2, val3, val4)
            db_variable.COLOR_R_DEBUFFED_MATE = val1
            db_variable.COLOR_G_DEBUFFED_MATE = val2
            db_variable.COLOR_B_DEBUFFED_MATE = val3
            db_variable.COLOR_A_DEBUFFED_MATE = val4
            update_background_color_mate(val1, val2, val3, val4)
          end,
          get = function(info) return db_variable.COLOR_R_DEBUFFED_MATE, db_variable.COLOR_G_DEBUFFED_MATE, db_variable.COLOR_B_DEBUFFED_MATE, db_variable.COLOR_A_DEBUFFED_MATE end,
        },
        --ALPHA_STATUSBAR_FOCUS = {
        --order = 11,
        --}, 
        COLOR_BACKGROUND_MAXSTACKS = {
          type = "color",
          desc = "",
          name = "MaxStacks Color",
          hasAlpha = true,
          order = 12,
          set = function(info, val1, val2, val3, val4)
            db_variable.COLOR_R_DEBUFFED_MAXSTACK = val1
            db_variable.COLOR_G_DEBUFFED_MAXSTACK = val2
            db_variable.COLOR_B_DEBUFFED_MAXSTACK = val3
            db_variable.COLOR_A_DEBUFFED_MAXSTACK = val4
            update_background_color_maxstack(val1, val2, val3, val4)
          end,
          get = function(info) return db_variable.COLOR_R_DEBUFFED_MAXSTACK, db_variable.COLOR_G_DEBUFFED_MAXSTACK, db_variable.COLOR_B_DEBUFFED_MAXSTACK, db_variable.COLOR_A_DEBUFFED_MAXSTACK end,
        },  
        --ALPHA_STATUSBAR_FOCUS = {
        --order = 13,
        --},
        ALPHA_BACKGROUND_PLAYERDEBUFFED = {
          type = "range",
          name = "StatusBar Alpha",
          desc = "",
          order = 14,
          min = 0,
          max = 1,
          step = 0.01,
          set = function(info, val)
            db_variable.COLOR_A_DEBUFFED_STATUSBAR = val
            update_alpha_color_statusbar(val)
          end,
          get = function(val) return db_variable.COLOR_A_DEBUFFED_STATUSBAR end,
        },  
        HEADER_PLAYERDISTANCE = {
          type = "header",
          name = "Player Distance",
          order = 15,
        },
        DESCRIPTION_PLAYERDISTANCE = {
          type = "description",
          name = "You can modify the color of the frame created when you are tracking a Stack or Spread spell.",
          order = 16,
        },      
			},
		},
		DebuffsBDD = {
			name = "Debuffs",
			type = "group",
			order = 2,
			args = {
        HEADER_DEBUFF_SELECT = {
          type = "header",
          name = "Select Raid and Boss",
          order = 1,
        },
        DESC_DEBUFF_SELECT = {
          type = "description",
          name = "Select the raid and then the boss you want to control buffs and debuffs. You will be able to modify/add/delete spells.",
          order = 2,
        },
				SELECT_RAID = {
					type = "select",
					name = "",
					style = "dropdown",
					order = 3,
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
					name = "",
					style = "dropdown",
					order = 4,
          hidden = function() if raid_select ~= nil then return false else return true end end,
					values = raid_boss,
					set = function(info, val)
						boss_select = val
						update_spell_raid_boss(val)
					end,
					get = function(val) return boss_select end,
				},
        HEADER_SELECT_SPELL = {
          type = "header",
          name = "Manage Spells",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 5,
        },
        DESC_SELECT_SPELL = {
          type = "description",
          name = "Manage your spells here, add whatever your want to track during the encounter.",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 6,
        },
				SELECT_SPELL = {
					type = "select",
					name = "Spells tracked",
					style = "radio",
					order = 7,
					width = "full",
          hidden = function() if boss_select ~= nil then return false else return true end end,
					values = raid_spell,
					set = function(info, val)
            if val == spell_select then
              spell_select = nil
            else
              spell_select = val
            end
					end,
					get = function(val) return spell_select end,
				},
        ICON_SPELL_SELECT = {
          type = "description",
          name = "",
          image = function()
          return select(3, GetSpellInfo(spell_select)), 20, 20
          end,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          order = 8,
        },
        IF_ACTIVE = {
          type = "toggle",
          name = "Open if active",
          tristate = false,
          width = "full",
          order = 9,
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
          order = 10,
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
          order = 11,
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
          order = 12,
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
          order = 13,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["MaxStacks"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["MaxStacks"] end,
        },
        MAXSTACKSNUMBER = {
          type = "range",
          name = "Stacks Number",
          order = 14,
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
          order = 15,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          func = function()
            debuffs_table[boss_select][spell_select] = nil
            spell_select = nil
            update_spell_raid_boss()
          end,
        },
        HEADER_ADD_SPELL = {
          type = "header",
          name = "Add a Spell",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 16,
        },
        DESC_ADD_SPELL = {
          type = "description",
          name = "Add a new spell using the name or the ID.",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 17,
        },
        ADD_SPELL = {
          type = "input",
          order = 18,
          name = "",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          set = function(info, val)
            spell_add = val
          end,
          get = function(val) return spell_add end,
        },
        ADD_SPELL_BUTTON = {
          type = "execute",
          name = "Add spell",
          order = 19,
          hidden = function() if select(7, GetSpellInfo(spell_add)) ~= nil and debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] == nil then return false else return true end end,
          func = function()
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] = {}
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["IfActive"] = false
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["Count"] = 0
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["Type"] = "Classic"
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["TypeDistance"] = 0
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["Rôle"] = "All"
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["PlayerOnly"] = "All"
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["MaxStacks"] = false
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["MaxStacksNumber"] = 0
            
            spell_select = select(7, GetSpellInfo(spell_add))
            spell_add = nil
            update_spell_raid_boss()
          end,
        },
        ADD_SPELL_VALIDATION = {
          type = "description",
          image = function()
            if select(7, GetSpellInfo(spell_add)) ~= nil and debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] == nil then
              return select(3, GetSpellInfo(spell_add)), 20, 20
            end          
          end,
          name = function()
            if select(7, GetSpellInfo(spell_add)) == nil then
              if spell_add == "" then
                return "" 
              else
                return "The spell you want to add doesn't exist"
              end
            else
              if debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] == nil then
                return select(1, GetSpellInfo(spell_add))
              else
                return ("You have already registered this spell")
              end
            end
          end,
          order = 20,
          hidden = function () if spell_add ~= nil then return false else return true end end,
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
 
 if debuffs_table == nil then debuffs_table = {} end
 
  for k, v in pairs(raids) do
    for l,w in pairs(raids[k]) do
      if debuffs_table[l] == nil then
        debuffs_table[l] = {}
      end
    end
  end
end 

function ITrackU:ChatCommand(input)     
	if not input or input:trim() == "" then         
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)     
	else         
	LibStub("AceConfigCmd-3.0"):HandleCommand("ITU", "ITrackU", input)     
	end 
end