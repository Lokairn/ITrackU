﻿if ITrack == nil then ITrack = {} end

-- BDD of dungeons difficulty
-- ITrack.dungeons_difficulty = {
  -- [1] = "Normal",
  -- [2] = "Heroic",
  -- [23] = "Mythic",
  -- [8] = "Mythic +",

--The Golden Serpen
table.insert(ITrack.defaults.profile.debuffs_table , 2139,{
  -- Normal
  [1] = {
    -- Or en fusion
    [265914] = {
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
    -- Appel du lucre
    [265923] = {
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
    -- Lustre
    [265991] = {
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
    -- Crachat d'or
    [265773] = {
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
    -- Battement de queue
    [265908] = {
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
    -- Or en fusion
    [265914] = {
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
    -- Appel du lucre
    [265923] = {
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
    -- Lustre
    [265991] = {
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
    -- Crachat d'or
    [265773] = {
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
    -- Battement de queue
    [265908] = {
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
    -- Or en fusion
    [265914] = {
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
    -- Appel du lucre
    [265923] = {
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
    -- Lustre
    [265991] = {
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
    -- Crachat d'or
    [265773] = {
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
    -- Battement de queue
    [265908] = {
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
    -- Or en fusion
    [265914] = {
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
    -- Appel du lucre
    [265923] = {
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
    -- Lustre
    [265991] = {
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
    -- Crachat d'or
    [265773] = {
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
    -- Battement de queue
    [265908] = {
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

  --Mummification Construct
table.insert(ITrack.defaults.profile.debuffs_table , 2142,{
  -- Normal
  [1] = {
    -- Dessèchement
    [267626] = {
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
    -- Enfermer
    [267702] = {
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
    -- Débattre
    [267764] = {
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
    -- Drain des fluides
    [267618] = {
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
    -- Brulure de la corruption
    [267639] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 10,
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
    -- Dessèchement
    [267626] = {
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
    -- Enfermer
    [267702] = {
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
    -- Débattre
    [267764] = {
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
    -- Drain des fluides
    [267618] = {
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
    -- Brulure de la corruption
    [267639] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 10,
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
    -- Dessèchement
    [267626] = {
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
    -- Enfermer
    [267702] = {
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
    -- Débattre
    [267764] = {
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
    -- Drain des fluides
    [267618] = {
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
    -- Brulure de la corruption
    [267639] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 10,
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
    -- Dessèchement
    [267626] = {
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
    -- Enfermer
    [267702] = {
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
    -- Débattre
    [267764] = {
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
    -- Drain des fluides
    [267618] = {
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
    -- Brulure de la corruption
    [267639] = {
      ["IfActive"] = false,
      ["PlayerOnly"] = "All",
      ["Count"] = 0,
      ["Type"] = "Spread",
      ["TypeDistance"] = 10,
      ["Rôle"] = "All",
      ["MaxStacks"] = false,
      ["MaxStacksNumber"] = 5,
      ["Columns"] = 0,
      ["Activate"] = true,
      ["Base"] = true,
    },
  },
})

  --The Warring Warlords
table.insert(ITrack.defaults.profile.debuffs_table , 2140,{
  -- Normal
  [1] = {
    -- Revers débilitant
    [266237] = {
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
    -- Hache tranchante
    [266231] = {
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
    -- Fracas foudroyant
    [267257] = {
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
    -- Nova de poison
    [267273] = {
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
    -- Appel des éléments
    [267060] = {
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
    -- Débarouler
    [266951] = {
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
    -- Défenses brisées
    [266238] = {
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
    -- Haches tourbillonnantes
    [266206] = {
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
    -- Revers débilitant
    [266237] = {
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
    -- Hache tranchante
    [266231] = {
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
    -- Fracas foudroyant
    [267257] = {
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
    -- Nova de poison
    [267273] = {
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
    -- Appel des éléments
    [267060] = {
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
    -- Débarouler
    [266951] = {
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
    -- Défenses brisées
    [266238] = {
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
    -- Haches tourbillonnantes
    [266206] = {
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
    -- Revers débilitant
    [266237] = {
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
    -- Hache tranchante
    [266231] = {
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
    -- Fracas foudroyant
    [267257] = {
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
    -- Nova de poison
    [267273] = {
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
    -- Appel des éléments
    [267060] = {
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
    -- Débarouler
    [266951] = {
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
    -- Défenses brisées
    [266238] = {
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
    -- Haches tourbillonnantes
    [266206] = {
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
    -- Revers débilitant
    [266237] = {
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
    -- Hache tranchante
    [266231] = {
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
    -- Fracas foudroyant
    [267257] = {
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
    -- Nova de poison
    [267273] = {
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
    -- Appel des éléments
    [267060] = {
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
    -- Débarouler
    [266951] = {
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
    -- Défenses brisées
    [266238] = {
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
    -- Haches tourbillonnantes
    [266206] = {
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

  --Dazar, The First King
table.insert(ITrack.defaults.profile.debuffs_table , 0000,{
  -- Normal
  [1] = {
    -- Gardien éternel
    [269351] = {
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
    -- Combo de lames
    [268586] = {
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
    -- Bond sismique
    [268932] = {
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
    -- Gardien éternel
    [269351] = {
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
    -- Combo de lames
    [268586] = {
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
    -- Bond sismique
    [268932] = {
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
    -- Gardien éternel
    [269351] = {
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
    -- Combo de lames
    [268586] = {
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
    -- Bond sismique
    [268932] = {
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
    -- Gardien éternel
    [269351] = {
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
    -- Combo de lames
    [268586] = {
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
    -- Bond sismique
    [268932] = {
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