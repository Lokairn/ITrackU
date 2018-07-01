ITrack = {}
if ITrack.dungeons == nil then ITrack.dungeons = {} end
if ITrack.raids == nil then ITrack.raids = {} end

-- BDD of dungeons difficulty
ITrack.dungeons_difficulty = {
  [1] = "Normal",
  [2] = "Heroic",
  [23] = "Mythic",
  [8] = "Mythic +",
}
-- BDD of raids difficulty
ITrack.raids_difficulty = {
  [14] = "Normal",
  [15] = "Heroic",
  [16] = "Mythic",
}

-- BDD des MapIDs
ITrack.dungeons_mapid = {
    [1501] = {
      ["extension"] = "Légion",
      ["dungeon"] = "Black Rook Hold",
    },
}

-- Defauts configuration at the first launch of the addon
ITrack.Defaults = {
	["ENABLE_CLASS_COLOR_PLAYER"] = false,
	["ENABLE_CLASS_COLOR_FOCUS"] = false,
	["ENABLE_CLASS_COLOR_MATE"] = false,
	["COLOR_A_CLASS_COLOR_PLAYER"] = 0.3,
	["COLOR_A_CLASS_COLOR_FOCUS"] = 0.3,
	["COLOR_A_CLASS_COLOR_MATE"] = 0.3,
	["HEIGHT_TITLE"] = 27,
	["HEIGHT_DEBUFFED"] = 20,
	["WIDTH_GLOBAL"] = 150,
	["WIDTH_PLAYER_DISTANCE"]= 10,
	["WIDTH_ECART_GLOBAL_PLAYER_DISTANCE"] = 3,
	["WIDTH_BETWEEN_COLUMNS"] = 10,
	["HEIGHT_BETWEEN_TITLE"] = 1,
	["HEIGHT_BETWEEN_DEBUFFED"] = 1,
	["HEIGHT_BETWEEN_TITLE_DEBUFFED"] = 0,
	["POSITION_X"] = 0,
	["POSITION_Y"] = 0,
	["COLOR_R_TITRE"] = 0.368,
	["COLOR_G_TITRE"] = 0.368,
	["COLOR_B_TITRE"] = 0.368,
	["COLOR_A_TITRE"] = 0.9,
	["COLOR_R_DEBUFFED_PLAYER"] = 0.208,
	["COLOR_G_DEBUFFED_PLAYER"] = 0.80,
	["COLOR_B_DEBUFFED_PLAYER"] = 0.192,
	["COLOR_A_DEBUFFED_PLAYER"] = 0.5,
	["COLOR_R_DEBUFFED_FOCUS"] = 0.632,
	["COLOR_G_DEBUFFED_FOCUS"] = 0.348,
	["COLOR_B_DEBUFFED_FOCUS"] = 0.828,
	["COLOR_A_DEBUFFED_FOCUS"] = 0.5,
	["COLOR_R_DEBUFFED_MATE"] = 0.78,
	["COLOR_G_DEBUFFED_MATE"] = 0.828,
	["COLOR_B_DEBUFFED_MATE"] = 0.464,
	["COLOR_A_DEBUFFED_MATE"]= 0.5,
	["COLOR_R_DEBUFFED_MAXSTACK"] = 1,
	["COLOR_G_DEBUFFED_MAXSTACK"] = 0,
	["COLOR_B_DEBUFFED_MAXSTACK"] = 0,
	["COLOR_A_DEBUFFED_MAXSTACK"] = 0.5,
	["COLOR_A_DEBUFFED_STATUSBAR"] = 1,
	["COLOR_R_DISTANCE_OK"] = 0,
	["COLOR_G_DISTANCE_OK"] = 1,
	["COLOR_B_DISTANCE_OK"] = 0,
	["COLOR_A_DISTANCE_OK"] = 1,
	["COLOR_R_DISTANCE_KO"] = 1,
	["COLOR_R_DISTANCE_KO"] = 0,
	["COLOR_R_DISTANCE_KO"] = 0,
	["COLOR_R_DISTANCE_KO"] = 1,
  ["FONT_TITRE"] = "PT Sans Narrow",
  ["FONT_DEBUFFED_NAME"] = "PT Sans Narrow",
  ["FONT_DEBUFFED_STACK"] = "PT Sans Narrow",
  ["FONT_TITRE_SIZE"] = 15,
  ["FONT_DEBUFFED_NAME_SIZE"] = 15,
  ["FONT_DEBUFFED_STACK_SIZE"] = 15,
  ["FONT_TITRE_R_COLOR"] = 1,
  ["FONT_TITRE_G_COLOR"] = 0,
  ["FONT_TITRE_B_COLOR"] = 0,
  ["FONT_TITRE_A_COLOR"] = 1,
  ["FONT_DEBUFFED_NAME_R_COLOR"] = 0,
  ["FONT_DEBUFFED_NAME_G_COLOR"] = 1,
  ["FONT_DEBUFFED_NAME_B_COLOR"] = 0,
  ["FONT_DEBUFFED_NAME_A_COLOR"] = 1,
  ["FONT_DEBUFFED_STACK_R_COLOR"] = 0,
  ["FONT_DEBUFFED_STACK_G_COLOR"] = 0,
  ["FONT_DEBUFFED_STACK_B_COLOR"] = 1,
  ["FONT_DEBUFFED_STACK_A_COLOR"] = 1,
  ["STUN_ACTIVATE"] = false,
  ["WIDTH_STUN"] = 200,
  ["HEIGHT_STUN"] = 20,
  ["POSITION_X_STUN"] = 0,
  ["POSITION_Y_STUN"] = -100,
}

  --set all variables tables for the test frame
  if debuffs_table == nil then debuffs_table = {} end
    debuffs_table[2222] = {
      [2] = {
        [23920] = {
          ["IfActive"] = false,
          ["PlayerOnly"] = "All",
          ["Count"] = 0,
          ["Type"] = "Classic",
          ["TypeDistance"] = 0,
          ["Rôle"] = "All",
          ["MaxStacks"] = true,
          ["MaxStacksNumber"] = 5,
          ["Columns"] = 1,
          ["Activate"] = true,
        },
        [132404] = {
          ["IfActive"] = false,
          ["PlayerOnly"] = "All",
          ["Count"] = 0,
          ["Type"] = "Spread",
          ["TypeDistance"] = 8,
          ["Rôle"] = "All",
          ["MaxStacks"] = true,
          ["MaxStacksNumber"] = 5,
          ["Columns"] = 0,
          ["Activate"] = true,
        },
        [18499] = {
          ["IfActive"] = false,
          ["PlayerOnly"] = "All",
          ["Count"] = 0,
          ["Type"] = "Classic",
          ["TypeDistance"] = 0,
          ["Rôle"] = "All",
          ["MaxStacks"] = true,
          ["MaxStacksNumber"] = 5,
          ["Columns"] = 0,
          ["Activate"] = true,
        },
        [188783] = {
          ["IfActive"] = false,
          ["PlayerOnly"] = "All",
          ["Count"] = 0,
          ["Type"] = "Stack",
          ["TypeDistance"] = 8,
          ["Rôle"] = "All",
          ["MaxStacks"] = true,
          ["MaxStacksNumber"] = 5,
          ["Columns"] = 0,
          ["Activate"] = true,
        },
      },
    }

