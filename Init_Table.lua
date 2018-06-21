ITrack = {}

-- BDD of dungeons
ITrack.dungeons = {
  ["Battle for Azeroth"] = {
  
  },
  ["Legion"] = {
    ["Black Rook Hold"] = {
      [1832] = "Amalgam of Souls",
      [1833] = "Illysanna Ravencrest",
      [1834] = "Smashspite",
      [1835] = "Kurtalos Ravencrest"
    },
    ["Cathedral of Eternal Night"] = {
      [2055] = "Agronox",
      [2057] = "Thrashbite the Scornful",
      [2053] = "Domatrax",
      [2039] = "Mephistroth"
    },
    ["Court of Stars"] = {
      [1868] = "Patrol Captain Gerdo",
      [1869] = "Talixae Flamewreath",
      [1870] = "Advisor Melandrus"
    },
    ["Darkheart Thicket"] = {
      [1836] = "Archdruid Glaidalis",
      [1837] = "Oakheart",
      [1838] = "Dresaron",
      [1839] = "Shade of Xavius"
    },
    ["Eye of Azshara"] = {
      [1810] = "Warlord Parjesh",
      [1811] = "Lady Hatecoil",
      [1813] = "Serpentrix",
      [1812] = "King Deepbeard",
      [1814] = "Wrath of Azshara"
    },
    ["Halls of Valor"] = {
      [1805] = "Hymdall",
      [1807] = "Fenryr",
      [1806] = "Hyrja",
      [1808] = "God-King Skovald",
      [1809] = "Odyn"
    },
    ["Maw of Souls"] = {
      [1822] = "Ymiron",
      [1823] = "Harbaron",
      [1824] = "Helya"
    },
    ["Neltharion's Lair"] = {
      [1790] = "Rokmora",
      [1791] = "Ularogg Cragshaper",
      [1792] = "Naraxas",
      [1793] = "Dargrul"
    },
    ["Return to Karazhan"] = {
      [1960] = "Attumen the Huntsman",
      [1964] = "The Curator",
      [1954] = "Maiden of Virtue",
      [1959] = "Mana Devourer",
      [1961] = "Moroes",
      [1957] = "Opera Hall",
      [1965] = "Shade of Medivh",
      [2017] = "Viz'aduum the Watcher"      
    },
    ["The Arcway"] = {
      [1829] = "Advisor Vandros",
      [1825] = "Corstilax",
      [1828] = "General Xakal",
      [1827] = "Ivanyr",
      [1826] = "Naltira"
    },
    ["Vault of the Wardens"] = {
      [1816] = "Ashgolm",
      [1817] = "Glazer",
      [1818] = "Cordana Felsong",
      [1850] = "Inquisitor Tormentorum",
      [1815] = "Tirathon Saltheril"
    },
    ["Violet Hold"] = {
      [1852] = "Anub'esset",
      [1856] = "Fel Lord Betrug",
      [1848] = "Festerface",
      [1846] = "Kaahrj",
      [1847] = "Millificent Manastorm",
      [1851] = "Saelorn",
      [1845] = "Shivermaw",
      [1855] = "Thalena"
    },
    ["Seat of the Triumvirate"] = {
      [2068] = "L'ura",
      [2066] = "Saprish",
      [2067] = "Viceroy Nezhar",
      [2065] = "Zuraal"
    }
  },
}

-- BDD of raids
ITrack.raids = {
  ["Legion"] = {
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
  },
  ["Battle for Azeroth"] = {
  
  },
}

-- Defauts configuration at the first launch of the addon
ITrack.Defaults = {
	["ENABLE_CLASS_COLOR"] = false,
	["COLOR_A_CLASS_COLOR"] = 0.3,
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
}

  --set all variables tables for the test frame
  if debuffs_table == nil then debuffs_table = {} end
  if debuffs_table ~= nil then
    debuffs_table[1111] = {
      [23920] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Classic",
        ["TypeDistance"] = 0,
        ["Rôle"] = "All",
        ["MaxStacks"] = true,
        ["MaxStacksNumber"] = 4,
    		["Columns"] = 1,
    		["Activate"] = true,
      },
      [132404] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Spread",
        ["TypeDistance"] = 8,
        ["Rôle"] = "All",
        ["MaxStacks"] = true,
        ["MaxStacksNumber"] = 4,
    		["Columns"] = 0,
    		["Activate"] = true,
      },
      [18499] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Classic",
        ["TypeDistance"] = 0,
        ["Rôle"] = "All",
        ["MaxStacks"] = true,
        ["MaxStacksNumber"] = 4,
    		["Columns"] = 0,
    		["Activate"] = true,
      },
      [188783] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Stack",
        ["TypeDistance"] = 8,
        ["Rôle"] = "All",
        ["MaxStacks"] = true,
        ["MaxStacksNumber"] = 4,
    		["Columns"] = 0,
    		["Activate"] = true,
      },
    }
  end

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