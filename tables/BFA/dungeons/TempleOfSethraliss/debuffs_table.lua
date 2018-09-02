if ITrack == nil then ITrack = {} end

-- BDD of dungeons difficulty
-- ITrack.dungeons_difficulty = {
  -- [1] = "Normal",
  -- [2] = "Heroic",
  -- [23] = "Mythic",
  -- [8] = "Mythic +",

-- Adderis and Aspix
--table.insert(ITrack.defaults.profile.debuffs_table , 2124,{
--})

-- Merektha
table.insert(ITrack.defaults.profile.debuffs_table , 2125,{
  -- Normal
  [1] = {
    -- Cytotoxine
    [267027] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- ????
    [269970] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Noeud de serpents
    [263958] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- ?????
    [263927] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Heroic
  [2] = {
    -- ????
    [269970] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Cytotoxine
    [267027] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Noeud de serpents
    [263958] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- ?????
    [263927] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Mythic
  [23] = {
    -- ????
    [269970] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Cytotoxine
    [267027] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Noeud de serpents
    [263958] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- ?????
    [263927] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Mythic +
  [8] = {
    -- ????
    [269970] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Cytotoxine
    [267027] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Noeud de serpents
    [263958] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- ?????
    [263927] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
})
  
-- Galvazzt
table.insert(ITrack.defaults.profile.debuffs_table , 2126,{
  -- Normal
  [1] = {
    -- ????
    [266923] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Heroic
  [2] = {
    -- ?????
    [266923] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Mythic
  [23] = {
    -- ????
    [266923] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Mythic +
  [8] = {
    -- ???
    [266923] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
})

-- Avatar of Sethraliss
table.insert(ITrack.defaults.profile.debuffs_table , 2127,{
  -- Normal
  [1] = {
    -- ?????
    [268007] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Peste
    [269686] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Pulse
    [268024] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Heroic
  [2] = {
    -- ?????
    [268007] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Peste
    [269686] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Pulse
    [268024] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Mythic
  [23] = {
    -- ?????
    [268007] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Peste
    [269686] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Pulse
    [268024] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
  -- Mythic +
  [8] = {
    -- ?????
    [268007] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Peste
    [269686] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
    -- Pulse
    [268024] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Classic",
      ["TypeDistance"] = 0,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
})      