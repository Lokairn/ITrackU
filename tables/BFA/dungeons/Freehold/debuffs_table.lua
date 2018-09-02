if ITrack == nil then ITrack = {} end

-- BDD of dungeons difficulty
-- ITrack.dungeons_difficulty = {
  -- [1] = "Normal",
  -- [2] = "Heroic",
  -- [23] = "Mythic",
  -- [8] = "Mythic +",

-- Cap'taine céleste Kragg
table.insert(ITrack.defaults.profile.debuffs_table, 2093,{
  -- Normal
  [1] = {
  -- Breuvage revitalisant
    [256060] = {
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
  -- ???
    [256016] = {
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
  -- Breuvage revitalisant
    [256060] = {
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
  -- ???
    [256016] = {
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
  -- Breuvage revitalisant
    [256060] = {
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
  -- ???
    [256016] = {
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
  -- Breuvage revitalisant
    [256060] = {
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
  -- ???
    [256016] = {
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

  --Conseil des capitaines
table.insert(ITrack.defaults.profile.debuffs_table, 2094,{
  -- Normal
  [1] = {
    -- ????
    [258875] = {
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
    [258875] = {
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
    [258875] = {
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
    [258875] = {
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
      
-- Arène du Butin
table.insert(ITrack.defaults.profile.debuffs_table, 2095,{
  -- Normal
  [1] = {
    --  ????
    [256363] = {
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
    --  ????
    [272554] = {
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
    --  ????
    [256363] = {
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
    --  ????
    [272554] = {
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
    --  ????
    [256363] = {
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
    --  ????
    [272554] = {
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
    --  ????
    [256363] = {
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
    --  ????
    [272554] = {
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

-- Harlan Sweete
table.insert(ITrack.defaults.profile.debuffs_table, 2096, {
  -- Normal
  [1] = {
    -- Barrage au canon
    [257305] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 5,
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
    -- Barrage au canon
    [257305] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 5,
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
    -- Barrage au canon
    [257305] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 5,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    }, 
  }, 
  -- Mythic+
  [8] = {
    -- Barrage au canon
    [257305] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 5,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    }, 
  },  
})