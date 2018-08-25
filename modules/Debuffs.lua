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
---------------------------------   MAIN FRAIM INITIALIZATION   -----------------------------------
---------------------------------------------------------------------------------------------------

local function addon_initialization(self, ...)
  local Frame_Main = CreateFrame("FRAME", "Frame_Main", UIParent)

  -- SavedVariables init
  if db_ITrackU.profiles[ITrack.profile].ANCHOR_POINT == nil then
    db_ITrackU.profiles[ITrack.profile].ANCHOR_POINT = "CENTER"
  end

  if db_ITrackU.profiles[ITrack.profile].POSITION_X == nil then
    db_ITrackU.profiles[ITrack.profile].POSITION_X = 0
  end

  if db_ITrackU.profiles[ITrack.profile].POSITION_Y == nil then
    db_ITrackU.profiles[ITrack.profile].POSITION_Y = 0
  end

  if db_ITrackU.profiles[ITrack.profile].ZOOM_PERCENTAGE == nil then
    db_ITrackU.profiles[ITrack.profile].ZOOM_PERCENTAGE = 0.07
  end

  Frame_Main:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
  Frame_Main:SetWidth(db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL + db_ITrackU.profiles[ITrack.profile].WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + db_ITrackU.profiles[ITrack.profile].WIDTH_PLAYER_DISTANCE)
  Frame_Main:SetHeight(0)
  Frame_Main:SetBackdropColor(1,0,0,0)
  Frame_Main:SetPoint(db_ITrackU.profiles[ITrack.profile].ANCHOR_POINT,db_ITrackU.profiles[ITrack.profile].POSITION_X,db_ITrackU.profiles[ITrack.profile].POSITION_Y)
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
  f = modify_frame(f, nil, nil, 0, 0, "CENTER", 0, 0, 0, 0, 0, 0, "BACKGROUND")
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

local function find_unit_aura(unit, spell, filter)
    --print(unit, spell, filter)
    for i = 1, 40 do
        local name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, nameplateShowAll, timeMod, value1, value2, value3 = UnitAura(unit, i, filter)
        --print(spellId, spell)
        if not name then return end
        if spell == spellId or spell == name then
            --print("Ca marche")
            return name, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, nameplateShowAll, timeMod, value1, value2, value3, i
        end
    end
end


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
local function get_table(from_table, encounter, difficulty)
  if encounter ~= nil then
    local t = {}
      for k, v in pairs(from_table[encounter][difficulty]) do
        if from_table[encounter][difficulty][k].Activate then
          t[k] = {}
          for m, x in pairs(from_table[encounter][difficulty][k]) do
            t[k][m] = x
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
  if Frame_Main then
    Frame_Main:SetPoint(db_ITrackU.profiles[ITrack.profile].ANCHOR_POINT,x_value,db_ITrackU.profiles[ITrack.profile].POSITION_Y)
  end
end

function update_main_frame_y(y_value)
  if Frame_Main then
    Frame_Main:SetPoint(db_ITrackU.profiles[ITrack.profile].ANCHOR_POINT, db_ITrackU.profiles[ITrack.profile].POSITION_X, y_value)
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


  point, _, _, xOfs, yOfs = Frame_Main:GetPoint()
  db_ITrackU.profiles[ITrack.profile].ANCHOR_POINT = point
  db_ITrackU.profiles[ITrack.profile].POSITION_X = xOfs
  db_ITrackU.profiles[ITrack.profile].POSITION_Y = yOfs

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
  if ITrackU.DebuffToTrack then
    for k, v in pairs(ITrackU.DebuffToTrack) do
      ITrackU[k].Frame_Titre:SetBackdropColor(r, g, b, a)
    end
  end
end

-- Update Player Background Color
function update_debuffed_background_color()
	if ITrackU.DebuffToTrack then	
	  for k, v in pairs(ITrackU.DebuffToTrack) do
	    for l, w in pairs(ITrackU[k].debuffed) do
	      if w and ITrackU[k][l].Stacks < ITrackU.DebuffToTrack[k].MaxStacksNumber then
          ITrackU[k].debuffed[l].color_red, ITrackU[k].debuffed[l].color_green, ITrackU[k].debuffed[l].color_blue, ITrackU[k].debuffed[l].color_alpha = get_debuffed_color("TEST", k, l)
          ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(ITrackU[k].debuffed[l].color_red, ITrackU[k].debuffed[l].color_green, ITrackU[k].debuffed[l].color_blue, ITrackU[k].debuffed[l].color_alpha)
          ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(ITrackU[k].debuffed[l].color_red, ITrackU[k].debuffed[l].color_green, ITrackU[k].debuffed[l].color_blue, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_STATUSBAR)
        end
	    end
	  end
	end
end