-- Fonts
ITrack.Fonts = {
  ["Interface\\Addons\\ITrackU\\media\\fonts\\Homespun.ttf"] = "Homespun",
  ["Interface\\Addons\\ITrackU\\media\\fonts\\PT_Sans_Narrow.ttf"] = "PT Sans Narrow",
  ["Interface\\Addons\\ITrackU\\media\\fonts\\Expressway.ttf"] = "Expressway",
  ["Interface\\Addons\\ITrackU\\media\\fonts\\Action_Man.ttf"] = "Action Man",
  ["Interface\\Addons\\ITrackU\\media\\fonts\\DieDieDie.ttf"] = "Die Die Die!",
  ["Interface\\Addons\\ITrackU\\media\\fonts\\Continuum_Medium.ttf"] = "Continuum Medium",
}
-- Class colors
ITrack.Raid_Class_Color = {
  ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
  ["WARLOCK"] = { r = 0.53, g = 0.53, b = 0.93, colorStr = "ff8788ee" },
  ["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "ffffffff" },
  ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
  ["MAGE"] = { r = 0.25, g = 0.78, b = 0.92, colorStr = "ff3fc7eb" },
  ["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "fffff569" },
  ["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
  ["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "ff0070de" },
  ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
  ["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23, colorStr = "ffc41f3b" },
  ["MONK"] = { r = 0.0, g = 1.00 , b = 0.59, colorStr = "ff00ff96" },
  ["DEMONHUNTER"] = { r = 0.64, g = 0.19, b = 0.79, colorStr = "ffa330c9" },
};

-- Test Roster
ITrack.Roster_Test = {
	["Player"] = {
		["Class"] = "WARRIOR",
		["Role"] = "TANK",
	},
	["Focus"] = {
		["Class"] = "DEATHKNIGHT",
		["Role"] = "TANK",
	},
	["Mate1"] = {
		["Class"] = "DRUID",
		["Role"] = "HEAL",
	},
	["Mate2"] = {
		["Class"] = "MONK",
		["Role"] = "HEAL",
	},
	["Mate3"] = {
		["Class"] = "HUNTER",
		["Role"] = "DPS",
	},
	["Mate4"] = {
		["Class"] = "ROGUE",
		["Role"] = "DPS",
	},
	["Mate5"] = {
		["Class"] = "PRIEST",
		["Role"] = "DPS",
	},
	["Mate6"] = {
		["Class"] = "WARLOCK",
		["Role"] = "DPS",
	},
}
