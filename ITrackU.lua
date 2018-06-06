---------------------------------------------------------------------------------------------------
------------------------------------   CONSTANT DECLARATIONS   ------------------------------------
---------------------------------------------------------------------------------------------------

local ITrackU = {}

-- IfActive = Yes/No
-- Type = Classic / Stack / Spread
-- TypeDistance = M or nil
-- Rôle = Tank / DPS / Heal / All
-- Max Stacks
-- PlayerOnly : All / Player / Focus / Player_Focus

local debuffs_table_init = {
  [1111] = {
            [23920] = {
                        ["IfActive"] = "No",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [18499] = {
                        ["IfActive"] = "No",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [203324] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [132404] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Stack",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [188783] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Spread",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [125565] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Spread",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       }
           },
  [2074] = {
            [245098] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [251445] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [248815] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Spread",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                         },
            [244768] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       },
            [248819] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Stack",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank",
                        ["PlayerOnly"] = "All"
                       }
          }
}

---------------------------------------------------------------------------------------------------
--------------------------------   SAVED VARIABLES DECLARATIONS   ---------------------------------
---------------------------------------------------------------------------------------------------

-- Set all variables from saved variables or default ones if not available
local function addon_loaded(event, arg1)
  if arg1 == "ITrackU" then
    print("Bienvenue sur ITrackU version 1.00, tapez /ITU afin d'accéder au menu de configuration en jeu.")
    if debuffs_table == nil then print("CETTE TABLE NE SE CHARGE PAS") end
    if debuffs_table == nil then debuffs_table = debuffs_table_init end
     if db_variable == nil then db_variable = {} end
    if db_variable.HEIGHT_TITLE == nil then db_variable.HEIGHT_TITLE = 27 end
    if db_variable.HEIGHT_DEBUFFED == nil then db_variable.HEIGHT_DEBUFFED = 20 end
    if db_variable.WIDTH_GLOBAL == nil then db_variable.WIDTH_GLOBAL = 150 end
    if db_variable.WIDTH_PLAYER_DISTANCE == nil then db_variable.WIDTH_PLAYER_DISTANCE = 10 end
    if db_variable.WIDTH_ECART_GLOBAL_PLAYER_DISTANCE == nil then db_variable.WIDTH_ECART_GLOBAL_PLAYER_DISTANCE = 3 end
    if db_variable.HEIGHT_BETWEEN_TITLE == nil then db_variable.HEIGHT_BETWEEN_TITLE = 1 end
    if db_variable.HEIGHT_BETWEEN_DEBUFFED == nil then db_variable.HEIGHT_BETWEEN_DEBUFFED = 1 end
    if db_variable.HEIGHT_BETWEEN_TITLE_DEBUFFED == nil then db_variable.HEIGHT_BETWEEN_TITLE_DEBUFFED = 0 end
    if db_variable.POSITION_X == nil then db_variable.POSITION_X = 0 end
    if db_variable.POSITION_Y == nil then db_variable.POSITION_Y = 0 end
  end
end

---------------------------------------------------------------------------------------------------
----------------------------------   FRAMEPOOL IMPLEMENTATION   -----------------------------------
---------------------------------------------------------------------------------------------------
  
-- Framepool table
local framepool = {}

-- Modify a frame
local function modify_frame(f, parent, backdrop, width, height, point_position, x_pos, y_pos, color_red, color_green, color_blue, color_alpha, frame_strata)
  f:SetParent(parent)
  f:SetBackdrop(backdrop)
  f:SetWidth(width)
  f:SetHeight(height)
  f:SetPoint(point_position, x_pos, y_pos)
  f:SetBackdropColor(color_red, color_green, color_blue, color_alpha)
  f:SetFrameStrata(frame_strata)
  return f
end

-- Put the frame in the available frames (in the framepool)
local function remove_frame(f)
  f:Hide()
  f:SetBackdrop(nil)
  f:SetWidth(0)
  f:SetPoint("CENTER", 0, 0)
  f:SetBackdropColor(0, 0, 0, 0)
  f:SetHeight(0)
  f:SetParent(nil)
  f:SetScript("OnUpdate", nil)
  tinsert(framepool, f)
