---------------------------------------------------------------------------------------------------
------------------------------------   CONSTANT DECLARATIONS   ------------------------------------
---------------------------------------------------------------------------------------------------

local HEIGHT_TITLE = 27
local HEIGHT_DEBUFFED = 20
local WIDTH_GLOBAL = 150
local WIDTH_PLAYER_DISTANCE = 10
local WIDTH_ECART_GLOBAL_PLAYER_DISTANCE = 3 


---------------------------------------------------------------------------------------------------
------------------------------------   VARIABLE DECLARATIONS   ------------------------------------
---------------------------------------------------------------------------------------------------

local ITrackU = {}


-- IfActive = Yes/No
-- Type = Classic / Stack / Spread
-- TypeDistance = M or nil
-- Rôle = Tank / DPS / Heal / All
-- Max Stacks
local debuffs_table = {
  [1111] = {},

  [2074] = {
            [245098] = {
                        ["IfActive"] = "No",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank"
                       },
            [251445] = {
                        ["IfActive"] = "No",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank"
                       },
            [248815] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Spread",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank"
                         },
            [244768] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Classic",
                        ["TypeDistance"] = nil,
                        ["Role"] = "Tank"
                       },
            [248819] = {
                        ["IfActive"] = "Yes",
                        ["Count"] = 0,
                        ["Type"] = "Stack",
                        ["TypeDistance"] = 8,
                        ["Role"] = "Tank"
                       }
          }
}


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
  f:SetParent(nil)
  tinsert(framepool, f)
end


-- Get a frame : from the framepool if there is one available, create one else
local function get_frame()
  local f = tremove(framepool)
  if not f then
    -- Create your frame
    f = CreateFrame("StatusBar", nil)
  end
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
local function get_table(from_table)
  local t = {}
  for k, _ in pairs(from_table) do
    -- if k ==
    for l, w in pairs(from_table[k]) do
      t[l] = {}
      for m, x in pairs(from_table[k][l]) do
        t[l][m] = x
      end
    end
  end
  return t
end


---------------------------------------------------------------------------------------------------
-------------------------------   ONUPDATE EVENT HANDLING METHODS   -------------------------------
---------------------------------------------------------------------------------------------------


-- TODO Rename éventuellement + documenter ce que la méthode fait
local function player_distance_script(k, l)
  ITrackU[k][l].Frame_PlayerDistance:SetScript("OnUpdate", function(self, elapsed)
    ITrackU[k][l].PlayerDistance = compute_distance(l, select(1, UnitName("player")))

    if ITrackU["DebuffToTrack"][k]["Type"] == "Stacks" then
      if ITrackU[k][l].PlayerDistance < ITrackU["DebuffToTrack"][k]["TypeDistance"] then
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(0,1,0,1)
      else
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(1,0,0,1)
      end

    elseif ITrackU["DebuffToTrack"][k]["Type"] == "Spread" then
      if ITrackU[k][l].PlayerDistance < ITrackU["DebuffToTrack"][k]["TypeDistance"] then
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(1,0,0,1)
      else
        ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(0,1,0,1)
      end
    end
  end)
end


-- TODO Rename éventuellement + documenter ce que la méthode fait
local function update_timer(k, l)
  ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", function(self, elapsed)  
    if ITrackU[k][l].AuraType == "BUFF" then
      -- Max
      ITrackU[k][l].ModifMax = select(6, UnitBuff(l, select(1, GetSpellInfo(k))))

      -- Stacks
      ITrackU[k][l].Stacks = select(4, UnitBuff(l, select(1, GetSpellInfo(k))))

      -- Timer
      if ITrackU[k][l].Max ~= ITrackU[k][l].ModifMax then
        ITrackU[k][l].Timer = (select(7, UnitBuff(l, select(1, GetSpellInfo(k)))) - GetTime()) * ITrackU[k][l].Max / ITrackU[k][l].ModifMax
      else
        ITrackU[k][l].Timer = select(7, UnitBuff(l, select(1, GetSpellInfo(k)))) - GetTime()
      end

    elseif ITrackU[k][l].AuraType == "DEBUFF" then
      -- Max
      ITrackU[k][l].ModifMax = select(6, UnitDebuff(l, select(1, GetSpellInfo(k))))

      -- Stacks
      ITrackU[k][l].Stacks = select(4, UnitDebuff(l, select(1, GetSpellInfo(k))))

      -- Timer
      if ITrackU[k][l].Max ~= ITrackU[k][l].ModifMax then
        ITrackU[k][l].Timer = (select(7, UnitDebuff(l, select(1, GetSpellInfo(k)))) - GetTime()) * ITrackU[k][l].Max / ITrackU[k][l].ModifMax
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
    if ITrackU[k][l].Timer <= ITrackU[k][l].Min then
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
end


