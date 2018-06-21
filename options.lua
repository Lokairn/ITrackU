local addonName, L = ...

ITrackU = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0") 

---------------------------------------------------------------------------------------------------
-------------------------------------   INIT RAID DISPONIBLE   ------------------------------------
---------------------------------------------------------------------------------------------------

local select_extension = "Battle for Azeroth"

local raid_select = nil
local raid_dungeon = {}
local raid_boss = {}
local raid_spell = {}

local dungeons = ITrack.dungeons
local raids = ITrack.raids

---------------------------------------------------------------------------------------------------
-----------------------------------------   FUNCTION TOOLS   --------------------------------------
---------------------------------------------------------------------------------------------------

function update_select_extension()
  select_raid_or_dungeon = nil
  raid_select = nil
  boss_select = nil
  spell_select = nil
  for k, v in pairs(raid_dungeon) do
    raid_dungeon[k] = nil
  end
	for k,v in pairs(raid_boss) do
		raid_boss[k] = nil
	end	
	for k, v in pairs(raid_spell) do
		raid_spell[k] = nil
	end
end

local function update_select_raid_or_dungeon()
	raid_select = nil
  boss_select = nil
  spell_select = nil
  for k, v in pairs(raid_dungeon) do
    raid_dungeon[k] = nil
  end
	for k,v in pairs(raid_boss) do
		raid_boss[k] = nil
	end	
	for k, v in pairs(raid_spell) do
		raid_spell[k] = nil
	end
end

local function update_raid_boss(raid, select_raid_or_dungeon, select_extension)
	boss_select = nil
  spell_select = nil
	for k,v in pairs(raid_boss) do
		raid_boss[k] = nil
	end	
	for k, v in pairs(raid_spell) do
		raid_spell[k] = nil
	end
  if select_raid_or_dungeon == "Raid" then
    for k, v in pairs(raids[select_extension][raid]) do
      raid_boss[k] = v
    end
  elseif select_raid_or_dungeon == "Dungeon" then
    for k, v in pairs(dungeons[select_extension][raid]) do
      raid_boss[k] = v
    end
  end
end