-- Update MaxStack Background Color
function update_background_color_maxstack(r, g, b, a)
	if ITrackU.DebuffToTrack then
	  for k, v in pairs(ITrackU.DebuffToTrack) do
	    for l, w in pairs(ITrackU[k].debuffed) do
	      if w and ITrackU[k][l].Stacks >= ITrackU.DebuffToTrack[k].MaxStacksNumber then
	    	ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(r, g, b, a)
	    	ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(r, g, b, 1)
	      end
	    end
	  end
	end
end

-- Update Alpha StatusBar Background Color.
function update_alpha_color_statusbar(a)
	if ITrackU.DebuffToTrack then
	  for k, v in pairs(ITrackU.DebuffToTrack) do
	    for l, w in pairs(ITrackU[k].debuffed) do
	      if w then
	      	if ITrackU[k][l].Stacks >= ITrackU.DebuffToTrack[k].MaxStacksNumber then
	    			ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK, a)
	    		elseif l == "Player" then
	    			ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_PLAYER, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_PLAYER, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_PLAYER, a)
	    		elseif l == "Focus" then
	    			ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_FOCUS, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_FOCUS, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_FOCUS, a)
	    		else
	    			ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MATE, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MATE, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MATE, a)
	    		end
	      end
	    end
	  end
	end
end

-- Get Color for Player Debuffed Frame
function get_debuffed_color(Env, spell_id, dest_name)
	if dest_name == select(1, UnitName("player")) or dest_name == "Player" then
		if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_PLAYER then
			if Env == "PROD" then	
			      r = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].r
			      g = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].g
			      b = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].b
			      a = db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_PLAYER
			elseif Env == "TEST" then
			      r = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].r
			      g = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].g
			      b = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].b
			      a = db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_PLAYER					
			end
		else
			r = db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_PLAYER
			g = db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_PLAYER
			b = db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_PLAYER
			a = db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_PLAYER			
		end
	elseif dest_name == select(1, UnitName("focus")) or dest_name == "Focus" then
		if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_FOCUS then
			if Env == "PROD" then
			      r = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].r
			      g = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].g
			      b = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].b
			      a = db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_FOCUS	
			elseif Env == "TEST" then
			      r = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].r
			      g = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].g
			      b = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].b
			      a = db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_FOCUS							
			end	
		else
			r = db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_FOCUS
			g = db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_FOCUS
			b = db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_FOCUS
			a = db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_FOCUS   			
		end
	else
		if db_ITrackU.profiles[ITrack.profile].ENABLE_CLASS_COLOR_MATE then
			if Env == "PROD" then
			      r = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].r
			      g = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].g
			      b = ITrack.Raid_Class_Color[select(2, UnitClass("dest_name"))].b
			      a = db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_MATE				
			elseif Env == "TEST" then
			      r = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].r
			      g = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].g
			      b = ITrack.Raid_Class_Color[ITrack.Roster_Test[dest_name].Class].b
			      a = db_ITrackU.profiles[ITrack.profile].COLOR_A_CLASS_COLOR_MATE							
			end			
		else
			r = db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MATE
			g = db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MATE
			b = db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MATE
			a = db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MATE  			
		end
	end
	return r, g, b, a
end

-- Update Fonts
function update_fonts()
  if ITrackU.DebuffToTrack then
    for k, v in pairs(ITrackU.DebuffToTrack) do 
      ITrackU[k].Text_Frame_Titre:SetFont("Fonts\\FRIZQT__.TTF", db_ITrackU.profiles[ITrack.profile].FONT_TITRE_SIZE, "MONOCHROME")
      ITrackU[k].Text_Frame_Titre:SetTextColor(db_ITrackU.profiles[ITrack.profile].FONT_TITRE_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_A_COLOR) 
      for l, w in pairs(ITrackU[k].debuffed) do
        if w then
          ITrackU[k][l].Text_PlayerStacks:SetFont("Fonts\\FRIZQT__.TTF", db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_SIZE, "MONOCHROME")
          ITrackU[k][l].Text_PlayerStacks:SetTextColor(db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_A_COLOR)          
          ITrackU[k][l].Text_PlayerDebuffed:SetFont("Fonts\\FRIZQT__.TTF", db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_SIZE, "MONOCHROME")
          ITrackU[k][l].Text_PlayerDebuffed:SetTextColor(db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_G_COLOR)        
        end 
      end 
    end
  end
end


-- Update texture zoom 
function update_icon_zoom(zoom_value)
  if ITrackU.DebuffToTrack ~= nil then
    for k, v in pairs(ITrackU.DebuffToTrack) do
      local new_left, new_right, new_top, new_bottom
      new_left = zoom_value
      new_right = 1 - zoom_value
      new_top = zoom_value
      new_bottom = 1 - zoom_value

      ITrackU[k].Icon_Frame_Titre:SetTexCoord(new_left,new_right,new_top,new_bottom)
    end
  end

end

