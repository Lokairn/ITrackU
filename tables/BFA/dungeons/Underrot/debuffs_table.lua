if ITrack == nil then ITrack = {} end

-- BDD of dungeons difficulty
-- ITrack.dungeons_difficulty = {
  -- [1] = "Normal",
  -- [2] = "Heroic",
  -- [23] = "Mythic",
  -- [8] = "Mythic +",

-- Elder Leaxa
table.insert(ITrack.defaults.profile.debuffs_table , 2111,{
  -- Normal
  [1] = {
    -- Souillure de G'huun
    [260685] = {
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
    -- Souillure de G'huun
    [260685] = {
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
    -- Souillure de G'huun
    [260685] = {
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
    -- Souillure de G'huun
    [260685] = {
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

  --Infested Crawg
--table.insert(ITrack.defaults.profile.debuffs_table , 2118,{
--}) 

--Sporecaller Zancha
table.insert(ITrack.defaults.profile.debuffs_table , 2112,{
  -- Normal
  [1] = {
    -- Soulèvement
    [259718] = {
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
    [273226] = {
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
    -- Soulèvement
    [259718] = {
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
    [273226] = {
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
    -- Soulèvement
    [259718] = {
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
    [273226] = {
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
    -- Soulèvement
    [259718] = {
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
    [273226] = {
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

--Unbound Abomination
table.insert(ITrack.defaults.profile.debuffs_table , 2123,{
  -- Normal
  [1] = {
    -- ????
    [269838] = {
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
    [269838] = {
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
    [269838] = {
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
    [269838] = {
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