end

-- Get a frame : from the framepool if there is one available, create one else
local function get_frame()
  local f = tremove(framepool)
  if not f then
    -- Create your frame
    f = CreateFrame("StatusBar", nil)
  else   
  end 
  return f
end

-- Create a texture
local function get_texture(icon, strata, texture, point_position, x_pos, y_pos, width, height)
f = icon:CreateTexture(nil, strata)
f:SetTexture(texture)
f:SetPoint(point_position, x_pos, y_pos)
f:SetWidth(width)
f:SetHeight(height)
return f
end

---------------------------------------------------------------------------------------------------
-----------------------------------------   TOOL METHODS   ----------------------------------------
---------------------------------------------------------------------------------------------------

-- Distance between 2 players
function compute_distance(unit2)
  if IsItemInRange(37727, unit2) then
    result = 5
  elseif IsItemInRange(63427, unit2) then
    result = 6
  elseif IsItemInRange(34368, unit2) then
    result = 8
  elseif IsItemInRange(32321, unit2) then
    result = 10
  elseif IsItemInRange(1251, unit2) or IsItemInRange(33069, unit2) then
    result = 15
  elseif IsItemInRange(21519, unit2) then
    result = 20
  elseif IsItemInRange(31463, unit2) then
    result = 25
  elseif IsItemInRange(34191, unit2) then
    result = 30
  elseif IsItemInRange(18904, unit2) then
    result = 35
  elseif IsItemInRange(34471, unit2) then
    result = 40
  elseif IsItemInRange(32698, unit2) then
    result = 45
  elseif IsItemInRange(116139, unit2) then
    result = 50
  elseif IsItemInRange(32825, unit2) then
    result = 60
  elseif CheckInteractDistance(unit2, 2) then
    result = 8
  elseif CheckInteractDistance(unit2, 4) then
    result = 28
  end
  return result
end

-- Get Table
local function get_table(from_table, encounter)
  if encounter ~= nil then
    local t = {}
    for k, _ in pairs(from_table) do
      if k == encounter then
        for l, w in pairs(from_table[k]) do
          t[l] = {}
          for m, x in pairs(from_table[k][l]) do
            t[l][m] = x
          end
        end
       end
    end
    return t
  end
end

---------------------------------------------------------------------------------------------------
-------------------------------   ONUPDATE EVENT HANDLING METHODS   -------------------------------
---------------------------------------------------------------------------------------------------

-- Calculate the distance between the player and the player debuffed. Green if ok, red if not.
local function player_distance_script(k, l)
  ITrackU[k][l].Frame_PlayerDistance:SetScript("OnUpdate", function(self, elapsed)
    ITrackU[k][l].Distance = compute_distance(l, select(1, UnitName("player")))
    if ITrackU["DebuffToTrack"][k]["Type"] == "Stack" then
      if ITrackU[k][l].Distance < ITrackU["DebuffToTrack"][k]["TypeDistance"] then
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(0,1,0,1)
      else
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(1,0,0,1)
      end

    elseif ITrackU["DebuffToTrack"][k]["Type"] == "Spread" then
      if ITrackU[k][l].Distance < ITrackU["DebuffToTrack"][k]["TypeDistance"] then
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(1,0,0,1)
      else
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(0,1,0,1)
      end
    end
  end)
end