---------------------------------------------------------------------------------------------------
-------------------------------   ONUPDATE EVENT HANDLING METHODS   -------------------------------
---------------------------------------------------------------------------------------------------

-- Calculate the distance between the player and the player debuffed. Green if ok, red if not.
local function player_distance_script(k, l, Env)
  ITrackU[k][l].Frame_PlayerDistance:SetScript("OnUpdate", function(self, elapsed)
	if Env == "PROD" then
    		ITrackU[k][l].Distance = compute_distance(l, select(1, UnitName("player")))
	elseif Env == "TEST" then
		ITrackU[k][l].Distance = 1			
	end
      if ITrackU[k][l].Distance then
        if ITrackU.DebuffToTrack[k].Type == "Stack" then
          if ITrackU[k][l].Distance < ITrackU.DebuffToTrack[k].TypeDistance then
            ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_OK,db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_OK,db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_OK,db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_OK)
          else
            ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_KO,db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_KO,db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_KO,db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_KO)
          end

        elseif ITrackU.DebuffToTrack[k].Type == "Spread" then
          if ITrackU[k][l].Distance < ITrackU.DebuffToTrack[k].TypeDistance then
            ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_KO,db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_KO,db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_KO,db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_KO)
          else
            ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DISTANCE_OK,db_ITrackU.profiles[ITrack.profile].COLOR_G_DISTANCE_OK,db_ITrackU.profiles[ITrack.profile].COLOR_B_DISTANCE_OK,db_ITrackU.profiles[ITrack.profile].COLOR_A_DISTANCE_OK)
          end
        end
      end
  end)
end

-- Calculate the stacks and remaining duration of the debuff/buff
local function update_timer(k, l, minimum, maximum, auratype, filter)
  ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", function(self, elapsed)  
    
    local _, _, aura_stacks, _, aura_max, aura_expiration, _, _, _, _, _, _, _, _, _, _, _, _ = find_unit_aura(l, k, filter)

    --Stacks
    if aura_stacks then ITrackU[k][l].Stacks = aura_stacks end
    -- Max
    if aura_max then ITrackU[k][l].ModifMax = aura_max end
    -- ExpirationTime
    if aura_expiration then ITrackU[k][l].ExpirationTime = aura_expiration end
    
    if maximum then
      if maximum ~= ITrackU[k][l].ModifMax then
        ITrackU[k][l].Timer = (ITrackU[k][l].ExpirationTime - GetTime()) * maximum / ITrackU[k][l].ModifMax
      else
        ITrackU[k][l].Timer = ITrackU[k][l].ExpirationTime - GetTime()
      end
    end

    if maximum then
    	self:SetValue(ITrackU[k][l].Timer)
    else
    	self:SetValue(1)
    end

    if ITrackU[k][l].Stacks == 0 or ITrackU[k][l].Stacks == 1 then
      ITrackU[k][l].Text_PlayerStacks:SetText("")
    else
      ITrackU[k][l].Text_PlayerStacks:SetText(ITrackU[k][l].Stacks)
    end
    -- Alert if stacks > max stacks
    if ITrackU.DebuffToTrack[k].MaxStacks == true and ITrackU[k][l].Stacks >= ITrackU.DebuffToTrack[k].MaxStacksNumber then
      ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MAXSTACK)
      ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_STATUSBAR)
    end

    -- when timer has reached the desired value, as defined by global END (secTnds), restart it by setting it to 0, as defined by global START
    --print("Timer = ", ITrackU[k][l].Timer)
    --print("Minimum = ", minimum)
    --print("Maximum = ", maximum)
    if minimum and ITrackU[k][l].Timer then
      if ITrackU[k][l].Timer <= minimum and maximum then
        self:SetValue(0)
        ITrackU[k][l].Text_PlayerStacks:SetText("")
        ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", nil)
      end
    end
  end)
end

---------------------------------------------------------------------------------------------------
-------------------------------   INGAME EVENT HANDLING METHODS   ---------------------------------
---------------------------------------------------------------------------------------------------

