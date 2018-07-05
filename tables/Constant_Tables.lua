if ITrack == nil then ITrack = {} end

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