local function update_spell_raid_boss(boss)
  spell_select = nil
	for k, v in pairs(raid_spell) do
		raid_spell[k] = nil
	end
  for k, v in pairs(debuffs_table[boss]) do
    raid_spell[k] = select(1, GetSpellInfo(k))
    
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
				HEADER_FRAME_TEST = {
				  type = "header",
				  name = "Frame",
				  order = 1,
				},
				EXECUTE_OPEN_Frame = {
				  type = "execute",
				  name = function() 
					if ITrackU then
					  if ITrackU["DebuffToTrack"] then
						return "Close Frame"
					  else
						return "Open Frame"
					  end
					else
					  return "Open Frame"
					end
				  end,
				  order = 2,
				  func = function()
					open_frame_test()
				  end,
				},
						LOCK = {
							type = "execute",
							name = "Move main frame",
							func = show_lock_dialog,
				  order = 3,
					  },
				HEADER_POS_DIMENSION = {
				  type = "header",
				  name = "Position & Dimension",
				  order = 4,
				},
				DESCRIPTION_POS_DIMENSION = {
				  type = "description",
				  name = "Modify the position and the dimension of all frames.",
				  order = 5,
				},
				--DESCRIPTION_POS = {
				--  type = "description",
				--  name = "Manually change the position (x, y) of the frame. You can also use the 'Move Main Frame' button to do it with your cursos",
				--  order = 6,
				--},
				-- POS_X = {
				  -- type = "range",
				  -- desc = "test",
				  -- name = "Position X",
				  -- min = -1000,
				  -- max = 1000,
				  -- step = 1,
				  -- order = 7,
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
				  -- order = 8,
				  -- set = function(info,val)
					-- db_variable.POSITION_Y = val
					-- update_main_frame_y(val)
				  -- end,
				  -- get = function(info) return db_variable.POSITION_Y end,
				-- },
				--DESCRIPTION_DIMENSION_WIDTH_HEIGHT = {
				--  type = "description",
				--  name = "Modify Widht and Height of each frames",
				--  order = 9,
				--},
				GLOBAL_WIDTH = {
				  type = "range",
				  name = "Title & Debuffed Width",
				  order = 10,
				  min = 50,
				  max = 250,
				  step = 1,
				  desc = "",
				  set = function(info, val)
					db_variable.WIDTH_GLOBAL = val
					order_frame_player_debuff()
				  end,
				  get = function(val) return db_variable.WIDTH_GLOBAL end,
				},
				DESCRIPTION_DIMENSION_HEIGHTS = {
				  type = "description",
				  name = "Modify Height of Title Frames or/and height of Debuffed Frames",
				  order = 11,
				  width = "full",
				},
				HEIGHT_TITLE = {
				  type = "range",
				  name = "Title Height",
				  order = 12,
				  min = 10,
				  max = 50,
				  step = 1,
				  desc = "",
				  set = function(info, val)
					db_variable.HEIGHT_TITLE = val
					order_frame_player_debuff()
				  end,
				  get = function(val) return db_variable.HEIGHT_TITLE end,
				},
				HEIGHT_DEBUFFED = {
				  type = "range",
				  name = "Debuffed Height",
				  order = 13,
				  min = 10,
				  max = 50,
				  step = 1,
				  desc = "",
				  set = function(info, val)
					db_variable.HEIGHT_DEBUFFED = val
					order_frame_player_debuff()
				  end,
				  get = function(val) return db_variable.HEIGHT_DEBUFFED end,
				},
				HEADER_SPACE_BETWEEN_ITEM = {
				  type = "header",
				  name = "Space between items",
				  order = 14,
				},
				DESCRIPTION_SPACE_BETWEEN_ITEM = {
				  type = "description",
				  name = "Modify the space between each item",
				  order = 15,
				},
				SPACE_TITLE_TITLE = {
				  type = "range",
				  name = "Space Title - Title",
				  order = 16,
				  min = 0,
				  max = 20,
				  step = 0.01,
				  desc = "",
				  set = function(info, val)
					db_variable.HEIGHT_BETWEEN_TITLE = val
					order_frame_player_debuff()
				  end,
				  get = function(val) return db_variable.HEIGHT_BETWEEN_TITLE end,
				},
				SPACE_TITLE_DEBUFFED = {
				  type = "range",
				  name = "Space Title - Debuffed",
				  order = 17,
				  min = 0,
				  max = 5,
				  step = 0.01,
				  desc = "",
				  set = function(info, val)
					db_variable.HEIGHT_BETWEEN_TITLE_DEBUFFED = val
					order_frame_player_debuff()
				  end,
				  get = function(val) return db_variable.HEIGHT_BETWEEN_TITLE_DEBUFFED end,
				},
				SPACE_DEBUFFED_DEBUFFED = {
				  type = "range",
				  name = "Space Debuffed - Debuffed",
				  order = 18,
				  min = 0,
				  max = 5,
				  step = 0.01,
				  desc = "",
				  set = function(info, val)
					db_variable.HEIGHT_BETWEEN_DEBUFFED = val
					order_frame_player_debuff()
				  end,
				  get = function(val) return db_variable.HEIGHT_BETWEEN_DEBUFFED end,
				},
				SPACE_BETWEEN_COLUMNS = {
					type = "range",
					name = "Space between Columns",
					order = 19,
					min = 50,
					max = 250,
					step = 1,
					desc = "",
					set = function(info, val)
						db_variable.WIDTH_BETWEEN_COLUMNS = val
						order_frame_player_debuff()
					end,
					get = function(val) return db_variable.WIDTH_BETWEEN_COLUMNS end,
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
        COLOR_DISTANCE_OK = {
          type = "color",
          desc = "",
          name = "Distance frame OK",
          hasAlpha = true,
          order = 17,
          set = function(info, val1, val2, val3, val4)
            db_variable.COLOR_R_DISTANCE_OK = val1
            db_variable.COLOR_G_DISTANCE_OK = val2
            db_variable.COLOR_B_DISTANCE_OK = val3
            db_variable.COLOR_A_DISTANCE_OK = val4
          end,
          get = function(info) return db_variable.COLOR_R_DISTANCE_OK, db_variable.COLOR_G_DISTANCE_OK, db_variable.COLOR_B_DISTANCE_OK, db_variable.COLOR_A_DISTANCE_OK end,
        },
        COLOR_DISTANCE_KO = {
          type = "color",
          desc = "",
          name = "Distance frame KO",
          hasAlpha = true,
          order = 18,
          set = function(info, val1, val2, val3, val4)
            db_variable.COLOR_R_DISTANCE_KO = val1
            db_variable.COLOR_G_DISTANCE_KO = val2
            db_variable.COLOR_B_DISTANCE_KO = val3
            db_variable.COLOR_A_DISTANCE_KO = val4
          end,
          get = function(info) return db_variable.COLOR_R_DISTANCE_KO, db_variable.COLOR_G_DISTANCE_KO, db_variable.COLOR_B_DISTANCE_KO, db_variable.COLOR_A_DISTANCE_KO end,
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
          order = 1.5,
        },
        SELECT_EXTENSIONS = {
          type = "select",
          name = "Extensions",
          style = "dropdown",
          order = 2,
          width = "full",
          values = {
            ["Legion"] = "Legion", 
            ["Battle for Azeroth"] = "Battle for Azeroth"
          },
          set = function(info, val)
            select_extension = val
            update_select_extension()
          end,
          get = function(info) return select_extension end,
        },
        SELECT_RAID_OR_DUNGEON = {
          type = "select",
          name = "Raid or Dungeons",
          style = "radio",
          width = "full",
          order = 3,
          hidden = function() if select_extension ~= nil then return false else return true end end,
          values = {["Raid"] = "Raid", ["Dungeon"] = "Dungeon"},
          set = function(info, val)
            select_raid_or_dungeon = val
            update_select_raid_or_dungeon()
          end,
          get = function(info) return select_raid_or_dungeon end,
        },
				SELECT_RAID = {
					type = "select",
					name = "",
					style = "dropdown",
					order = 4,
          hidden = function() if select_raid_or_dungeon ~= nil then return false else return true end end,
					values = function()
            if select_raid_or_dungeon == "Raid" then  
              for k, v in pairs(raids[select_extension]) do
                raid_dungeon[k] = k
              end
            elseif select_raid_or_dungeon == "Dungeon" then
              for k, v in pairs(dungeons[select_extension]) do
                raid_dungeon[k] = k
              end
            end
						return raid_dungeon
					end,
					set = function(info, val)
						raid_select = val
						update_raid_boss(val, select_raid_or_dungeon, select_extension)
					end,
					get = function(val) return raid_select end,
				},
				SELECT_BOSS = {
					type = "select",
					name = "",
					style = "dropdown",
					order = 5,
          hidden = function() if raid_select ~= nil then return false else return true end end,
					values = raid_boss,
					set = function(info, val)
						boss_select = val
            if debuffs_table[boss_select] == nil then debuffs_table[boss_select] = {} end
						update_spell_raid_boss(val)
					end,
					get = function(val) return boss_select end,
				},
        HEADER_SELECT_SPELL = {
          type = "header",
          name = "Manage Spells",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 6,
        },
        DESC_SELECT_SPELL = {
          type = "description",
          name = "Manage your spells here, add whatever your want to track during the encounter.",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 7,
        },
				SELECT_SPELL = {
					type = "select",
					name = "Spells tracked",
					style = "radio",
					order = 8,
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
          order = 9,
        },
        ACTIVATE = {
        	type = "toggle",
        	desc = function()
	        	if spell_select then
	        		if debuffs_table[boss_select][spell_select]["Activate"] then
	        			return "Desactivate the spell's track during the encounter."
	        		else
	        			return "Activate the spell's track during the encounter."
	        		end        		
	        	else 
	        		return "" 
	        	end
        	end,
        	name = function()
	        	if spell_select then
	        		if debuffs_table[boss_select][spell_select]["Activate"] then
	        			return "Activated"
	        		else
	        			return "Desactivated"
	        		end        		
	        	else 
	        		return "" 
	        	end
        	end,
        	tristate = false,
        	order = 9.5,
        	hidden = function() if spell_select ~= nil then return false else return true end end,
        	set = function(info, val)
        		debuffs_table[boss_select][spell_select]["Activate"] = val
        	end,
        	get = function(val) return debuffs_table[boss_select][spell_select]["Activate"] end,
        },
        IF_ACTIVE = {
          type = "toggle",
          name = "Frame always up",
          desc = "Open the title frame if buff/debuff is not up.",
          tristate = false,
          order = 10,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
          	if val then
            	debuffs_table[boss_select][spell_select]["IfActive"] = false
            else
            	debuffs_table[boss_select][spell_select]["IfActive"] = true
            end
          end,
          get = function(val)
          	if debuffs_table[boss_select][spell_select]["IfActive"] then
           		return false
           	else
           		return true
           	end
          end,
        },
        TYPE = {
          type = "select",
          name = "Buff/Debuff Type",
          style = "dropdown",
          order = 11,
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
          order = 12,
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
          order = 13,
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
          order = 14,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            debuffs_table[boss_select][spell_select]["MaxStacks"] = val
          end,
          get = function(val) return debuffs_table[boss_select][spell_select]["MaxStacks"] end,
        },
        MAXSTACKSNUMBER = {
          type = "range",
          name = "Stacks Number",
          order = 15,
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
        COLUMNS = {
        	type = "select",
        	name = "",
        	desc = "Split your spells into 3 columns",
        	order = 15.5,
        	values = {[0] = "Column 1", [1] = "Column 2", [2] = "Column 3"},
        	hidden = function() if spell_select ~= nil then return false else return true end end,
        	set = function(info, val)
        		debuffs_table[boss_select][spell_select]["Columns"] = val
        	end,
        	get = function(val) return debuffs_table[boss_select][spell_select]["Columns"] end,
        },
        DELETE_SPELL_BUTTON = {
          type = "execute",
          name = "Delete",
          order = 16,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          func = function()
            debuffs_table[boss_select][spell_select] = nil
            spell_select = nil
            update_spell_raid_boss(boss_select)
          end,
        },
        HEADER_ADD_SPELL = {
          type = "header",
          name = "Add a Spell",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 17,
        },
        DESC_ADD_SPELL = {
          type = "description",
          name = "Add a new spell using the name or the ID.",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          order = 18,
        },
        ADD_SPELL = {
          type = "input",
          order = 19,
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
          order = 20,
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
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["Columns"] = 0
            debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))]["Activate"] = true

            spell_select = select(7, GetSpellInfo(spell_add))
            spell_add = nil
            update_spell_raid_boss(boss_select)
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
          order = 21,
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
end 

function ITrackU:ChatCommand(input)     
	if not input or input:trim() == "" then         
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)     
	else         
	LibStub("AceConfigCmd-3.0"):HandleCommand("ITU", "ITrackU", input)     
	end 
end