-- Called when the player regen is disabled
local function player_regen_disabled_handler(self, ...)

  if ITrackU == nil or ITrackU == "ITrackU" then ITrackU = {} end
  ITrackU.DebuffToTrack = get_table(db_ITrackU.profiles[ITrack.profile].debuffs_table, ITrackU.encounter_id, ITrackU.difficulty)

  if ITrackU.DebuffToTrack ~= nil then
    if Frame_Main == nil then
      addon_initialization()
    else
      Frame_Main:Show()
    end  


    local i = 0
    
    for k, v in pairs(ITrackU.DebuffToTrack) do
      -- Frame_Titre[k]
      ITrackU[k] = {}
      ITrackU[k].Frame_Titre = get_frame()
      ITrackU[k].Frame_Titre = modify_frame(ITrackU[k].Frame_Titre, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL, db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE, "TOPLEFT", 0, i, db_ITrackU.profiles[ITrack.profile].COLOR_R_TITRE, db_ITrackU.profiles[ITrack.profile].COLOR_G_TITRE, db_ITrackU.profiles[ITrack.profile].COLOR_B_TITRE, db_ITrackU.profiles[ITrack.profile].COLOR_A_TITRE, "LOW")
                           
      -- Text_Frame_Titre
      ITrackU[k].Text_Frame_Titre = ITrackU[k].Frame_Titre:CreateFontString("Text_Frame_Titre", "OVERLAY", "GameFontNormal")
      ITrackU[k].Text_Frame_Titre:SetPoint("LEFT", db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE + 4, 0)
      ITrackU[k].Text_Frame_Titre:SetText(select(1, GetSpellInfo(k)))
      ITrackU[k].Text_Frame_Titre:SetFont("Fonts\\FRIZQT__.TTF", db_ITrackU.profiles[ITrack.profile].FONT_TITRE_SIZE, "MONOCHROME")
      ITrackU[k].Text_Frame_Titre:SetTextColor(db_ITrackU.profiles[ITrack.profile].FONT_TITRE_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_TITRE_A_COLOR)    

      -- Icon_Frame_Titre
      ITrackU[k].Icon_Frame_Titre = ITrackU[k].Frame_Titre:CreateTexture(nil,"MEDIUM")
      ITrackU[k].Icon_Frame_Titre:SetTexture(select(3, GetSpellInfo(k)))    

      -- Set the icon zoom level  
      local zoom_level = db_ITrackU.profiles[ITrack.profile].ZOOM_PERCENTAGE
      ITrackU[k].Icon_Frame_Titre:SetTexCoord(zoom_level, 1 - zoom_level, zoom_level, 1 - zoom_level)

      ITrackU[k].Icon_Frame_Titre:SetPoint("LEFT", 0, 0)
      ITrackU[k].Icon_Frame_Titre:SetWidth(db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE)
      ITrackU[k].Icon_Frame_Titre:SetHeight(db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE)
      
      -- Init Table Track joueurs
      ITrackU[k].debuffed = {}
      ITrackU[k].Frame_PlayerDebuffed = {}
      ITrackU[k].Text_PlayerDebuffed = {}
      
      -- MAJ Frames
      if ITrackU.DebuffToTrack[k].IfActive == false then
        ITrackU[k].Frame_Titre:Show()
        i = i - db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE - db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE
        Frame_Main:SetHeight((-1)*i)
      else
        ITrackU[k].Frame_Titre:Hide()
      end   
      
    end
  end
end

-- Called when the player regen is enabled
local function encounter_end(self, ...)
  if ITrackU then
    if ITrackU.DebuffToTrack then
      for k, v in pairs(ITrackU.DebuffToTrack) do
        if ITrackU[k].debuffed then
          for l, w in pairs(ITrackU[k].debuffed) do
            if w then
              if ITrackU.DebuffToTrack[k].Type == "Stack" or ITrackU.DebuffToTrack[k].Type == "Spread" and l ~= select(1, UnitName("player")) then
              	ITrackU[k][l].Frame_PlayerDistance:SetScript("OnUpdate", nil)
                remove_frame(ITrackU[k][l].Frame_PlayerDistance)
              end
              ITrackU[k][l].Frame_PlayerDebuffed:SetValue(0)
              ITrackU[k][l].Frame_PlayerDebuffed:SetScript("OnUpdate", nil)
              ITrackU[k][l].Text_PlayerDebuffed:SetText("")
              ITrackU[k][l].Text_PlayerStacks:SetText("")
              remove_frame(ITrackU[k][l].Frame_PlayerDebuffed)
            end
          end
        end
        ITrackU[k].Icon_Frame_Titre:SetTexture(nil)
        ITrackU[k].Text_Frame_Titre:SetText("")
        remove_frame(ITrackU[k].Frame_Titre)
      end
     ITrackU = nil
     Frame_Main:SetHeight(0)
     Frame_Main:Hide()
    end
  end
end

