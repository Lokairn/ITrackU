local addonName = ...
local L = LibStub("AceLocale-3.0"):GetLocale("ITrackU")
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
  difficulty_select = nil
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
  difficulty_select = nil
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
  difficulty_select = nil
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

local function update_spell_raid_boss(boss, difficulty)
	for k, v in pairs(raid_spell) do
		raid_spell[k] = nil
	end
  for k, v in pairs(db_ITrackU.profiles[ITrack.profile].debuffs_table[boss][difficulty]) do
    if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss][difficulty][k].Activate then
      raid_spell[k] = select(1, GetSpellInfo(k))
    else
      raid_spell[k] = select(1, GetSpellInfo(k)).." (Desactivated)"
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
    Module_Debuffs = {
      name = L["Module_Debuff_Name"],
      order = 1,
      type = "group",
      args = {
        DEBUFFS_HEADER = {
          type = "header",
          order = 1,
          name = L["Module_Debuff_Title"],
        },
        DEBUFFS_ACTIVATION = {
        type = "toggle",
        order = 1.5,
        name = L["Module_Stuns_Activate_Name"],
        desc = L["Module_Debuff_Activate_Description"],
        set = function(info, val)
          db_ITrackU.profiles[ITrack.profile].DEBUFF_ACTIVATE = val
        end,
        get = function(info) return db_ITrackU.profiles[ITrack.profile].DEBUFF_ACTIVATE end,
        },
        EXECUTE_OPEN_FRAME = {
          type = "execute",
          name = function() 
          if ITrackU then
            if ITrackU.DebuffToTrack then
            return L["Module_Debuff_Close_Frame"]
            else
            return L["Module_Debuff_Open_Frame"]
            end
          else
            return L["Module_Debuff_Open_Frame"]
          end
          end,
          order = 2,
          func = function()
          open_frame_test()
          end,
        },
        DEBUFFS_DESCRIPTION_HEADER = {
          type = "header",
          order = 3,
          name = L["Module_Debuff_Description_Header"],
        },
        DEBUFFS_DESCRIPTION = {
          type = "description",
          order = 4,
          name = L["Module_Debuff_Description"],
        },
        -- Bouton activé
        -- Description
          WidthPosition = {
            name = "Width & Position",
            type = "group",
            order = 1,
            args = {
              HEADER_FRAME_TEST = {
                type = "header",
                name = L["Module_Debuff_Move_Frame_Header"],
                order = 1,
              },
              LOCK = {
                type = "execute",
                name = L["Module_Debuff_Lock_Frame"],
                func = function()
                  show_lock_dialog()
                end,
                order = 3,
                width = "full",
              },
              HEADER_POS_DIMENSION = {
                type = "header",
                name = L["Module_Debuff_Header_Pos_Dimension"],
                order = 4,
              },
              DESCRIPTION_POS_DIMENSION = {
                type = "description",
                name = L["Module_Debuff_Description_Pos_Dimension"],
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
                -- db_ITrackU.profiles[ITrack.profile].POSITION_X = val
                -- update_main_frame_x(val)
                -- end,
                -- get = function(info) return db_ITrackU.profiles[ITrack.profile].POSITION_X end,
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
                -- db_ITrackU.profiles[ITrack.profile].POSITION_Y = val
                -- update_main_frame_y(val)
                -- end,
                -- get = function(info) return db_ITrackU.profiles[ITrack.profile].POSITION_Y end,
              -- },
              --DESCRIPTION_DIMENSION_WIDTH_HEIGHT = {
              --  type = "description",
              --  name = "Modify Widht and Height of each frames",
              --  order = 9,
              --},
              GLOBAL_WIDTH = {
                type = "range",
                name = L["Module_Debuff_Global_Width"],
                order = 10,
                min = 50,
                max = 250,
                step = 1,
                desc = "",
                set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL = val
                order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL end,
              },
              DESCRIPTION_DIMENSION_HEIGHTS = {
                type = "description",
                name = L["Module_Debuff_Description_Dimension_Heights"],
                order = 11,
                width = "full",
              },
              HEIGHT_TITLE = {
                type = "range",
                name = L["Module_Debuff_Height_Title"],
                order = 12,
                min = 10,
                max = 50,
                step = 1,
                desc = "",
                set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE = val
                order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE end,
              },
              HEIGHT_DEBUFFED = {
                type = "range",
                name = L["Module_Debuff_Height_Debuffed"],
                order = 13,
                min = 10,
                max = 50,
                step = 1,
                desc = "",
                set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED = val
                order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED end,
              },
              HEADER_SPACE_BETWEEN_ITEM = {
                type = "header",
                name = L["Module_Debuff_Header_Space_Between_Item"],
                order = 14,
              },
              DESCRIPTION_SPACE_BETWEEN_ITEM = {
                type = "description",
                name = L["DESCRIPTION_SPACE_BETWEEN_ITEM"],
                order = 15,
              },
              SPACE_TITLE_TITLE = {
                type = "range",
                name = L["SPACE_TITLE_TITLE"],
                order = 16,
                min = 0,
                max = 20,
                step = 0.01,
                desc = "",
                set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE = val
                order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE end,
              },
              SPACE_TITLE_DEBUFFED = {
                type = "range",
                name = L["SPACE_TITLE_DEBUFFED"],
                order = 17,
                min = 0,
                max = 5,
                step = 0.01,
                desc = "",
                set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE_DEBUFFED = val
                order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE_DEBUFFED end,
              },
              SPACE_DEBUFFED_DEBUFFED = {
                type = "range",
                name = L["SPACE_DEBUFFED_DEBUFFED"],
                order = 18,
                min = 0,
                max = 5,
                step = 0.01,
                desc = "",
                set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_DEBUFFED = val
                order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_DEBUFFED end,
              },
              SPACE_BETWEEN_COLUMNS = {
                type = "range",
                name = L["SPACE_BETWEEN_COLUMNS"],
                order = 19,
                min = 50,
                max = 250,
                step = 1,
                desc = "",
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS = val
                  order_frame_player_debuff()
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS end,
              },
              ICON_ZOOM_PERCENTAGE = {
                type = "range",
                name = L["ICON_ZOOM_PERCENTAGE"],
                order = 20,
                min = 0,
                max = 0.15,
                step = 0.01,
                desc = "",
                isPercent=true,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].ZOOM_PERCENTAGE = val
                  update_icon_zoom(val)
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].ZOOM_PERCENTAGE end,
              },
            },
          },
          ColorPanel = {
            name = L["ColorPanel"],
            type = "group",
            order = 2,
            args = {
              HEADER_COLOR_TITRE = {
                type = "header",
                name = L["HEADER_COLOR_TITRE"],
                order = 1,
              },
              HEADER_COLOR_TITRE_DESCRIPTION = {
                type = "description",
                name = L["HEADER_COLOR_TITRE_DESCRIPTION"],
                order = 2,
              },
              COLOR_BACKGROUND_TITRE = {
                type = "color",
                desc = "",
                name = L["COLOR_BACKGROUND_TITRE"],
                hasAlpha = true,
                order = 3,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_TITRE = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_TITRE = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_TITRE = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_TITRE = val4
                  update_background_color_titre(val1, val2, val3, val4)
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_TITRE, db_ITrackU.profiles[ITrack.profile].COLOR_G_TITRE, db_ITrackU.profiles[ITrack.profile].COLOR_B_TITRE, db_ITrackU.profiles[ITrack.profile].COLOR_A_TITRE end,
              },
              HEADER_COLOR_PLAYERDEBUFFED = {
                type = "header",
                name = L["HEADER_COLOR_PLAYERDEBUFFED"],
                order = 4,
              },
              HEADER_COLOR_PLAYERDEBUFFED_DESCRIPTION = {
                type = "description",
                name = L["HEADER_COLOR_PLAYERDEBUFFED_DESCRIPTION"],
                order = 5,
              },
              ENABLE_CLASS_COLOR_PLAYER = {
                type = "toggle",
                order = 5.5,
                name = L["ENABLE_CLASS_COLOR_PLAYER"],
                desc = "",
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_PLAYER = val
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_PLAYER end,
              },
              ALPHA_CLASS_COLOR_PLAYER = {
                type = "range",
                order = 5.6,
                name = L["ALPHA_CLASS_COLOR_PLAYER"],
                desc = "",
                min = 0,
                max = 1,
                step = 0.01,
                hidden = function() if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_PLAYER then return false else return true end end,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_PLAYER = val
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_PLAYER end,
              },
              COLOR_BACKGROUND_PLAYER = {
                type = "color",
                desc = "",
                name = L["COLOR_BACKGROUND_PLAYER"],
                hasAlpha = true,
                hidden = function() if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_PLAYER then return true else return false end end,
                order = 6,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_PLAYER = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_PLAYER = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_PLAYER = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_PLAYER = val4
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_PLAYER, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_PLAYER, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_PLAYER, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_PLAYER end,
              },
              --ALPHA_STATUSBAR_PLAYER = {
              --order = 7,
              --},
              ENABLE_CLASS_COLOR_FOCUS = {
                type = "toggle",
                order = 6.5,
                name = L["ENABLE_CLASS_COLOR_FOCUS"],
                desc = "",
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_FOCUS = val
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_FOCUS end,
              },
              ALPHA_CLASS_COLOR_FOCUS = {
                type = "range",
                order = 6.6,
                name = L["ALPHA_CLASS_COLOR_FOCUS"],
                desc = "",
                min = 0,
                max = 1,
                step = 0.01,
                hidden = function() if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_FOCUS then return false else return true end end,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_FOCUS = val
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_FOCUS end,
              },
              COLOR_BACKGROUND_FOCUS = {
                type = "color",
                desc = "",
                name = L["COLOR_BACKGROUND_FOCUS"],
                hasAlpha = true,
                hidden = function() if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_FOCUS then return true else return false end end,
                order = 8,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_FOCUS = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_FOCUS = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_FOCUS = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_FOCUS = val4
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_FOCUS, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_FOCUS, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_FOCUS, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_FOCUS end,
              },
              --ALPHA_STATUSBAR_FOCUS = {
              --order = 9,
              --},
              ENABLE_CLASS_COLOR_MATE = {
                type = "toggle",
                order = 8.5,
                name = L["ENABLE_CLASS_COLOR_MATE"],
                desc = "",
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_MATE = val
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_MATE end,
              },
              ALPHA_CLASS_COLOR_MATE = {
                type = "range",
                order = 8.6,
                name = L["ALPHA_CLASS_COLOR_MATE"],
                desc = "",
                min = 0,
                max = 1,
                step = 0.01,
                hidden = function() if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_MATE then return false else return true end end,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_MATE = val
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_MATE end,
              },
              COLOR_BACKGROUND_MATE = {
                type = "color",
                desc = "",
                name = L["COLOR_BACKGROUND_MATE"],
                hasAlpha = true,
                hidden = function() if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_MATE then return true else return false end end,
                order = 10,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MATE = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MATE = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MATE = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MATE = val4
                  update_debuffed_background_color()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MATE, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MATE, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MATE, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MATE end,
              },
              --ALPHA_STATUSBAR_FOCUS = {
              --order = 11,
              --}, 
              COLOR_BACKGROUND_MAXSTACKS = {
                type = "color",
                desc = "",
                name = L["COLOR_BACKGROUND_MAXSTACKS"],
                hasAlpha = true,
                order = 12,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MAXSTACK = val4
                  update_background_color_maxstack(val1, val2, val3, val4)
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MAXSTACK end,
              },  
              --ALPHA_STATUSBAR_FOCUS = {
              --order = 13,
              --},
              ALPHA_BACKGROUND_PLAYERDEBUFFED = {
                type = "range",
                name = L["ALPHA_BACKGROUND_PLAYERDEBUFFED"],
                desc = "",
                order = 14,
                min = 0,
                max = 1,
                step = 0.01,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_STATUSBAR = val
                  update_alpha_color_statusbar(val)
                end,
                get = function(val) return db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_STATUSBAR end,
              },  
              HEADER_PLAYERDISTANCE = {
                type = "header",
                name = L["HEADER_PLAYERDISTANCE"],
                order = 15,
              },
              DESCRIPTION_PLAYERDISTANCE = {
                type = "description",
                name = L["DESCRIPTION_PLAYERDISTANCE"],
                order = 16,
              }, 
              COLOR_DISTANCE_OK = {
                type = "color",
                desc = "",
                name = L["COLOR_DISTANCE_OK"],
                hasAlpha = true,
                order = 17,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_OK = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_OK = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_OK = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_OK = val4
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_OK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_OK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_OK, db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_OK end,
              },
              COLOR_DISTANCE_KO = {
                type = "color",
                desc = "",
                name = L["COLOR_DISTANCE_KO"],
                hasAlpha = true,
                order = 18,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_KO = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_KO = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_KO = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_KO = val4
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_KO, db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_KO, db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_KO, db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_KO end,
              },
              HEADER_FONTS = {
                type = "header",
                name = L["HEADER_FONTS"],
                order = 19,
              },
              FONTS_TITRE = {
                type = "select",
                name = L["FONTS_TITRE"],
                order = 20,
                style = "dropdown",
                desc = "",
                values = ITrack.Fonts,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].FONT_TITRE = val
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_TITRE end,
              },
              FONT_TITRE_SIZE = {
                type = "range",
                order = 21,
                name = "Font Title Size",
                desc = "",
                width = "half",
                min = 8,
                max = 32,
                step = 0.01,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].FONT_TITRE_SIZE = val
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_TITRE_SIZE end,
              },
              FONT_TITRE_COLOR = {
                type = "color",
                name = "",
                order = 22,
                width = "half",
                desc = "",
                hasAlpha = true,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].FONT_TITRE_R_COLOR = val1
                  db_ITrackU.profiles[ITrack.profile].FONT_TITRE_G_COLOR = val2
                  db_ITrackU.profiles[ITrack.profile].FONT_TITRE_B_COLOR = val3
                  db_ITrackU.profiles[ITrack.profile].FONT_TITRE_A_COLOR = val4
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_TITRE_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_A_COLOR end,
              },
              FONTS_DEBUFFED_NAME = {
                type = "select",
                name = L["FONTS_DEBUFFED_NAME"],
                order = 23,
                style = "dropdown",
                desc = "",
                values = ITrack.Fonts,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME = val
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME end,
              },
              FONT_DEBUFFED_NAME_SIZE = {
                type = "range",
                order = 24,
                name = L["FONT_DEBUFFED_NAME_SIZE"],
                desc = "",
                width = "half",
                min = 8,
                max = 32,
                step = 0.01,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_SIZE = val
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_SIZE end,
              },
              FONT_DEBUFFED_NAME_COLOR = {
                type = "color",
                name = "",
                order = 25,
                width = "half",
                desc = "",
                hasAlpha = true,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_R_COLOR = val1
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_G_COLOR = val2
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_B_COLOR = val3
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_A_COLOR = val4
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_A_COLOR end,
              },
              FONTS_DEBUFFED_STACK = {
                type = "select",
                name = "Font Debuffed Stack",
                order = 26,
                style = "dropdown",
                desc = "",
                values = ITrack.Fonts,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK = val
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK end,
              },
              FONT_DEBUFFED_STACK_SIZE = {
                type = "range",
                order = 27,
                name = L["FONT_DEBUFFED_STACK_SIZE"],
                desc = "",
                width = "half",
                min = 8,
                max = 32,
                step = 0.01,
                set = function(info, val)
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_SIZE = val
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_SIZE end,
              },
              FONT_DEBUFFED_STACK_COLOR = {
                type = "color",
                name = "",
                order = 28,
                width = "half",
                desc = "",
                hasAlpha = true,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_R_COLOR = val1
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_G_COLOR = val2
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_B_COLOR = val3
                  db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_A_COLOR = val4
                  update_fonts()
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_A_COLOR end,
              },       
            },
          },
          Spells = {
			name = "Spells",
			type = "group",
			order = 3,
			args = {
        HEADER_DEBUFF_SELECT = {
          type = "header",
          name = L["HEADER_DEBUFF_SELECT"],
          order = 1,
        },
        DESC_DEBUFF_SELECT = {
          type = "description",
          name = L["DESC_DEBUFF_SELECT"],
          order = 1.5,
        },
        SELECT_EXTENSIONS = {
          type = "select",
          name = L["SELECT_EXTENSIONS"],
          style = "dropdown",
          order = 2,
          width = "full",
          values = {
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
          name = L["SELECT_RAID_OR_DUNGEON"],
          style = "radio",
          width = "full",
          order = 3,
          hidden = function() if select_extension ~= nil then return false else return true end end,
          values = {Raid = "Raid", Dungeon = "Dungeon"},
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
            if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select] == nil then db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select] = {} end
            difficulty_select = nil
					end,
					get = function(val) return boss_select end,
				},
        SELECT_DIFFICULTY = {
          type = "select",
          order = 5.5,
          name = L["SELECT_DIFFICULTY"],
          style = "radio",
          hidden = function() if boss_select ~= nil then return false else return true end end,
          values = function() 
            if select_raid_or_dungeon then
              if select_raid_or_dungeon == "Raid" then
                return ITrack.raids_difficulty
              elseif select_raid_or_dungeon == "Dungeon" then
                return ITrack.dungeons_difficulty
              end
            end
          end,
          set = function(info, val)
            spell_select = nil
            difficulty_select = val
            if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select] == nil then db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select] = {} end
            update_spell_raid_boss(boss_select, val)
          end,
          get = function(val) return difficulty_select end,
        },
        HEADER_SELECT_SPELL = {
          type = "header",
          name = L["HEADER_SELECT_SPELL"],
          hidden = function() if difficulty_select ~= nil then return false else return true end end,
          order = 6,
        },
        DESC_SELECT_SPELL = {
          type = "description",
          name = L["DESC_SELECT_SPELL"],
          hidden = function() if difficulty_select ~= nil then return false else return true end end,
          order = 7,
        },
				SELECT_SPELL = {
					type = "select",
					name = L["SELECT_SPELL"],
					style = "radio",
					order = 8,
					width = "full",
          hidden = function() if difficulty_select ~= nil then return false else return true end end,
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
	        		if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Activate then
	        			return L["DESACTIVATE"]
	        		else
	        			return L["ACTIVATE"]
	        		end        		
	        	else 
	        		return "" 
	        	end
        	end,
        	name = function()
	        	if spell_select then
	        		if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Activate then
	        			return L["Activated"]
	        		else
	        			return L["Desactivated"]
	        		end        		
	        	else 
	        		return "" 
	        	end
        	end,
        	tristate = false,
        	order = 9.5,
        	hidden = function() if spell_select ~= nil then return false else return true end end,
        	set = function(info, val)
        		db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Activate = val
            update_spell_raid_boss(boss_select, difficulty_select)
        	end,
        	get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Activate end,
        },
        IF_ACTIVE = {
          type = "toggle",
          name = L["IF_ACTIVE"],
          desc = L["IF_ACTIVE_DESCRIPTION"],
          tristate = false,
          order = 10,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
          	if val then
            	db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].IfActive = false
            else
            	db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].IfActive = true
            end
          end,
          get = function(val)
          	if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].IfActive then
           		return false
           	else
           		return true
           	end
          end,
        },
        TYPE = {
          type = "select",
          name = L["TYPE"],
          style = "dropdown",
          order = 11,
          values = {Classic = "Classic", Spread = "Spread", Stack = "Stack"},
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Type = val
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].TypeDistance = nil
          end,
          get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Type end,
        },
        TYPE_DISTANCE = {
          type = "select",
          name = L["TYPE_DISTANCE"],
          order = 12,
          disabled = function() if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Type == "Spread" or db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Type == "Stack" then return false else return true end end,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          values = {[5] = 5, [6] = 6, [8] = 8, [10] = 10, [15] = 15, [20] = 20, [25] = 25, [60] = 60},
          set = function(info, val)
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].TypeDistance = val
          end,
          get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].TypeDistance end,
        },
        PLAYERONLY = {
          type = "select",
          name = L["PLAYERONLY"],
          order = 13,
          width = "full",
          hidden = function() if spell_select ~= nil then return false else return true end end,
          values = {All = "All", Player = "Player", Focus = "Focus", Player_Focus = "Player_Focus"},
          set = function(info, val)
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].PlayerOnly = val
          end,
          get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].PlayerOnly end,
        },
        MAXSTACKS = {
          type = "toggle",
          name = L["MAXSTACKS"],
          order = 14,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          set = function(info, val)
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].MaxStacks = val
          end,
          get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].MaxStacks end,
        },
        MAXSTACKSNUMBER = {
          type = "range",
          name = L["MAXSTACKSNUMBER"],
          order = 15,
          min = 0,
          max = 50,
          step = 1,
          hidden = function() if spell_select ~= nil then return false else return true end end,
          disabled = function() if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].MaxStacks == true then return false else return true end end,
          set = function(info, val)
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].MaxStacksNumber = val
          end,
          get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].MaxStacksNumber end,
        },
        COLUMNS = {
        	type = "select",
        	name = "",
        	desc = L["COLUMNS"],
        	order = 15.5,
        	values = {[0] = "Column 1", [1] = "Column 2", [2] = "Column 3"},
        	hidden = function() if spell_select ~= nil then return false else return true end end,
        	set = function(info, val)
        		db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Columns = val
        	end,
        	get = function(val) return db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Columns end,
        },
        DELETE_SPELL_BUTTON = {
          type = "execute",
          name = L["DELETE_SPELL_BUTTON"],
          order = 16,
          hidden = function()
            if spell_select ~= nil then
              if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select].Base then
                return true
              else
                return false 
              end
            else 
              return true 
            end
          end,
          func = function()
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][spell_select] = nil
            spell_select = nil
            update_spell_raid_boss(boss_select, difficulty_select)
          end,
        },
        HEADER_ADD_SPELL = {
          type = "header",
          name = L["HEADER_ADD_SPELL"],
          hidden = function() if difficulty_select ~= nil then return false else return true end end,
          order = 17,
        },
        DESC_ADD_SPELL = {
          type = "description",
          name = "Add a new spell using the name or the ID.",
          hidden = function() if difficulty_select ~= nil then return false else return true end end,
          order = 18,
        },
        ADD_SPELL = {
          type = "input",
          order = 19,
          name = "",
          hidden = function() if difficulty_select ~= nil then return false else return true end end,
          set = function(info, val)
            spell_add = val
          end,
          get = function(val) return spell_add end,
        },
        ADD_SPELL_BUTTON = {
          type = "execute",
          name = L["ADD_SPELL_BUTTON"],
          order = 20,
          hidden = function() if select(7, GetSpellInfo(spell_add)) ~= nil and db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] == nil then return false else return true end end,
          func = function()
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))] = {}
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].IfActive = false
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].Count = 0
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].Type = "Classic"
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].TypeDistance = 0
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))]["Rôle"] = "All"
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].PlayerOnly = "All"
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].MaxStacks = false
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].MaxStacksNumber = 0
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].Columns = 0
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].Activate = true
            db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][difficulty_select][select(7, GetSpellInfo(spell_add))].Base = false

            spell_select = select(7, GetSpellInfo(spell_add))
            spell_add = nil
            update_spell_raid_boss(boss_select, difficulty_select)
          end,
        },
        ADD_SPELL_VALIDATION = {
          type = "description",
          image = function()
            if select(7, GetSpellInfo(spell_add)) ~= nil and db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] == nil then
              return select(3, GetSpellInfo(spell_add)), 20, 20
            end          
          end,
          name = function()
            if spell_add then
              if select(7, GetSpellInfo(spell_add)) == nil then
                if spell_add == "" then
                  return "" 
                else
                  return L["SPELL_DOESNT_EXIST"]
                end
              else
                if db_ITrackU.profiles[ITrack.profile].debuffs_table[boss_select][select(7, GetSpellInfo(spell_add))] == nil then
                  return select(1, GetSpellInfo(spell_add))
                else
                  return L["SPELL_ALREADY_REGISTRED"]
                end
              end
            end
          end,
          order = 21,
          hidden = function () if spell_add ~= nil then return false else return true end end,
        },
			},
		},
      },
    },
    Module_Stuns = {
      name = L["Module_Stuns_Name"],
      order = 2,
      type = "group",
      args = {
      STUN_HEADER = {
        type = "header",
        name = L["Module_Stuns_Title"],
        order = 1,
      },
      STUN_ACTIVATION = {
        type = "toggle",
        order = 2,
        name = L["Module_Stuns_Activate_Name"],
        desc = L["Module_Stuns_Activate_Description"],
        set = function(info, val)
          db_ITrackU.profiles[ITrack.profile].STUN_ACTIVATE = val
        end,
        get = function(info) return db_ITrackU.profiles[ITrack.profile].STUN_ACTIVATE end,
      },
      STUN_OPEN_FRAME = {
        type = "execute",
        order = 3,
        name = function()
          if ITrack.SpellKnown then
            return L["Module_Debuff_Close_Frame"]
          else
            return L["Module_Debuff_Open_Frame"]
          end
        end,
        desc = "",
        func = function()
          if ITrack.SpellKnown then
            ITrackU_Stuns_close_test_frame()
          else
            ITrackU_Stuns_open_test_frame()
          end
        end,
      },
      STUN_DESCRIPTION_HEADER = {
        type = "header",
        name = L["Module_Stuns_Description_Header"],
        order = 4
      },
      STUN_DESCRIPTION_DESCRIPTION = {
        type = "description",
        order = 5,
        name = L["Module_Stuns_Description"],
      },
        -- Onglet Width & Position
        WIDTHPOSITION = {
          type = "group",
          order = 1,
          name = "Width & Position",
          args = {
            HEADER_STUN_POSITION = {
              name = L["Module_Stuns_Header_Pos"],
              order = 1,
              type = "header",
            },
            STUN_POSITION_X = {
              order = 2,
              name = L["STUN_POSITION_X"],
              type = "range",
              min = -1000,
              max = 1000,
              step = 1,
              set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_X = val
                ITrackU_Stuns_Modify_Frames()
              end,
              get = function(info) return db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_X end,              
            },
            STUN_POSITION_Y = {
              order = 3,
              name = L["STUN_POSITION_Y"],
              type = "range",
              min = -1000,
              max = 1000,
              step = 1,
              set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_Y = val
                ITrackU_Stuns_Modify_Frames()
              end,
              get = function(info) return db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_Y end,  
            },
            HEADER_STUN_DIMENSION = {
              type = "header",
              order = 4,
              name = L["Module_Stuns_Header_Dimension"],
            },
            STUN_WIDTH = {
              type = "range",
              order = 5,
              name = "Width",
              min = 100,
              max = 400,
              step = 0.01,
              set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].WIDTH_STUNS = val
                ITrackU_Stuns_Modify_Frames()
              end,
              get = function(info) return db_ITrackU.profiles[ITrack.profile].WIDTH_STUNS end,
            },
            STUN_HEIGHT = {
              type = "range",
              order = 6,
              name = L["STUN_HEIGHT"],
              min = 10,
              max = 40,
              step = 0.01,
              set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS = val
                ITrackU_Stuns_Modify_Frames()
              end,
              get = function(info) return db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS end,             
            },
            STUN_HEIGHT_BETWEEN_STUNS = {
              type = "range",
              order = 7,
              name = L["STUN_HEIGHT_BETWEEN_STUNS"],
              min = 0,
              max = 10,
              step = 0.01,
              set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_STUNS = val
                ITrackU_Stuns_Modify_Frames()
              end,
              get = function(info) return db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_STUNS end,                
            },
          },
        },
        COLORS = {
          type = "group",
          order = 2,
          name = L["ColorPanel"],
          args = {
            COLORS_HEADER = {
              type = "header",
              name = L["ColorPanel"],
              order = 1,
            },
            COLORS_STUNS_SPELLS_OK = {
                type = "color",
                desc = "",
                name = L["COLORS_STUNS_SPELLS_OK"],
                hasAlpha = true,
                width = "full",
                order = 2,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_OK = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_OK = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_OK = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_SPELL_OK = val4
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_SPELL_OK end,
              },
            COLORS_STUNS_SPELLS_KO = {
                type = "color",
                desc = "",
                name = L["COLORS_STUNS_SPELLS_KO"],
                hasAlpha = true,
                order = 4,
                set = function(info, val1, val2, val3, val4)
                  db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_KO = val1
                  db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_KO = val2
                  db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_KO = val3
                  db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_SPELL_KO = val4
                end,
                get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_SPELL_KO end,
              },
            COLORS_A_STUNS_SPELL_STATUSBAR_KO = {
              type = "range",
              desc = "",
              min = 0,
              max = 1,
              step = 0.01,
              name = L["COLORS_A_STUNS_SPELL_STATUSBAR_KO"],
              order = 5,
              set = function(info, val)
                db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_STATUSBAR_SPELL_KO = val
              end,
              get = function(info) return db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_STATUSBAR_SPELL_KO end,
            },
            FONT_STUNS_HEADER = {
              type = "header",
              name = L["FONT_STUNS_HEADER"],
              order = 6,
            },
          },
        },
			},
    },
		Profiles = {
			name = L["Profiles"],
			type = "group",
			order = 5,
			args = {
        SELECT_PROFILE = {
          type = "select",
          name = L["SELECT_PROFILE"],
          values = function()
            return db_ITrackU.profileKeys
          end,
          order = 5,
          width = "full",
        },
      },
    },
  }	
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