-- Calculate the stacks and remaining duration of the debuff/buff
local function update_timer(k, l, minimum, maximum, auratype)
  ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", function(self, elapsed)  
    if auratype == "BUFF" then
      -- Max
      ITrackU[k][l].ModifMax = select(6, UnitBuff(l, select(1, GetSpellInfo(k))))

      -- Stacks
      ITrackU[k][l].Stacks = select(4, UnitBuff(l, select(1, GetSpellInfo(k))))

      -- Timer
      if maximum ~= ITrackU[k][l].ModifMax then
        ITrackU[k][l].Timer = (select(7, UnitBuff(l, select(1, GetSpellInfo(k)))) - GetTime()) * maximum / ITrackU[k][l].ModifMax
      else
        ITrackU[k][l].Timer = select(7, UnitBuff(l, select(1, GetSpellInfo(k)))) - GetTime()
      end

    elseif auratype == "DEBUFF" then
      -- Max
      ITrackU[k][l].ModifMax = select(6, UnitDebuff(l, select(1, GetSpellInfo(k))))

      -- Stacks
      ITrackU[k][l].Stacks = select(4, UnitDebuff(l, select(1, GetSpellInfo(k))))

      -- Timer
      if maximum ~= ITrackU[k][l].ModifMax then
        ITrackU[k][l].Timer = (select(7, UnitDebuff(l, select(1, GetSpellInfo(k)))) - GetTime()) * maximum / ITrackU[k][l].ModifMax
      else
        ITrackU[k][l].Timer = select(7, UnitDebuff(l, select(1, GetSpellInfo(k)))) - GetTime()
      end                           
    end
    self:SetValue(ITrackU[k][l].Timer)
    if ITrackU[k][l].Stacks == 0 or ITrackU[k][l].Stacks == 1 then
      ITrackU[k][l].Text_PlayerStacks:SetText("")
    else
      ITrackU[k][l].Text_PlayerStacks:SetText(ITrackU[k][l].Stacks)
    end

    -- when timer has reached the desired value, as defined by global END (secTnds), restart it by setting it to 0, as defined by global START
    if ITrackU[k][l].Timer <= minimum then
      self:SetValue(0)
      ITrackU[k][l].Text_PlayerStacks:SetText("")
      ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", nil)
    end
  end)
end

---------------------------------------------------------------------------------------------------
-------------------------------   INGAME EVENT HANDLING METHODS   ---------------------------------
---------------------------------------------------------------------------------------------------

-- Called when the player regen is disabled
local function player_regen_disabled_handler(self, ...)

  if ITrackU == nil then ITrackU = {} end
  if ITrackU["encounter_id"] == nil then ITrackU["encounter_id"] = EJ_GetCreatureInfo(1) end
  if debuffs_table ~= nil then ITrackU["DebuffToTrack"] = get_table(debuffs_table, ITrackU["encounter_id"]) end

  if ITrackU["DebuffToTrack"] ~= nil then
  
    Frame_Main:Show()
    local i = 0
    
    for k, v in pairs(ITrackU["DebuffToTrack"]) do
    
      -- Init
      ITrackU[k] = {}
      -- Frame_Titre[k]
      ITrackU[k].Frame_Titre = get_frame()
      ITrackU[k].Frame_Titre = modify_frame(ITrackU[k].Frame_Titre, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_variable.WIDTH_GLOBAL, db_variable.HEIGHT_TITLE, "TOPLEFT", 0, i, 0.368, 0.368, 0.368, 0.9, "LOW")
                           
      -- Text_Frame_Titre
      ITrackU[k].Text_Frame_Titre = ITrackU[k].Frame_Titre:CreateFontString("Text_Frame_Titre", "OVERLAY", "GameFontNormal")
      ITrackU[k].Text_Frame_Titre:SetPoint("LEFT", db_variable.HEIGHT_TITLE + 4, 0)
      ITrackU[k].Text_Frame_Titre:SetText(select(1, GetSpellInfo(k)))    

      -- Icon_Frame_Titre
      ITrackU[k].Icon_Frame_Titre = ITrackU[k].Frame_Titre:CreateTexture(nil,"MEDIUM")
      ITrackU[k].Icon_Frame_Titre:SetTexture(select(3, GetSpellInfo(k)))
      ITrackU[k].Icon_Frame_Titre:SetPoint("LEFT", 0, 0)
      ITrackU[k].Icon_Frame_Titre:SetWidth(db_variable.HEIGHT_TITLE)
      ITrackU[k].Icon_Frame_Titre:SetHeight(db_variable.HEIGHT_TITLE)
      
      -- Init Table Track joueurs
      ITrackU[k]["debuffed"] = {}
      ITrackU[k].Frame_PlayerDebuffed = {}
      ITrackU[k].Text_PlayerDebuffed = {}
      
      -- MAJ Frames
      if ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
        ITrackU[k].Frame_Titre:Show()
        i = i - db_variable.HEIGHT_TITLE - db_variable.HEIGHT_BETWEEN_TITLE
        Frame_Main:SetHeight((-1)*i)
      else
        ITrackU[k].Frame_Titre:Hide()
      end   
      
    end
  end
