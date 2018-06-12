---------------------------------------------------------------------------------------------------
------------------------------------   CONSTANT DECLARATIONS   ------------------------------------
---------------------------------------------------------------------------------------------------

-- IfActive = Yes/No
-- Type = Classic / Stack / Spread
-- TypeDistance = M or nil
-- Rôle = Tank / DPS / Heal / All
-- Max Stacks
-- PlayerOnly : All / Player / Focus / Player_Focus

local unlock_dialog = nil

---------------------------------------------------------------------------------------------------
--------------------------------   SAVED VARIABLES DECLARATIONS   ---------------------------------
---------------------------------------------------------------------------------------------------

-- Set all variables from saved variables or default ones if not available
local function addon_loaded(event, arg1)
  if arg1 == "ITrackU" then
    print("Bienvenue sur ITrackU version 1.00, tapez /ITU afin d'accéder au menu de configuration en jeu.")
    if debuffs_table == nil then print("CETTE TABLE NE SE CHARGE PAS") end
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
    if db_variable.COLOR_R_TITRE == nil then db_variable.COLOR_R_TITRE = 0.368 end
    if db_variable.COLOR_G_TITRE == nil then db_variable.COLOR_G_TITRE = 0.368 end
    if db_variable.COLOR_B_TITRE == nil then db_variable.COLOR_B_TITRE = 0.368 end
    if db_variable.COLOR_A_TITRE == nil then db_variable.COLOR_A_TITRE = 0.9 end

  --set all variables tables for the test frame
  if debuffs_table ~= nil then
    debuffs_table[1111] = {
      [23920] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Classic",
        ["TypeDistance"] = 0,
        ["Rôle"] = "All",
        ["MaxStacks"] = false,
        ["MaxStacksNumber"] = 0,
      },
      [132404] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Classic",
        ["TypeDistance"] = 0,
        ["Rôle"] = "All",
        ["MaxStacks"] = true,
        ["MaxStacksNumber"] = 0,      
      },
      [18499] = {
        ["IfActive"] = false,
        ["Count"] = 0,
        ["Type"] = "Classic",
        ["TypeDistance"] = 0,
        ["Rôle"] = "All",
        ["MaxStacks"] = false,
        ["MaxStacksNumber"] = 0,      
      },
    }
  end
    
    --Set all variable tables from saved variables or default ones if not available    
    if debuffs_table ~= nil then
        for k, v in pairs(debuffs_table) do
          if v ~= nil then
            for l, w in pairs(debuffs_table[k]) do
              --debuffs_table[k][l] = {}
              if w ~= nil then
                if debuffs_table[k][l]["IfActive"] == nil then debuffs_table[k][l]["IfActive"] = false end
                if debuffs_table[k][l]["Count"] == nil then debuffs_table[k][l]["Count"] = 0 end
                if debuffs_table[k][l]["Type"] == nil then debuffs_table[k][l]["Type"] = "Classic" end
                if debuffs_table[k][l]["TypeDistance"] == nil then debuffs_table[k][l]["TypeDistance"] = 0 end
                if debuffs_table[k][l]["Rôle"] == nil then debuffs_table[k][l]["Rôle"] = "All" end
                if debuffs_table[k][l]["PlayerOnly"] == nil then debuffs_table[k][l]["PlayerOnly"] = "All" end
                if debuffs_table[k][l]["MaxStacks"] == nil then debuffs_table[k][l]["MaxStacks"] = false end
                if debuffs_table[k][l]["MaxStacksNumber"] == nil then debuffs_table[k][l]["MaxStacksNumber"] = 0 end
              end
            end
          end
        end
    end
  end
end

---------------------------------------------------------------------------------------------------
---------------------------------   MAIN FRAIM INITIALIZATION   -----------------------------------
---------------------------------------------------------------------------------------------------

