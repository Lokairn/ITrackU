if ITrack == nil then ITrack = {} end
if ITrack.dungeons == nil then ITrack.dungeons = {} end
if ITrack.raids == nil then ITrack.raids = {} end

local L = LibStub("AceLocale-3.0"):GetLocale("ITrackU")

-- BDD of dungeons
ITrack.dungeons["Battle for Azeroth"] = {
  [L["Atal Dazar"]] = {
    [2084] = L["Alunza"],
    [2086] = L["Rezan"],
    [2085] = L["Vol'kaal"],
    [2087] = L["Yazma"],
  },
  [L["Freehold"]] = {
    [2095] = L["Ring of Booty"],
    [2094] = L["Council o' Captains"],
    [2093] = L["Skycap'n Kragg"],
    [2096] = L["Harlan Sweete"],
  },
  [L["Kings Rest"]] = {
    --[XXXX] = L["Dazar"],
    [2139] = L["The Golden Serpent"],
    [2142] = L["Mummification Construct"],
    [2140] = L["The Warring Warlords"],
  },
  [L["Shrine Of The Storm"]] = {
    [2130] = L["Aqu'sirr"],
    [2131] = L["Tidesage Council"],
    [2132] = L["Lord Stormsong"],
    [2133] = L["Volzith"],
  },
  [L["Siege Of Boralus"]] = {
    [2100] = L["Behamat"],
    [2097] = L["Sergeant Bainbridge"],
    [2099] = L["Hadal Darkfathom"],
    [2019] = L["Dread Captain Lockwood"],
  },
  [L["Temple Of Sethraliss"]] = {
    [2124] = L["Adderis and Aspix"],
    [2127] = L["Avatar of Sethraliss"],
    [2126] = L["Galvazzt"],
    [2125] = L["Merektha"],
  },
  [L["The Motherlode"]] = {
    [2106] = L["Tik'ali"],
    [2107] = L["Rixxa Fluxflame"],
    [2108] = L["Mogul Razzdunk"],
    [2105] = L["Coin-Operated Crowd Pummeler"],
  },
  [L["Tol Dagor"]] = {
    [2102] = L["Jes Howlis"],
    [2104] = L["Overseer Korgus"],
    [2101] = L["The Sand Queen"],
    [2103] = L["Knight Captain Valyri"],
  },
  [L["Underrot"]] = {
    [2123] = L["Unbound Abomination"],
    [2118] = L["Infested Crawg"],
    [2111] = L["Elder Leaxa"],
    [2112] = L["Sporecaller Zancha"],
  },
  [L["Waycrest Manor"]] = {
    [2114] = L["Soulbound Goliath"],
    [2117] = L["Gorak Tul"],
    [2113] = L["Heartsbane Triad"],
    [2115] = L["Raal the Gluttonous"],
    [2116] = L["Lord and Lady Waycrest"],
  },
}

-- BDD of raids
ITrack.raids["Battle for Azeroth"] = {
  [L["Uldir"]] = {
    [2128] = L["Devourer"],
    [2122] = L["Ghuun"],
    [2141] = L["Mother"],
    [2135] = L["Mythrax"],
    [2144] = L["Taloc"],
    [2134] = L["Vectis"],
    [2136] = L["Zekvoz"],
    [2145] = L["Zul"],
  }
}