end

-- Called when the player regen is enabled
local function player_regen_enabled_handler(self, ...)
  if ITrackU ~= nil then
    if ITrackU["DebuffToTrack"] ~= nil then
      for k, v in pairs(ITrackU["DebuffToTrack"]) do
        if ITrackU[k]["debuffed"] ~= nil then
          for l, w in pairs(ITrackU[k]["debuffed"]) do
            if w ~= nil then
              ITrackU[k][l].Frame_PlayerDebuffed:SetValue(0)
              ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", nil)
              ITrackU[k][l].Text_PlayerDebuffed:SetText("")
              ITrackU[k][l].Text_PlayerStacks:SetText("")
              remove_frame(ITrackU[k][l].Frame_PlayerDebuffed)
              if ITrackU["DebuffToTrack"][k]["Type"] == "Stack" or ITrackU["DebuffToTrack"][k]["Type"] == "Spread" then
                remove_frame(ITrackU[k][l].Frame_PlayerDistance)
              end
            end
          end
        end
        ITrackU[k].Icon_Frame_Titre:SetTexture(nil)
        ITrackU[k].Text_Frame_Titre:SetText("")
        remove_frame(ITrackU[k].Frame_Titre)
      end
    end
     ITrackU = nil
     Frame_Main:SetHeight(0)
     Frame_Main:Hide()
  end
end