local function addon_initialization(self, ...)
  local Frame_Main = CreateFrame("FRAME", "Frame_Main", UIParent)

  -- SavedVariables init
  if db_variable.ANCHOR_POINT == nil then
    db_variable.ANCHOR_POINT = "CENTER"
  end

  if db_variable.POSITION_X == nil then
    db_variable.POSITION_X = 0
  end

  if db_variable.POSITION_Y == nil then
    db_variable.POSITION_Y = 0
  end

  Frame_Main:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
  Frame_Main:SetWidth(db_variable.WIDTH_GLOBAL + db_variable.WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + db_variable.WIDTH_PLAYER_DISTANCE)
  Frame_Main:SetHeight(0)
  Frame_Main:SetBackdropColor(1,0,0,0)
  Frame_Main:SetPoint(db_variable.ANCHOR_POINT,db_variable.POSITION_X,db_variable.POSITION_Y)
  Frame_Main:SetFrameStrata("BACKGROUND")
  Frame_Main:RegisterForDrag('LeftButton')
  Frame_Main:SetScript('OnDragStart', function(f) f:StartMoving() end)
  Frame_Main:SetScript('OnDragStop', function(f) f:StopMovingOrSizing() end)
  Frame_Main:Show()
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
  f:SetParent(nil)
  f:SetBackdrop(nil)
  f:SetWidth(0)
  f:SetPoint("CENTER", 0, 0)
  f:SetBackdropColor(0, 0, 0, 0)
  f:SetHeight(0)  
  f:SetScript("OnUpdate", nil)
  f:Hide()
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


---------------------------------------------------------------------------------------------------
-----------------------------------------   TOOL METHODS   ----------------------------------------
---------------------------------------------------------------------------------------------------

-- Distance between 2 players
local function compute_distance(unit2)
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

-- Close the frame test options
local function close_frame_test_option()
end

-- Update the main frame position 
function update_main_frame_x(x_value)
  if Frame_Main ~= nil then
    Frame_Main:SetPoint(db_variable.ANCHOR_POINT,x_value,db_variable.POSITION_Y)
  end
end

function update_main_frame_y(y_value)
  if Frame_Main ~= nil then
    Frame_Main:SetPoint(db_variable.ANCHOR_POINT, db_variable.POSITION_X, y_value)
  end
end


-- Move frames
local function unlock_main_frame()
  if Frame_Main == nil then
      addon_initialization()
    else
      Frame_Main:Show()
  end  

  Frame_Main:EnableMouse(true)
  Frame_Main:SetMovable(true)
  
end


local function lock_main_frame()
  if Frame_Main == nil then
      addon_initialization()
    else
      Frame_Main:Show()
  end  

  Frame_Main:EnableMouse(false)
  Frame_Main:SetMovable(false)
  unlock_dialog:Hide()

  print(Frame_Main:GetPoint())

  point, _, _, xOfs, yOfs = Frame_Main:GetPoint()
  db_variable.ANCHOR_POINT = point
  db_variable.POSITION_X = xOfs
  db_variable.POSITION_Y = yOfs

end


function show_lock_dialog()
  if not unlock_dialog then
    local f = CreateFrame("Frame", "UnlockDialog", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:SetClampedToScreen(true)
    f:SetWidth(360)
    f:SetHeight(110)
    f:SetBackdrop{
      bgFile="Interface\\DialogFrame\\UI-DialogBox-Background" ,
      edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",
      tile = true,
      insets = {left = 11, right = 12, top = 12, bottom = 11},
      tileSize = 32,
      edgeSize = 32,
    }
    f:SetPoint("TOP", 0, -50)
    f:Hide()
    f:SetScript('OnShow', function() PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION or 'igMainMenuOption') end)
    f:SetScript('OnHide', function() PlaySound(SOUNDKIT and SOUNDKIT.GS_TITLE_OPTION_EXIT or 'gsTitleOptionExit') end)

    f:RegisterForDrag('LeftButton')
    f:SetScript('OnDragStart', function(f) f:StartMoving() end)
    f:SetScript('OnDragStop', function(f) f:StopMovingOrSizing() end)

    local header = f:CreateTexture(nil, "ARTWORK")
    header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    header:SetWidth(256); header:SetHeight(64)
    header:SetPoint("TOP", 0, 12)

    local title = f:CreateFontString("ARTWORK")
    title:SetFontObject("GameFontNormal")
    title:SetPoint("TOP", header, "TOP", 0, -14)
    title:SetText("ITrackU")

    local desc = f:CreateFontString("ARTWORK")
    desc:SetFontObject("GameFontHighlight")
    desc:SetJustifyV("TOP")
    desc:SetJustifyH("LEFT")
    desc:SetPoint("TOPLEFT", 18, -32)
    desc:SetPoint("BOTTOMRIGHT", -18, 48)
    desc:SetText("Main frame unlocked. Move it now and click Lock when you are done.")

    local lock = CreateFrame("CheckButton", "Lock", f, "OptionsButtonTemplate")
    getglobal(lock:GetName() .. "Text"):SetText("Lock")

    lock:SetScript("OnClick", function(self)
      lock_main_frame()
    end)

    --position buttons
    lock:SetPoint("BOTTOMRIGHT", -14, 14)

    unlock_dialog = f

  end
  unlock_main_frame()
  unlock_dialog:Show()