-- Called to create table and frame when player buffed / debuffed 
local function table_frame_player_debuffed(Env, type, spell_id, dest_name, aura_type)
  if ITrackU.DebuffToTrack then

      -- to be continued
      if ITrackU.DebuffToTrack[spell_id] and (ITrackU.DebuffToTrack[spell_id].PlayerOnly == "All" or (ITrackU.DebuffToTrack[spell_id].PlayerOnly == "Player" and dest_name == select(1, UnitName("player"))) or (ITrackU.DebuffToTrack[spell_id].PlayerOnly == "Focus" and dest_name == select(1, UnitName("focus"))) or (ITrackU.DebuffToTrack[spell_id].PlayerOnly == "Player_Focus" and (dest_name == select(1, UnitName("player")) or dest_name == select(1, UnitName("focus"))))) then
        local i = 0
          ITrackU[spell_id][dest_name] = {}

          -- Création ligne
          if ITrackU[spell_id].debuffed[dest_name] == nil then ITrackU[spell_id].debuffed[dest_name] = {} end
          ITrackU[spell_id].debuffed[dest_name] = {
                        aura_type = aura_type,
                        frame_active = "yes"
                        }
          
          -- Get Player Color
          ITrackU[spell_id].debuffed[dest_name].color_red, ITrackU[spell_id].debuffed[dest_name].color_green, ITrackU[spell_id].debuffed[dest_name].color_blue, ITrackU[spell_id].debuffed[dest_name].color_alpha = get_debuffed_color(Env, spell_id, dest_name)       
          
          -- Create Frame
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed = get_frame()
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed = modify_frame(ITrackU[spell_id][dest_name].Frame_PlayerDebuffed, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL, db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED, "TOPLEFT", 0, i, ITrackU[spell_id].debuffed[dest_name].color_red, ITrackU[spell_id].debuffed[dest_name].color_green, ITrackU[spell_id].debuffed[dest_name].color_blue, ITrackU[spell_id].debuffed[dest_name].color_alpha, "LOW")                     
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:Hide()
          
          --PlayerStacksText
          ITrackU[spell_id][dest_name].Text_PlayerStacks = ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:CreateFontString("Text_PlayerStacks", "OVERLAY", "GameFontNormal")
          ITrackU[spell_id][dest_name].Text_PlayerStacks:SetPoint("RIGHT", -5, 0)
          ITrackU[spell_id][dest_name].Text_PlayerStacks:SetFont("Fonts\\FRIZQT__.TTF", db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_SIZE, "MONOCHROME")
          ITrackU[spell_id][dest_name].Text_PlayerStacks:SetTextColor(db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_STACK_A_COLOR)

            --Frame_PlayerDebuffed StatusBar
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetStatusBarTexture([[Interface\ChatFrame\ChatFrameBackground]])
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetStatusBarColor(ITrackU[spell_id].debuffed[dest_name].color_red,ITrackU[spell_id].debuffed[dest_name].color_green,ITrackU[spell_id].debuffed[dest_name].color_blue, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_STATUSBAR)
            ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetFillStyle("REVERSE")

          if Env == "TEST" then
            ITrackU[spell_id][dest_name].Stacks = math.random(5)
            ITrackU[spell_id][dest_name].Text_PlayerStacks:SetText(ITrackU[spell_id][dest_name].Stacks)

            if ITrackU[spell_id][dest_name].Stacks >= ITrackU.DebuffToTrack[spell_id].MaxStacksNumber then
            	ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_MAXSTACK)
      			ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_G_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_B_DEBUFFED_MAXSTACK, db_ITrackU.profiles[ITrack.profile].COLOR_A_DEBUFFED_STATUSBAR)
            end
          end
          
          -- PlayerDebuffedText
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed = ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:CreateFontString("Text_PlayerDebuffed", "OVERLAY", "GameFontNormal")
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetPoint("CENTER", 0, 0)
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetFont("Fonts\\FRIZQT__.TTF", db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_SIZE, "MONOCHROME")
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetTextColor(db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_R_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_G_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_B_COLOR, db_ITrackU.profiles[ITrack.profile].FONT_DEBUFFED_NAME_G_COLOR)
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetText(dest_name)

          -- Filter
          if aura_type == "BUFF" then
            ITrackU[spell_id][dest_name].Filter = "HELPFUL"
          elseif aura_type == "DEBUFF" then
            ITrackU[spell_id][dest_name].Filter = "HARMFUL"
          end  

          -- Status Bar
            if Env == "PROD" then
              -- Variable Max
              ITrackU[spell_id][dest_name].Min = 0

              -- Max
               _, _, _, _, ITrackU[spell_id][dest_name].Max, _, _, _, _, _, _, _, _, _, _, _, _, _ = find_unit_aura(dest_name, spell_id, ITrackU[spell_id][dest_name].Filter)                                         
              -- Set MinMax Status Bar
              if ITrackU[spell_id][dest_name].Max then
              	ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetMinMaxValues(ITrackU[spell_id][dest_name].Min, ITrackU[spell_id][dest_name].Max)
              else
              	ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetMinMaxValues(ITrackU[spell_id][dest_name].Min, 1)
              end
              
              -- this function will run repeatedly, incrementing the value of timer as it goes
              update_timer(spell_id,dest_name, ITrackU[spell_id][dest_name].Min, ITrackU[spell_id][dest_name].Max, ITrackU[spell_id].debuffed[dest_name].aura_type, ITrackU[spell_id][dest_name].Filter)
            
            elseif Env == "TEST" then
              ITrackU[spell_id][dest_name].Timer = 4
              ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetMinMaxValues(0, 6)
              ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetScript("OnUpdate", function(self, elapsed) 
                ITrackU[spell_id][dest_name].Timer = ITrackU[spell_id][dest_name].Timer - elapsed
                self:SetValue(ITrackU[spell_id][dest_name].Timer)
                if ITrackU[spell_id][dest_name].Timer <= 2 then
                  ITrackU[spell_id][dest_name].Timer = 4
                end            
              end)

            end
                       
          --Frame PlayerDistance
          if (ITrackU.DebuffToTrack[spell_id].Type == "Stack" or ITrackU.DebuffToTrack[spell_id].Type == "Spread") and dest_name ~= select(1, UnitName("player")) then
            ITrackU[spell_id][dest_name].Frame_PlayerDistance = get_frame()
            ITrackU[spell_id][dest_name].Frame_PlayerDistance = modify_frame(ITrackU[spell_id][dest_name].Frame_PlayerDistance, Frame_Main, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_PLAYER_DISTANCE, db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED, "TOPLEFT", db_ITrackU.profiles[ITrack.profile].WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL, i, 0, 0, 0, 1, "LOW")
            ITrackU[spell_id][dest_name].Frame_PlayerDistance:Hide()
            player_distance_script(spell_id,dest_name, Env)
          end
          
          ITrackU.DebuffToTrack[spell_id].Count = ITrackU.DebuffToTrack[spell_id].Count + 1
      end
  end
