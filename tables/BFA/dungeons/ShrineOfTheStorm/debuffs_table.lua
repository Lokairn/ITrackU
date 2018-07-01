  if debuffs_table == nil then debuffs_table = {} end

-- BDD of dungeons difficulty
-- ITrack.dungeons_difficulty = {
  -- [1] = "Normal",
  -- [2] = "Heroic",
  -- [23] = "Mythic",
  -- [8] = "Mythic +",
  
  --Alunza
    if debuffs_table[2084] == nil then
      debuffs_table[2084] = {
        -- Normal
        [1] = {
          -- Corruption Sanguine
          [255558] = {
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
        -- Or en fusion
          [255584] = {
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
        },
      }
    end

  --Rezan
      