-- Called when the player regen is enabled
local function player_regen_enabled_handler(self, ...)
  if ITrackU ~= nil then
    for k, v in pairs(ITrackU["DebuffToTrack"]) do
      if ITrackU[k].Table_PlayerDebuffed ~= nil then
        for l, w in pairs(ITrackU[k].Table_PlayerDebuffed) do
          if l ~= nil then
            remove_frame(ITrackU[k][l].Frame_PlayerDebuffed)
            remove_frame(ITrackU[k][l].Frame_PlayerDistance)
          end
        end
      end
      remove_frame(ITrackU[k].Frame_Titre)
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
        if ITrackU["DebuffToTrack"][spell_id] then
          -- Création ligne
          ITrackU[spell_id].Table_PlayerDebuffed[dest_name] = "True"
          ITrackU[spell_id][dest_name] = {}
          ITrackU[spell_id][dest_name].AuraType = aura_type
          ITrackU["DebuffToTrack"][spell_id]["Count"] = ITrackU["DebuffToTrack"][spell_id]["Count"] + 1
     
          local i = 0
          for k, v in pairs(ITrackU["DebuffToTrack"]) do
            if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == "Yes") or ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
              -- Frame_Titre[k]
              ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)
              ITrackU[k].Frame_Titre:Show()

              -- MAJ i
              i = i - HEIGHT_TITLE

              -- MAJ Height Frame Principale
              Frame_Main:SetHeight((-1)*i)
                                     
              -- PlayerDebuffed[k]
              if ITrackU[k].Table_PlayerDebuffed ~= nil then
                for l, w in pairs(ITrackU[k].Table_PlayerDebuffed) do
                  if w ~= nil then
                    if ITrackU[k][l].Activate == nil then

                      -- Frame_PlayerDebuffed[l]
                      ITrackU[k][l].Frame_PlayerDebuffed = get_frame()
                      ITrackU[k][l].Frame_PlayerDebuffed = modify_frame(ITrackU[k][l].Frame_PlayerDebuffed, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, WIDTH_GLOBAL, HEIGHT_DEBUFFED, "TOPLEFT", 0, i, 1, 1, 1, 1, "LOW")                 
                      
                      -- Couleur en fonction du joueur 
                      if l == select(1, UnitName("player")) then
                        ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(0.208,0.80,0.192,0.5)
                      elseif l == select(1, UnitName("focus")) then
                        ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(0.632,0.348,0.828,0.5)
                      else
                        ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(0.78,0.828,0.464,0.5)
                      end
                      
                      ITrackU[k][l].Frame_PlayerDebuffed:Show()
                               
                      --Frame_PlayerDebuffed StatusBar
                      ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarTexture([[Interface\ChatFrame\ChatFrameBackground]])
                      
                      -- Couleur en fonction du joueur 
                      if l == select(1, UnitName("player")) then
                       ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(0.208,0.80,0.192,0.5)
                      elseif l == select(1, UnitName("focus")) then
                       ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(0.632,0.348,0.828,0.5)
                      else
                        ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(0.78,0.828,0.464,0.5)
                      end
                      
                      ITrackU[k][l].Frame_PlayerDebuffed:SetFillStyle("REVERSE")
                              
                      --Frame PlayerDistance
                      if (ITrackU["DebuffToTrack"][k]["Type"] == "Stack" or ITrackU["DebuffToTrack"][k]["Type"] == "Spread") and l ~= select(1, UnitName("player")) then
                        ITrackU[k][l].Frame_PlayerDistance = get_frame()
                        ITrackU[k][l].Frame_PlayerDistance = modify_frame(ITrackU[k][l].Frame_PlayerDistance, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, WIDTH_PLAYER_DISTANCE, HEIGHT_DEBUFFED, "TOPRIGHT", 0, i, 0, 0, 0, 1, "LOW")
                        ITrackU[k][l].Frame_PlayerDistance:Show()
                        player_distance_script(k,l)
                      end
                      
                      --PlayerStacksText
                      ITrackU[k][l].Text_PlayerStacks = ITrackU[k][l].Frame_PlayerDebuffed:CreateFontString("Text_PlayerStacks", "OVERLAY", "GameFontNormal")
                      ITrackU[k][l].Text_PlayerStacks:SetPoint("RIGHT", 0, 0)
                      
                      -- Variable Max
                      ITrackU[k][l].Min = 0
                      if aura_type == "BUFF" then
                        -- Max
                        ITrackU[k][l].Max = select(6, UnitBuff(l, select(1, GetSpellInfo(k))))
                      elseif aura_type == "DEBUFF" then
                        -- Max
                        ITrackU[k][l].Max = select(6, UnitDebuff(l, select(1, GetSpellInfo(k))))
                      end                                            
                      
                      -- Set la statusbar
                      ITrackU[k][l].Frame_PlayerDebuffed:SetMinMaxValues(ITrackU[k][l].Min, ITrackU[k][l].Max)
                      
                      -- this function will run repeatedly, incrementing the value of timer as it goes
                      update_timer(k,l)
                      
                      -- PlayerDebuffedText
                      ITrackU[k][l].Text_PlayerDebuffed = ITrackU[k][l].Frame_PlayerDebuffed:CreateFontString("Text_PlayerDebuffed", "OVERLAY", "GameFontNormal")
                      ITrackU[k][l].Text_PlayerDebuffed:SetPoint("CENTER", 0, 0)
                      ITrackU[k][l].Text_PlayerDebuffed:SetText(l)
                      
                      -- MAJ i
                      i = i - HEIGHT_DEBUFFED
                               
                      -- MAJ Height Frame Principale
                      Frame_Main:SetHeight((-1)*i)
                      
                      -- FRAME Activate
                      ITrackU[k][l].Activate = "True"
                      
                    else
                      -- MAJ Height Player Debuffed
                      ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT",0, i)
                      if ITrackU["DebuffToTrack"][k]["Type"] == "Stack" or ITrackU["DebuffToTrack"][k]["Type"] == "Spread" then
                        ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPRIGHT", 0, i)
                      end
                      
                      -- MAJ i
                      i = i - HEIGHT_DEBUFFED
                      
                      -- MAJ Height Frame Principale
                      Frame_Main:SetHeight((-1)*i)

                    end                             
                  end
                end
              end
            end
          end
        end
      end
  end


  if type == "SPELL_AURA_REMOVED" and ITrackU ~= nil then
    if ITrackU["DebuffToTrack"] ~= nil then
      local _, _, _, _, _, _, _, _, _, _, _, spell_id, aura_type = ...
      if ITrackU["DebuffToTrack"][spell_id] then
        -- Vider les tables
        ITrackU[spell_id].Table_PlayerDebuffed[dest_name] = nil
        ITrackU[spell_id][dest_name].Text_PlayerStacks:SetText("")
        ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetText("")
        remove_frame(ITrackU[spell_id][dest_name].Frame_PlayerDebuffed)
        ITrackU["DebuffToTrack"][spell_id]["Count"] = ITrackU["DebuffToTrack"][spell_id]["Count"] - 1
        
        -- On hide la frame titre si Count = 0
        if ITrackU["DebuffToTrack"][spell_id]["IfActive"] == "Yes" and ITrackU["DebuffToTrack"][spell_id]["Count"] == 0 then
          ITrackU[spell_id].Frame_Titre:Hide()
        end
        
        -- On remove la frame si Stack ou Spread
        if ITrackU["DebuffToTrack"][spell_id]["Type"] == "Stack" or ITrackU["DebuffToTrack"][spell_id]["Type"] == "Spread" then
          remove_frame(ITrackU[spell_id][dest_name].Frame_PlayerDistance)
        end
        
        -- FRAME Deactivate
        ITrackU[spell_id][dest_name].Activate = nil
        
        local i = 0
        for k, v in pairs(ITrackU["DebuffToTrack"]) do
          if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == "Yes") or ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
            -- Frame_Titre[k]
            ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)              
            
            -- MAJ i
            i = i - HEIGHT_TITLE
            
            -- MAJ Height Frame Principale
            Frame_Main:SetHeight((-1)*i)
            
            -- PlayerDebuffed[k]
            if ITrackU[k].Table_PlayerDebuffed ~= nil then
              for l, w in pairs(ITrackU[k].Table_PlayerDebuffed) do
                if w ~= nil then
                
                  -- Frame_PlayerDebuffed[l]
                  ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT",0, i)
                  if ITrackU["DebuffToTrack"][k]["Type"] == "Stack" or ITrackU["DebuffToTrack"][k]["Type"] == "Spread" then
                    ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPRIGHT", 0, i)
                  end
                
                  -- MAJ i
                  i = i - HEIGHT_DEBUFFED
                  
                  -- MAJ Height Frame Principale
                  Frame_Main:SetHeight((-1)*i)
                  
                end
              end
            end
          end
        end
      end
    end
  end
         

  -- Pour début du combat
  if type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REFRESH" then
    local _, _, _, _, _, _, _, _, _, _, _, spell_id, aura_type = ...
    local current_player = select(1, UnitName("player"))

    if spell_id == 224001 and dest_name == current_player then
      ITrackU["DebuffToTrack"] = get_table(debuffs_table)

      if ITrackU["DebuffToTrack"] ~= nil then
        local i = 0
        for k, v in pairs(ITrackU["DebuffToTrack"]) do
          -- Init
          ITrackU[k] = {}
          -- Frame_Titre[k]
          ITrackU[k].Frame_Titre = get_frame()
          ITrackU[k].Frame_Titre = modify_frame(ITrackU[k].Frame_Titre, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, WIDTH_GLOBAL, HEIGHT_TITLE, "TOPLEFT", 0, i, 0.368, 0.368, 0.368, 0.9, "LOW")
          if ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
            ITrackU[k].Frame_Titre:Show()
          else
            ITrackU[k].Frame_Titre:Hide()
          end
                               
          -- Text_Frame_Titre
          ITrackU[k].Text_Frame_Titre = ITrackU[k].Frame_Titre:CreateFontString("Text_Frame_Titre", "OVERLAY", "GameFontNormal")
          ITrackU[k].Text_Frame_Titre:SetPoint("LEFT", HEIGHT_TITLE + 4, 0)
          ITrackU[k].Text_Frame_Titre:SetText(select(1, GetSpellInfo(k)))    
   
          -- Icon_Frame_Titre
          ITrackU[k].Icon_Frame_Titre = ITrackU[k].Frame_Titre:CreateTexture(nil,"MEDIUM")
          ITrackU[k].Icon_Frame_Titre:SetTexture(select(3, GetSpellInfo(k)))
          ITrackU[k].Icon_Frame_Titre:SetPoint("LEFT", 0, 0)
          ITrackU[k].Icon_Frame_Titre:SetWidth(HEIGHT_TITLE)
          ITrackU[k].Icon_Frame_Titre:SetHeight(HEIGHT_TITLE)
          ITrackU[k].Frame_Titre.texture = ITrackU[k].Icon_Frame_Titre                      
                 
          -- MAJ i
          if ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
            i = i - HEIGHT_TITLE
          end
          
          -- Init Table Track joueurs
          ITrackU[k].Table_PlayerDebuffed = {}
          ITrackU[k].Frame_PlayerDebuffed = {}
          ITrackU[k].Text_PlayerDebuffed = {}
                 
          -- MAJ Frame Principale
          if ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
            Frame_Main:SetHeight((-1)*i)
          end

          Frame_Main:Show()
                                       
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
    ["PLAYER_REGEN_ENABLED"] = player_regen_enabled_handler,
    ["COMBAT_LOG_EVENT_UNFILTERED"] = combat_log_event_unfiltered_handler,
}
 

---------------------------------------------------------------------------------------------------
-----------------------------------   ADDON INITIALIZATION   ------------------------------------
---------------------------------------------------------------------------------------------------

local Frame_Main = CreateFrame("FRAME", "Frame_Main", UIParent)
Frame_Main:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
Frame_Main:SetWidth(WIDTH_GLOBAL + WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + WIDTH_PLAYER_DISTANCE)
Frame_Main:SetHeight(0)
Frame_Main:SetBackdropColor(1,0,0,0)
Frame_Main:SetPoint("CENTER",-400,0)
Frame_Main:SetFrameStrata("BACKGROUND")
Frame_Main:Hide()
 
 
 
-- ITrackUFrame
local ITrackUFrame = CreateFrame("Frame")
for event, _ in pairs(AllEventHandlers) do
  ITrackUFrame:RegisterEvent(event)
end
ITrackUFrame:SetScript("OnEvent", function(self, event, ...)
    AllEventHandlers[event](self, ...)
end)

print("Load réussi V4")