end

-- Called to order frame 
function order_frame_player_debuff()

  local Height_Main = 0
  local i = {}
  i[0] = 0
  i[1] = 0
  i[2] = 0
  if ITrackU.DebuffToTrack then
    -- Positionning each frame
    for k, v in pairs(ITrackU.DebuffToTrack) do
      
        if (ITrackU.DebuffToTrack[k].Count ~= 0 and ITrackU.DebuffToTrack[k].IfActive == true) or ITrackU.DebuffToTrack[k].IfActive == false then
          -- Frame_Titre[k]

          if db_ITrackU.profiles[ITrack.profile].MODULE_DEBUFF.HORIZONTAL_OPENING == "RIGHT" then
            ITrackU[k].Frame_Titre:SetPoint("TOPLEFT", db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS * ITrackU.DebuffToTrack[k].Columns, i[ITrackU.DebuffToTrack[k].Columns])
          elseif db_ITrackU.profiles[ITrack.profile].MODULE_DEBUFF.HORIZONTAL_OPENING == "LEFT" then
            ITrackU[k].Frame_Titre:SetPoint("TOPLEFT", -(db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS * ITrackU.DebuffToTrack[k].Columns), i[ITrackU.DebuffToTrack[k].Columns])
          end

          ITrackU[k].Frame_Titre:SetHeight(db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE)
          ITrackU[k].Frame_Titre:SetWidth(db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL)

      -- MAJ i
      if ITrackU.DebuffToTrack[k].Count > 0 then
        i[ITrackU.DebuffToTrack[k].Columns] = i[ITrackU.DebuffToTrack[k].Columns] - db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE - db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE_DEBUFFED
      else
        i[ITrackU.DebuffToTrack[k].Columns] = i[ITrackU.DebuffToTrack[k].Columns] - db_ITrackU.profiles[ITrack.profile].HEIGHT_TITLE
      end

      -- MAJ Height Frame Principale
      Height_Main = math.min(Height_Main, i[ITrackU.DebuffToTrack[k].Columns])
      Frame_Main:SetHeight(Height_Main)
      
      ITrackU[k].Frame_Titre:Show()
                                       
          -- PlayerDebuffed[k]
          if ITrackU.DebuffToTrack[k].Count > 0 then
            for l, w in pairs(ITrackU[k].debuffed) do
                  if ITrackU[k].debuffed[l].frame_active == "yes" then                          
                    
                    ITrackU[k][l].Frame_PlayerDebuffed:Show()
                    
                    -- MAJ Frame_PlayerDebuffed Positionning

                    if db_ITrackU.profiles[ITrack.profile].MODULE_DEBUFF.HORIZONTAL_OPENING == "RIGHT" then
                      ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT", db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS * ITrackU.DebuffToTrack[k].Columns, i[ITrackU.DebuffToTrack[k].Columns])
                    elseif db_ITrackU.profiles[ITrack.profile].MODULE_DEBUFF.HORIZONTAL_OPENING == "LEFT" then
                      ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT", -(db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS * ITrackU.DebuffToTrack[k].Columns), i[ITrackU.DebuffToTrack[k].Columns])
                    end

                    ITrackU[k][l].Frame_PlayerDebuffed:SetHeight(db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED)
                    ITrackU[k][l].Frame_PlayerDebuffed:SetWidth(db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL)
                    
                    --Frame PlayerDistance
                    if (ITrackU.DebuffToTrack[k].Type == "Stack" or ITrackU.DebuffToTrack[k].Type == "Spread") and l ~= select(1, UnitName("player")) then
                      ITrackU[k][l].Frame_PlayerDistance:Show()

                      if db_ITrackU.profiles[ITrack.profile].MODULE_DEBUFF.HORIZONTAL_OPENING == "RIGHT" then
                        ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPLEFT", db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS * ITrackU.DebuffToTrack[k].Columns + db_ITrackU.profiles[ITrack.profile].WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL, i[ITrackU.DebuffToTrack[k].Columns])
                      elseif db_ITrackU.profiles[ITrack.profile].MODULE_DEBUFF.HORIZONTAL_OPENING == "LEFT" then
                        ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPLEFT", -(db_ITrackU.profiles[ITrack.profile].WIDTH_BETWEEN_COLUMNS * ITrackU.DebuffToTrack[k].Columns) + db_ITrackU.profiles[ITrack.profile].WIDTH_ECART_GLOBAL_PLAYER_DISTANCE + db_ITrackU.profiles[ITrack.profile].WIDTH_GLOBAL, i[ITrackU.DebuffToTrack[k].Columns])
                      end

                      ITrackU[k][l].Frame_PlayerDistance:SetHeight(db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED)
                    end
                    
                    -- MAJ i
                    i[ITrackU.DebuffToTrack[k].Columns] = i[ITrackU.DebuffToTrack[k].Columns] - db_ITrackU.profiles[ITrack.profile].HEIGHT_DEBUFFED - db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_DEBUFFED
                             
                    -- MAJ Height Frame Principale
                    Height_Main = math.min(Height_Main, i[ITrackU.DebuffToTrack[k].Columns])
                    Frame_Main:SetHeight(Height_Main)
                  end
            end
          end
          i[ITrackU.DebuffToTrack[k].Columns] = i[ITrackU.DebuffToTrack[k].Columns] - db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_TITLE
        end
    end
  end
