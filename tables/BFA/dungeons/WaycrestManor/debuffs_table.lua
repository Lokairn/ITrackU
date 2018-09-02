if ITrack == nil then ITrack = {} end

-- BDD of dungeons difficulty
-- ITrack.dungeons_difficulty = {
  -- [1] = "Normal",
  -- [2] = "Heroic",
  -- [23] = "Mythic",
  -- [8] = "Mythic +",

-- Heartsbane Triad
table.insert(ITrack.defaults.profile.debuffs_table , 2113,{
  -- Normal
  [1] = {
    -- Lentille mortelle
    [260703] = {
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
    -- Lentille mortelle
    [260703] = {
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
    -- Lentille mortelle
    [260703] = {
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
    -- Lentille mortelle
    [260703] = {
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

  --Soulbound Goliath
--table.insert(ITrack.defaults.profile.debuffs_table , 2114,{
--})      

--Raal the Gluttonous
table.insert(ITrack.defaults.profile.debuffs_table , 2115,{
  -- Normal
  [1] = {
    -- ????
    [264712] = {
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
    [264712] = {
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
    [264712] = {
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
    [264712] = {
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

--Lord and Lady Waycrest
table.insert(ITrack.defaults.profile.debuffs_table , 2116,{
  -- Normal
  [1] = {
    -- ????
    [261438] = {
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
    [261440] = {
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
    [261438] = {
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
    [261440] = {
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
    [261438] = {
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
    [261440] = {
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
    [261438] = {
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
    [261440] = {
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

--Gorak Tul
table.insert(ITrack.defaults.profile.debuffs_table , 2117,{
  -- Normal
  [1] = {
    -- Lentille mortelle
    [268202] = {
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
    -- Lentille mortelle
    [268202] = {
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
    -- Lentille mortelle
    [268202] = {
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
    -- Lentille mortelle
    [268202] = {
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