-- Called when a combat log event is detected
local function combat_log_event_unfiltered_handler(self, ...)
  local timestamp, type, hide_caster, source_GUID, source_name, source_flags, source_flags_2, dest_GUID, dest_name, dest_flags, dest_flags_2 = ...
  if (type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REFRESH" or type == "SPELL_AURA_APPLIED_DOSE") and ITrackU ~= nil then
    local _, _, _, _, _, _, _, _, _, _, _, spell_id, _, _, aura_type  = ...
    if ITrackU["DebuffToTrack"] ~= nil then
      -- to be continued
      if ITrackU["DebuffToTrack"][spell_id] and (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "All" or (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "Player" and dest_name == select(1, UnitName("player"))) or (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "Focus" and dest_name == select(1, UnitName("focus"))) or (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "Player_Focus" and (dest_name == select(1, UnitName("player")) or dest_name == select(1, UnitName("focus"))))) then
        
        local i = 0
          ITrackU[spell_id][dest_name] = {}

          -- Création ligne
          if ITrackU[spell_id]["debuffed"][dest_name] == nil then ITrackU[spell_id]["debuffed"][dest_name] = {} end
          ITrackU[spell_id]["debuffed"][dest_name] = {
                        ["aura_type"] = aura_type,
                        ["frame_active"] = "yes"
                        }
          
          -- Get Player Color
          if dest_name == select(1, UnitName("player")) then
            ITrackU[spell_id]["debuffed"][dest_name]["color_red"] = 0.208
            ITrackU[spell_id]["debuffed"][dest_name]["color_green"] = 0.80
            ITrackU[spell_id]["debuffed"][dest_name]["color_blue"] = 0.192
            ITrackU[spell_id]["debuffed"][dest_name]["color_alpha"] = 0.5
          elseif dest_name == select(1, UnitName("focus")) then
            ITrackU[spell_id]["debuffed"][dest_name]["color_red"] = 0.632
            ITrackU[spell_id]["debuffed"][dest_name]["color_green"] = 0.348
            ITrackU[spell_id]["debuffed"][dest_name]["color_blue"] = 0.828
            ITrackU[spell_id]["debuffed"][dest_name]["color_alpha"] = 0.5     
          else
            ITrackU[spell_id]["debuffed"][dest_name]["color_red"] = 0.78
            ITrackU[spell_id]["debuffed"][dest_name]["color_green"] = 0.828
            ITrackU[spell_id]["debuffed"][dest_name]["color_blue"] = 0.464
            ITrackU[spell_id]["debuffed"][dest_name]["color_alpha"] = 0.5        
          end
          
          -- Create Frame
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed = get_frame()
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed = modify_frame(ITrackU[spell_id][dest_name].Frame_PlayerDebuffed, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_variable.WIDTH_GLOBAL, db_variable.HEIGHT_DEBUFFED, "TOPLEFT", 0, i, ITrackU[spell_id]["debuffed"][dest_name]["color_red"], ITrackU[spell_id]["debuffed"][dest_name]["color_green"], ITrackU[spell_id]["debuffed"][dest_name]["color_blue"], ITrackU[spell_id]["debuffed"][dest_name]["color_alpha"], "LOW")                     
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:Hide()
          
          --PlayerStacksText
          ITrackU[spell_id][dest_name].Text_PlayerStacks = ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:CreateFontString("Text_PlayerStacks", "OVERLAY", "GameFontNormal")
          ITrackU[spell_id][dest_name].Text_PlayerStacks:SetPoint("RIGHT", -5, 0)
          ITrackU[spell_id][dest_name].Text_PlayerStacks:SetFont("Fonts\\FRIZQT__.TTF", 15, "MONOCHROME")
          -- ITrackU[spell_id][dest_name].Text_PlayerStacks:SetTextColor(1, 1, 1, 1)
          
          -- PlayerDebuffedText
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed = ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:CreateFontString("Text_PlayerDebuffed", "OVERLAY", "GameFontNormal")
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetPoint("CENTER", 0, 0)
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetText(dest_name)
          
          -- Status Bar
          
            --Frame_PlayerDebuffed StatusBar
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetStatusBarTexture([[Interface\ChatFrame\ChatFrameBackground]])
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetStatusBarColor(ITrackU[spell_id]["debuffed"][dest_name]["color_red"],ITrackU[spell_id]["debuffed"][dest_name]["color_green"],ITrackU[spell_id]["debuffed"][dest_name]["color_blue"], 1)
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetFillStyle("REVERSE")
            
            -- Variable Max
            ITrackU[spell_id][dest_name].Min = 0
            if aura_type == "BUFF" then
              -- Max
              ITrackU[spell_id][dest_name].Max = select(6, UnitBuff(dest_name, select(1, GetSpellInfo(spell_id))))
            elseif aura_type == "DEBUFF" then
              -- Max
              ITrackU[spell_id][dest_name].Max = select(6, UnitDebuff(dest_name, select(1, GetSpellInfo(spell_id))))
            end                                            
            
            -- Set MinMax Status Bar
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetMinMaxValues(ITrackU[spell_id][dest_name].Min, ITrackU[spell_id][dest_name].Max)
            
            -- this function will run repeatedly, incrementing the value of timer as it goes
            update_timer(spell_id,dest_name, ITrackU[spell_id][dest_name].Min, ITrackU[spell_id][dest_name].Max, ITrackU[spell_id]["debuffed"][dest_name]["aura_type"])
          
          --Frame PlayerDistance
          if (ITrackU["DebuffToTrack"][spell_id]["Type"] == "Stack" or ITrackU["DebuffToTrack"][spell_id]["Type"] == "Spread") and dest_name ~= select(1, UnitName("player")) then
            ITrackU[spell_id][dest_name].Frame_PlayerDistance = get_frame()
            ITrackU[spell_id][dest_name].Frame_PlayerDistance = modify_frame(ITrackU[spell_id][dest_name].Frame_PlayerDistance, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_variable.WIDTH_PLAYER_DISTANCE, db_variable.HEIGHT_DEBUFFED, "TOPRIGHT", 0, i, 0, 0, 0, 1, "LOW")
            ITrackU[spell_id][dest_name].Frame_PlayerDistance:Show()
            player_distance_script(spell_id,dest_name)
          end
          
          ITrackU["DebuffToTrack"][spell_id]["Count"] = ITrackU["DebuffToTrack"][spell_id]["Count"] + 1
        
        -- Positionning each frame
        for k, v in pairs(ITrackU["DebuffToTrack"]) do
          if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == "Yes") or ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
            -- Frame_Titre[k]
            ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)

            -- MAJ i
      if ITrackU["DebuffToTrack"][k]["Count"] > 0 then
        i = i - db_variable.HEIGHT_TITLE - db_variable.HEIGHT_BETWEEN_TITLE_DEBUFFED
      else
        i = i - db_variable.HEIGHT_TITLE
      end

            -- MAJ Height Frame Principale
            Frame_Main:SetHeight((-1)*i)
            
            ITrackU[k].Frame_Titre:Show()
                                   
            -- PlayerDebuffed[k]
            if ITrackU["DebuffToTrack"][k]["Count"] > 0 then
              for l, w in pairs(ITrackU[spell_id]["debuffed"]) do
                    if ITrackU[k]["debuffed"][l]["frame_active"] == "yes" then                          
                      
                      ITrackU[k][l].Frame_PlayerDebuffed:Show()
                      
                      -- MAJ Frame_PlayerDebuffed Positionning
                      ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT", 0, i)
                      
                      --Frame PlayerDistance
                      if (ITrackU["DebuffToTrack"][k]["Type"] == "Stack" or ITrackU["DebuffToTrack"][k]["Type"] == "Spread") and l ~= select(1, UnitName("player")) then
                        ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPRIGHT", 0, i)
                      end
                      
                      -- MAJ i
                      i = i - db_variable.HEIGHT_DEBUFFED - db_variable.HEIGHT_BETWEEN_DEBUFFED
                               
                      -- MAJ Height Frame Principale
                      Frame_Main:SetHeight((-1)*i)
                    end
              end
            end
      i = i - db_variable.HEIGHT_BETWEEN_TITLE
          end
        end
      end
    end
  end

  if type == "SPELL_AURA_REMOVED" and ITrackU ~= nil then
    if ITrackU["DebuffToTrack"] ~= nil then
      local _, _, _, _, _, _, _, _, _, _, _, spell_id, aura_type = ...
      if ITrackU["DebuffToTrack"][spell_id] then
      
        -- On remove la frame si Stack ou Spread
        if (ITrackU["DebuffToTrack"][spell_id]["Type"] == "Stack" or ITrackU["DebuffToTrack"][spell_id]["Type"] == "Spread") and dest_name ~= select(1, UnitName("player")) then
          remove_frame(ITrackU[spell_id][dest_name].Frame_PlayerDistance)
        end      
      
        -- Vider les tables
        ITrackU[spell_id]["debuffed"][dest_name] = nil
        remove_frame(ITrackU[spell_id][dest_name].Frame_PlayerDebuffed)
        ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetText("")
        ITrackU[spell_id][dest_name].Text_PlayerStacks:SetText("")
        
        -- On hide la frame titre si Count = 0
        ITrackU["DebuffToTrack"][spell_id]["Count"] = ITrackU["DebuffToTrack"][spell_id]["Count"] - 1
        if ITrackU["DebuffToTrack"][spell_id]["IfActive"] == "Yes" and ITrackU["DebuffToTrack"][spell_id]["Count"] == 0 then
          ITrackU[spell_id].Frame_Titre:Hide()
        end
        
        local i = 0
        
        for k, v in pairs(ITrackU["DebuffToTrack"]) do
          if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == "Yes") or ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
            -- Frame_Titre[k]
            ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)

            -- MAJ i
      if ITrackU["DebuffToTrack"][k]["Count"] > 0 then
        i = i - db_variable.HEIGHT_TITLE - db_variable.HEIGHT_BETWEEN_TITLE_DEBUFFED
      else
        i = i - db_variable.HEIGHT_TITLE
      end

            -- MAJ Height Frame Principale
            Frame_Main:SetHeight((-1)*i)
            
              -- PlayerDebuffed[k]
              if ITrackU["DebuffToTrack"][k]["Count"] > 0 then
                for l, w in pairs(ITrackU[k]["debuffed"]) do
                      if ITrackU[k]["debuffed"][l]["frame_active"] == "yes" then
                        
                        -- MAJ Frame_PlayerDebuffed Positionning
                        ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT", 0, i)
                        
                        --Frame PlayerDistance
                        if (ITrackU["DebuffToTrack"][k]["Type"] == "Stack" or ITrackU["DebuffToTrack"][k]["Type"] == "Spread") and l ~= select(1, UnitName("player")) then
                          ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPRIGHT", 0, i)
                        end
                        
                        -- MAJ i
                        i = i - db_variable.HEIGHT_DEBUFFED - db_variable.HEIGHT_BETWEEN_DEBUFFED
                                 
                        -- MAJ Height Frame Principale
                        Frame_Main:SetHeight((-1)*i)
                      end
                end
              end
      i = i - db_variable.HEIGHT_BETWEEN_TITLE
          end
        end
      end
    end
  end