end

-- Called when a combat log event is detected
local function combat_log_event_unfiltered_handler()
if ITrackU then
  if ITrackU.DebuffToTrack then
  local timestamp, type, hide_caster, source_GUID, source_name, source_flags, source_flags_2, dest_GUID, dest_name, dest_flags, dest_flags_2 = CombatLogGetCurrentEventInfo()
    -- Aura Applied
    if (type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_APPLIED_DOSE") and ITrackU then
      local _, _, _, _, _, _, _, _, _, _, _, spell_id, _, _, aura_type  = CombatLogGetCurrentEventInfo()
        
        if ITrackU_showauras then
          ITrackU_showauras.bdd[spell_id] = aura_type
        end
        
      	if ITrackU[spell_id] then
	        -- Create Frame & Table
	        if ITrackU[spell_id].debuffed[dest_name] == nil then
	        	table_frame_player_debuffed("PROD", type, spell_id, dest_name, aura_type)
	        else
	        	if ITrackU[spell_id].debuffed[dest_name].frame_active == "No" then
	        		table_frame_player_debuffed("PROD", type, spell_id, dest_name, aura_type)
	        	end	
	    	end
	        -- Order Frame
	        order_frame_player_debuff()
	    end
    end
    
    -- Aura removed
    if type == "SPELL_AURA_REMOVED" and ITrackU then
      if ITrackU.DebuffToTrack then
        local _, _, _, _, _, _, _, _, _, _, _, spell_id, aura_type = CombatLogGetCurrentEventInfo()
        if ITrackU.DebuffToTrack[spell_id] and ITrackU[spell_id][dest_name] then
        
          -- On remove la frame si Stack ou Spread
          if (ITrackU.DebuffToTrack[spell_id].Type == "Stack" or ITrackU.DebuffToTrack[spell_id].Type == "Spread") and dest_name ~= select(1, UnitName("player")) then
            remove_frame(ITrackU[spell_id][dest_name].Frame_PlayerDistance)
          end      
        
          -- Vider les tables
          ITrackU[spell_id].debuffed[dest_name] = nil
          ITrackU[spell_id][dest_name].Frame_PlayerDebuffed:SetScript("OnUpdate", nil)
          remove_frame(ITrackU[spell_id][dest_name].Frame_PlayerDebuffed)
          ITrackU[spell_id][dest_name].Text_PlayerDebuffed:SetText("")
          ITrackU[spell_id][dest_name].Text_PlayerStacks:SetText("")
          
          -- On hide la frame titre si Count = 0
          ITrackU.DebuffToTrack[spell_id].Count = ITrackU.DebuffToTrack[spell_id].Count - 1
          if ITrackU.DebuffToTrack[spell_id].IfActive == true and ITrackU.DebuffToTrack[spell_id].Count == 0 then
            ITrackU[spell_id].Frame_Titre:Hide()
          end
          
          -- Order Frame
          order_frame_player_debuff()
          
        end
      end
    end

    -- Ally dead
    if type == "UNIT_DIED" and ITrackU then
      if ITrackU.DebuffToTrack then
        for k, v in pairs(ITrackU.DebuffToTrack) do
          if ITrackU[k].debuffed[dest_name] then


            -- On remove la frame si Stack ou Spread
            if (ITrackU.DebuffToTrack[k].Type == "Stack" or ITrackU.DebuffToTrack[k].Type == "Spread") and dest_name ~= select(1, UnitName("player")) then
              remove_frame(ITrackU[k][dest_name].Frame_PlayerDistance)
            end      
          
            -- Vider les tables
            ITrackU[k].debuffed[dest_name] = nil
            ITrackU[k][dest_name].Frame_PlayerDebuffed:SetScript("OnUpdate", nil)
            remove_frame(ITrackU[k][dest_name].Frame_PlayerDebuffed)
            ITrackU[k][dest_name].Text_PlayerDebuffed:SetText("")
            ITrackU[k][dest_name].Text_PlayerStacks:SetText("")
            
            -- On hide la frame titre si Count = 0
            ITrackU.DebuffToTrack[k].Count = ITrackU.DebuffToTrack[k].Count - 1
            if ITrackU.DebuffToTrack[k].IfActive == true and ITrackU.DebuffToTrack[k].Count == 0 then
              ITrackU[k].Frame_Titre:Hide()
            end
            
            -- Order Frame
            order_frame_player_debuff()


          end
        end
      end

    end
  end
end
end

-- Called when encounter starts
local function encounter_start(self, ...)
if ITrackU == nil or ITrackU == "ITrackU" then ITrackU = {} end
  if db_ITrackU.profiles[ITrack.profile].DEBUFF_ACTIVATE then
  	if ITrackU.DebuffToTrack then
  		encounter_end()
  	end
  	ITrackU.encounter_id, _, _, _ = ...
    ITrackU.difficulty = select(3, GetInstanceInfo())

    --Set ShowAuras
    ITrackU_showauras = {}
    ITrackU_showauras.bdd = {}
    ITrackU_showauras.encounter = ITrackU.encounter_id 
    ITrackU_showauras.difficulty = ITrackU.difficulty
    
    print("Encounter_ID = ", ITrackU.encounter_id)
    print("Difficulty = ", ITrackU.difficulty)

      -- Ne se lances que si répertorié
      if db_ITrackU.profiles[ITrack.profile].debuffs_table[ITrackU.encounter_id] then
        if db_ITrackU.profiles[ITrack.profile].debuffs_table[ITrackU.encounter_id][ITrackU.difficulty] then
        	player_regen_disabled_handler()
          order_frame_player_debuff()
        end
      end
  end
end  

---------------------------------------------------------------------------------------------------
-----------------------------------   EVENT HANDLER BINDINGS   ------------------------------------
---------------------------------------------------------------------------------------------------

local AllEventHandlers = {
    ENCOUNTER_START = encounter_start,
    --.PLAYER_REGEN_DISABLED = player_regen_disabled_handler,
    ENCOUNTER_END = encounter_end,
    COMBAT_LOG_EVENT_UNFILTERED = combat_log_event_unfiltered_handler,
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
		if ITrackU.DebuffToTrack then
			encounter_end()
		end
  ITrackU.difficulty = 2
  ITrackU.encounter_id = 2222
  player_regen_disabled_handler()
  order_frame_player_debuff()
end
SLASH_ITRACKU_MAINFRAME_SLASHCMD1 = '/mainframe'

SlashCmdList['ITRACKU_CLOSEFRAME_SLASHCMD'] = function()
  encounter_end()
end
SLASH_ITRACKU_CLOSEFRAME_SLASHCMD1 = '/closeframe'

SlashCmdList['ITRACKU_SHOWAURAS_SLASHCMD'] = function()
  print("héhé")
end
SLASH_ITRACKU_SHOWAURAS_SLASHCMD1 = '/showauras'

---------------------------------------------------------------------------------------------------
-----------------------------------------   FRAME TEST   ------------------------------------------
--------------------------------------------------------------------------------------------------- 

-- Open FrameTest for Options
function open_frame_test()
	if ITrackU == nil then ITrackU = {} end
	if ITrackU.DebuffToTrack then
		encounter_end()
	else
	  if ITrackU == nil then ITrackU = {} end
	  ITrackU.encounter_id = 2222
    ITrackU.difficulty = 2
	  player_regen_disabled_handler()
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 132404, "Player", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 132404, "Focus", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 132404, "Mate1", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 23920, "Mate2", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 23920, "Player", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 23920, "Mate3", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 18499, "Focus", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 18499, "Mate4", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 18499, "Mate5", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 188783, "Mate6", "BUFF")
	  table_frame_player_debuffed("TEST", "SPELL_AURA_APPLIED", 188783, "Player", "BUFF")
	  order_frame_player_debuff()
	end
end