end

-- Update Titre Background Color
function update_background_color_titre(r, g, b, a)
  if ITrackU["DebuffToTrack"] ~= nil then
    for k, v in pairs(ITrackU["DebuffToTrack"]) do
      ITrackU[k].Frame_Titre:SetBackdropColor(r, g, b, a)
    end
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
    -- Alert if stacks > max stacks
    if ITrackU["DebuffToTrack"][k]["MaxStacks"] == true and ITrackU[k][l].Stacks >= ITrackU["DebuffToTrack"][k]["MaxStacksNumber"] then
      ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(1, 0, 0, 0.5)
      ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(1, 0, 0, 1)
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

  if ITrackU == nil or ITrackU == "ITrackU" then ITrackU = {} end
  if debuffs_table ~= nil then ITrackU["DebuffToTrack"] = get_table(debuffs_table, ITrackU["encounter_id"]) end

  if ITrackU["DebuffToTrack"] ~= nil then
    if Frame_Main == nil then
      addon_initialization()
    else
      Frame_Main:Show()
    end  


    local i = 0
    
    for k, v in pairs(ITrackU["DebuffToTrack"]) do
      -- Frame_Titre[k]
      ITrackU[k] = {}
      ITrackU[k].Frame_Titre = get_frame()
      ITrackU[k].Frame_Titre = modify_frame(ITrackU[k].Frame_Titre, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_variable.WIDTH_GLOBAL, db_variable.HEIGHT_TITLE, "TOPLEFT", 0, i, db_variable.COLOR_R_TITRE, db_variable.COLOR_G_TITRE, db_variable.COLOR_B_TITRE, db_variable.COLOR_A_TITRE, "LOW")
                           
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
      if ITrackU["DebuffToTrack"][k]["IfActive"] == false then
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

-- Called for frame test
local function combat_log_frame_test(type, spell_id, dest_name, aura_type)
  if type == "SPELL_AURA_APPLIED" and ITrackU ~= nil then
    if ITrackU["DebuffToTrack"] ~= nil then
      local i = 0
      if dest_name ~= nil then
        if ITrackU["DebuffToTrack"][spell_id] and (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "All" or (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "Player" and dest_name == select(1, UnitName("player"))) or (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "Focus" and dest_name == select(1, UnitName("focus"))) or (ITrackU["DebuffToTrack"][spell_id]["PlayerOnly"] == "Player_Focus" and (dest_name == select(1, UnitName("player")) or dest_name == select(1, UnitName("focus"))))) then
          
            ITrackU[spell_id][dest_name] = {}

            -- Création ligne
            if ITrackU[spell_id]["debuffed"][dest_name] == nil then ITrackU[spell_id]["debuffed"][dest_name] = {} end
            ITrackU[spell_id]["debuffed"][dest_name] = {
                          ["aura_type"] = aura_type,
                          ["frame_active"] = "yes"
                          }
            
            -- Get Player Color
            if dest_name == "Player" then
              ITrackU[spell_id]["debuffed"][dest_name]["color_red"] = 0.208
              ITrackU[spell_id]["debuffed"][dest_name]["color_green"] = 0.80
              ITrackU[spell_id]["debuffed"][dest_name]["color_blue"] = 0.192
              ITrackU[spell_id]["debuffed"][dest_name]["color_alpha"] = 0.5
            elseif dest_name == "Focus" then
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
            ITrackU[spell_id][dest_name].Text_PlayerStacks:SetText(math.random(5))
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
              
              -- Set MinMax Status Bar
              ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetMinMaxValues(0, 6)
              ITrackU[spell_id][dest_name].Timer = 4
              
              -- this function will run repeatedly, incrementing the value of timer as it goes
              ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetScript("OnUpdate", function(self, elapsed)
              ITrackU[spell_id][dest_name].Timer = ITrackU[spell_id][dest_name].Timer - elapsed
              self:SetValue(ITrackU[spell_id][dest_name].Timer)
                -- when timer has reached the desired value, as defined by global END (secTnds), restart it by setting it to 0, as defined by global START
                if ITrackU[spell_id][dest_name].Timer <= 2 then
                  ITrackU[spell_id][dest_name].Timer = 4
                end
              end)
            
            --Frame PlayerDistance
            if (ITrackU["DebuffToTrack"][spell_id]["Type"] == "Stack" or ITrackU["DebuffToTrack"][spell_id]["Type"] == "Spread") and dest_name ~= select(1, UnitName("player")) then
              ITrackU[spell_id][dest_name].Frame_PlayerDistance = get_frame()
              ITrackU[spell_id][dest_name].Frame_PlayerDistance = modify_frame(ITrackU[spell_id][dest_name].Frame_PlayerDistance, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_variable.WIDTH_PLAYER_DISTANCE, db_variable.HEIGHT_DEBUFFED, "TOPRIGHT", 0, i, 0, 0, 0, 1, "LOW")
              ITrackU[spell_id][dest_name].Frame_PlayerDistance:Show()
              player_distance_script(spell_id,dest_name)
            end
            
            ITrackU["DebuffToTrack"][spell_id]["Count"] = ITrackU["DebuffToTrack"][spell_id]["Count"] + 1
          end
        
        -- Positionning each frame
        for k, v in pairs(ITrackU["DebuffToTrack"]) do
          if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == true) or ITrackU["DebuffToTrack"][k]["IfActive"] == false then
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
              for l, w in pairs(ITrackU[k]["debuffed"]) do
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
end

