if ITrack == nil then ITrack = {} end
if ITrack.dungeons == nil then ITrack.dungeons = {} end
if ITrack.raids == nil then ITrack.raids = {} end

-- BDD of dungeons
ITrack.dungeons["Battle for Azeroth"] = {
  ["Atal Dazar"] = {
    [2084] = "Alunza",
    [2086] = "Rezan",
    [2085] = "Vol'kaal",
    [2087] = "Yazma",
  },
  ["Freehold"] = {
    [2095] = "Ring of Booty",
    [2094] = "Council o' Captains",
    [2093] = "Skycap'n Kragg",
    [2096] = "Harlan Sweete",
  },
  ["Kings Rest"] = {
    --[XXXX] = "Dazar, The First King",
    [2139] = "The Golden Serpent",
    [2142] = "Mummification Construct",
    [2140] = "The Warring Warlords",
  },
  ["Shrine Of The Storm"] = {
    [2130] = "Aqu'sirr",
    [2131] = "Tidesage Coucil",
    [2132] = "Lord Stormsong",
    [2133] = "Vol'zith the Whisperer",
  },
  ["Siege Of Boralus"] = {
    [2100] = "Behamat",
    [2097] = "Sergeant Bainbridge",
    [2099] = "Hadal Darkfathom",
    [2019] = "Dread Captain Lockwood",
  },
  ["Temple Of Sethraliss"] = {
    [2124] = "Adderis and Aspix",
    [2127] = "Avatar of Sethraliss",
    [2126] = "Galvazzt",
    [2125] = "Merektha",
  },
  ["The Motherlode"] = {
    [2106] = "Tik'ali",
    [2107] = "Rixxa Fluxflame",
    [2108] = "Mogul Razzdunk",
    [2105] = "Coin-Operated Crowd Pummeler",
  },
  ["Tol Dagor"] = {
    [2102] = "Jes Howlis",
    [2104] = "Overseer Korgus",
    [2101] = "The Sand Queen",
    [2103] = "Knight Captain Valyri",
  },
  ["Underrot"] = {
    [2123] = "Unbound Abomination",
    [2118] = "Infested Crawg",
    [2111] = "Elder Leaxa",
    [2112] = "Sporecaller Zancha",
  },
  ["Waycrest Manor"] = {
    [2114] = "Soulbound Goliath",
    [2117] = "Gorak Tul",
    [2113] = "Heartsbane Triad",
    [2115] = "Raal the Gluttonous",
    [2116] = "Lord and Lady Waycrest",
  },
}

-- BDD of raids
ITrack.raids["Battle for Azeroth"] = {
  ["Uldir"] = {
    [2128] = "Devourer",
    [2122] = "Ghuun",
    [2141] = "Mother",
    [2135] = "Mythrax",
    [2144] = "Taloc",
    [2134] = "Vectis",
    [2136] = "Zekvoz",
    [2145] = "Zul",
  }
}