end
          
---------------------------------------------------------------------------------------------------
-----------------------------------   EVENT HANDLER BINDINGS   ------------------------------------
---------------------------------------------------------------------------------------------------

local AllEventHandlers = {
    ["PLAYER_REGEN_DISABLED"] = player_regen_disabled_handler,
    ["PLAYER_REGEN_DISABLED"] = addon_initialization,
    ["PLAYER_REGEN_ENABLED"] = player_regen_enabled_handler,
    ["COMBAT_LOG_EVENT_UNFILTERED"] = combat_log_event_unfiltered_handler,
    ["ADDON_LOADED"] = addon_loaded,
}
 
-- ITrackUFrame
local ITrackUFrame = CreateFrame("Frame")
for event, _ in pairs(AllEventHandlers) do
  ITrackUFrame:RegisterEvent(event)
end
ITrackUFrame:SetScript("OnEvent", function(self, event, ...)
    AllEventHandlers[event](self, ...)
end)

---------------------------------------------------------------------------------------------------
---------------------------------   MAIN FRAIM INITIALIZATION   -----------------------------------
---------------------------------------------------------------------------------------------------

local function addon_initialization(self, ...)
  local Frame_Main = CreateFrame("FRAME", "Frame_Main", UIParent)
  Frame_Main:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
  Frame_Main:SetWidth(db_variable.WIDTH_GLOBAL + db_variable.WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + db_variable.WIDTH_PLAYER_DISTANCE)
  Frame_Main:SetHeight(0)
  Frame_Main:SetBackdropColor(1,0,0,0)
  Frame_Main:SetPoint("CENTER",-400,0)
  Frame_Main:SetFrameStrata("BACKGROUND")
  Frame_Main:Hide()
 end

---------------------------------------------------------------------------------------------------
------------------------------------   SLASH INITIALIZATION   -------------------------------------
--------------------------------------------------------------------------------------------------- 
 
SlashCmdList['ITRACKU_MAINFRAME_SLASHCMD'] = function()
  if ITrackU == nil then ITrackU = {} end
  ITrackU["encounter_id"] = 1111
  addon_initialization()
  player_regen_disabled_handler()
  print("Addon Open")
end
SLASH_ITRACKU_MAINFRAME_SLASHCMD1 = '/mainframe'

SlashCmdList['ITRACKU_CLOSEFRAME_SLASHCMD'] = function()
  player_regen_enabled_handler()
  print("Addon fermé")
end
SLASH_ITRACKU_CLOSEFRAME_SLASHCMD1 = '/closeframe'

SlashCmdList['ITRACKU_ENCOUNTER_SLASHCMD'] = function()
  local encounter = EJ_GetCreatureInfo(1)
  print(encounter)
end
SLASH_ITRACKU_ENCOUNTER_SLASHCMD1 = '/encounter'