-- Called when a combat log event is detected
local function combat_log_event_unfiltered_handler(self, ...)
  local timestamp, type, hide_caster, source_GUID, source_name, source_flags, source_flags_2, dest_GUID, dest_name, dest_flags, dest_flags_2 = ...
  if type == "SPELL_AURA_APPLIED" and ITrackU ~= nil then
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
          if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == true) or ITrackU["DebuffToTrack"][k]["IfActive"] == false then
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
              for l, w in pairs(ITrackU[k]["debuffed"]) do
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
      if ITrackU["DebuffToTrack"][spell_id] and ITrackU[spell_id][dest_name] ~= nil then
      
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
        if ITrackU["DebuffToTrack"][spell_id]["IfActive"] == true and ITrackU["DebuffToTrack"][spell_id]["Count"] == 0 then
          ITrackU[spell_id].Frame_Titre:Hide()
        end
        
        local i = 0
        
        for k, v in pairs(ITrackU["DebuffToTrack"]) do
          if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == true) or ITrackU["DebuffToTrack"][k]["IfActive"] == false then
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

-- Called when encounter starts
local function encounter_start(self, ...)
if ITrackU == nil or ITrackU == "ITrackU" then ITrackU = {} end
ITrackU["encounter_id"], _, _, _ = ...
player_regen_disabled_handler()
end  
---------------------------------------------------------------------------------------------------
-----------------------------------   EVENT HANDLER BINDINGS   ------------------------------------
---------------------------------------------------------------------------------------------------

local AllEventHandlers = {
    ["ENCOUNTER_START"] = encounter_start,
    --["PLAYER_REGEN_DISABLED"] = player_regen_disabled_handler,
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
------------------------------------   SLASH INITIALIZATION   -------------------------------------
--------------------------------------------------------------------------------------------------- 
 
SlashCmdList['ITRACKU_MAINFRAME_SLASHCMD'] = function()
  if ITrackU == nil then ITrackU = {} end
  ITrackU["encounter_id"] = 1111
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
  local encounter = EJ_GetCreatureInfo()
  print(encounter)
end
SLASH_ITRACKU_ENCOUNTER_SLASHCMD1 = '/encounter'

SlashCmdList['ITRACKU_FRAMETEST_SLASHCMD'] = function()
  if ITrackU == nil then ITrackU = {} end
  ITrackU["encounter_id"] = 1111
  player_regen_disabled_handler()
  combat_log_frame_test("SPELL_AURA_APPLIED", 125565, "Player", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 125565, "Focus", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 125565, "Mate1", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 23920, "Mate2", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 23920, "Player", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 23920, "Mate3", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 18499, "Focus", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 18499, "Mate4", "BUFF")
  combat_log_frame_test("SPELL_AURA_APPLIED", 18499, "Mate5", "BUFF")
  print("Addon Open")  
end
SLASH_ITRACKU_FRAMETEST_SLASHCMD1 = '/frametest'


SlashCmdList['ITRACKU_CLOSETEST_SLASHCMD'] = function()

end
SLASH_ITRACKU_CLOSETEST_SLASHCMD1 = '/closetest'