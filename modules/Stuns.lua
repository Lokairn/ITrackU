---------------------------------------------------------------------------------------------------
--------------------------------   SAVED VARIABLES DECLARATIONS   ---------------------------------
---------------------------------------------------------------------------------------------------

-- Set all variables from saved variables or default ones if not available
local function addon_loaded(event, arg1)

  if arg1 == "ITrackU" then
    if db_ITrackU_Stun == nil then db_ITrackU_Stun = {} end
    if ITrackUStuns == nil then ITrackUStuns = {} end
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
	if f then
	  f:Hide()
	  tinsert(framepool, f)
	end
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
----------------------------------------   OPTIONS TOOLS   ----------------------------------------
---------------------------------------------------------------------------------------------------

function ITrackU_Stuns_Modify_Frames()
	if ITrack.SpellKnown then

    i = 0
    --Pour chaque sort de la table ITrack.SpellStun_SpellID on affiche une frame
      for k, v in pairs(ITrack.SpellKnown) do
        ITrackUStuns[k].frame_stun_target = modify_frame(ITrackUStuns[k].frame_stun_target, UIParent, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_STUNS, db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS, "CENTER", db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_X , db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_Y - ((db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS + db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_STUNS) * i), 1, 0, 0, 1, "BACKGROUND")
        i = i + 1
    	end	

	elseif ITrackUStuns.frame_stun_target then

    ITrackUStuns.frame_stun_target = modify_frame(ITrackUStuns.frame_stun_target, UIParent, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_STUNS, db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS, "CENTER", db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_X , db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_Y - ((db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS + db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_STUNS) * i), 1, 0, 0, 1, "BACKGROUND")
	
	end 
end

---------------------------------------------------------------------------------------------------
-----------------------------------------   TOOL METHODS   ----------------------------------------
---------------------------------------------------------------------------------------------------

local function get_table_spellknown(table)
	local t = {}
	for k, v in pairs(table) do
		if IsSpellKnown(k) then
			t[k] = true
		end
	end
	return t
end
local function get_table_itemusable(table)
	local t = {}
		for k, v in pairs(table) do
			if IsEquippedItem(k) then
				t[k] = true
			end
		end 
	return t
end

local function open_stun_frame()
	ITrack.SpellKnown = get_table_spellknown(db_ITrackU.profiles[ITrack.profile].spells_stun_table)
	ITrack.ItemEquipped = get_table_spellknown(db_ITrackU.profiles[ITrack.profile].items_stun_table)
  if ITrack.SpellKnown or ITrack.ItemEquipped then
    i = 0
    if ITrack.SpellKnown then
    --Pour chaque sort de la table ITrack.SpellStun_SpellID on affiche une frame
      for k, v in pairs(ITrack.SpellKnown) do
        if ITrackUStuns[k] == nil then ITrackUStuns[k] = {} end

        ITrackUStuns[k].frame_stun_target = get_frame()
        ITrackUStuns[k].frame_stun_target = modify_frame(ITrackUStuns[k].frame_stun_target, UIParent, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_STUNS, db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS, "CENTER", db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_X , db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_Y - ((db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS + db_ITrackU.profiles[ITrack.profile].HEIGHT_BETWEEN_STUNS) * i), 1, 0, 0, 1, "BACKGROUND")
        ITrackUStuns[k].frame_stun_target:Show()

        ITrackUStuns[k].text_frame_stun_target = ITrackUStuns[k].frame_stun_target:CreateFontString("GUID_Text", "OVERLAY", "GameFontNormal")
        ITrackUStuns[k].text_frame_stun_target:SetPoint("CENTER", 0, 0)
        ITrackUStuns[k].text_frame_stun_target:SetText(select(1, GetSpellInfo(k)))

	      -- Icon_Frame_Titre
	      ITrackUStuns[k].icon_frame_stun_target = ITrackUStuns[k].frame_stun_target:CreateTexture(nil,"MEDIUM")
	      ITrackUStuns[k].icon_frame_stun_target:SetTexture(select(3, GetSpellInfo(k)))

	      ITrackUStuns[k].icon_frame_stun_target:SetPoint("LEFT", -(db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS + 1), 0)
	      ITrackUStuns[k].icon_frame_stun_target:SetWidth(db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS)
	      ITrackUStuns[k].icon_frame_stun_target:SetHeight(db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS)

	      -- StatusBar
        ITrackUStuns[k].frame_stun_target:SetStatusBarTexture([[Interface\ChatFrame\ChatFrameBackground]])
        ITrackUStuns[k].frame_stun_target:SetStatusBarColor(0, 1, 0, 1) 
        ITrackUStuns[k].frame_stun_target:SetMinMaxValues(0, 1)
        ITrackUStuns[k].frame_stun_target:SetScript("OnUpdate", function(self, elapsed)
        	ITrackUStuns[k].Timer = select(2, GetSpellCooldown(k))
        		if ITrackUStuns[k].Timer <= 1.5 then
        			self:SetValue(1)
        			ITrackUStuns[k].frame_stun_target:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_SPELL_OK)
        			ITrackUStuns[k].frame_stun_target:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_OK, db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_OK, 0)
        		else
        			self:SetValue(1 - (((select(1, GetSpellCooldown(k)) + select(2, GetSpellCooldown(k))) - GetTime())/ select(2, GetSpellCooldown(k))))
        			ITrackUStuns[k].frame_stun_target:SetStatusBarColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_STATUSBAR_SPELL_KO)
        			ITrackUStuns[k].frame_stun_target:SetBackdropColor(db_ITrackU.profiles[ITrack.profile].COLOR_R_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_G_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_B_STUN_SPELL_KO, db_ITrackU.profiles[ITrack.profile].COLOR_A_STUN_SPELL_KO)
        		end
     		end)

        i = i + 1
    	end
    end
    if ITrack.ItemEquipped then

    end
  else
    -- Pas de sorts de stun donc on affiche juste "stunnable"
        ITrackUStuns.frame_stun_target = get_frame()
        ITrackUStuns.frame_stun_target = modify_frame(ITrackUStuns.frame_stun_target, UIParent, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, db_ITrackU.profiles[ITrack.profile].WIDTH_STUNS, db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS, "CENTER", db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_X , db_ITrackU.profiles[ITrack.profile].STUNS_POSITION_Y, 1, 0, 0, 1, "BACKGROUND")
        ITrackUStuns.frame_stun_target:Show()

        ITrackUStuns.text_frame_stun_target = ITrackUStuns.frame_stun_target:CreateFontString("GUID_Text", "OVERLAY", "GameFontNormal")
        ITrackUStuns.text_frame_stun_target:SetPoint("CENTER", 0, 0)
        ITrackUStuns.text_frame_stun_target:SetText("Stunnable")

	      -- Icon_Frame_Titre
	      ITrackUStuns.icon_frame_stun_target = ITrackUStuns.frame_stun_target:CreateTexture(nil,"MEDIUM")
	      ITrackUStuns.icon_frame_stun_target:SetTexture(select(3, GetSpellInfo(k)))

	      ITrackUStuns.icon_frame_stun_target:SetPoint("LEFT", - (db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS + 1), 0)
	      ITrackUStuns.icon_frame_stun_target:SetWidth(db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS)
	      ITrackUStuns.icon_frame_stun_target:SetHeight(db_ITrackU.profiles[ITrack.profile].HEIGHT_STUNS)
  end
end

local function close_stun_frame()
  if ITrackUStuns.frame_stun_target then
  	ITrackUStuns.icon_frame_stun_target:SetTexture(nil)
    ITrackUStuns.text_frame_stun_target:SetText("")
    remove_frame(ITrackUStuns.frame_stun_target)
    ITrackUStuns.frame_stun_target = nil
  else  	
    if ITrack.SpellKnown then
      for k, v in pairs(ITrack.SpellKnown) do
      		if ITrackUStuns[k] then
      			if ITrackUStuns[k].frame_stun_target then
      				ITrackUStuns[k].frame_stun_target:SetScript("OnUpdate", nil)
      				ITrackUStuns[k].icon_frame_stun_target:SetTexture(nil)
			        ITrackUStuns[k].text_frame_stun_target:SetText("")
			        remove_frame(ITrackUStuns[k].frame_stun_target)
			        ITrackUStuns[k].frame_stun_target = nil
			      end
		      end
      end
    end
  end
  ITrack.SpellKnown = nil
end

---------------------------------------------------------------------------------------------------
----------------------------------------   TEST METHODS   ----------------------------------------
---------------------------------------------------------------------------------------------------

function ITrackU_Stuns_open_test_frame()
	close_stun_frame()
	open_stun_frame()
end

function ITrackU_Stuns_close_test_frame()
	close_stun_frame()
end

---------------------------------------------------------------------------------------------------
-------------------------------   INGAME EVENT HANDLING METHODS   ---------------------------------
---------------------------------------------------------------------------------------------------

local function player_target_changed_handler()

  close_stun_frame()
  if db_ITrackU.profiles[ITrack.profile].STUN_ACTIVATE then
    if not UnitIsDead("target") then
  	  if UnitIsEnemy("player","target") then
  	    if UnitGUID("target"):sub(0, 8) == "Creature" then

	      local unit_guid = UnitGUID("target"):sub(28,32)
	      	if db_ITrackU_Stun then
	      		if db_ITrackU_Stun[select(8, GetInstanceInfo())] then
	      			if db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())] then
	      				if db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid] then
					      	if db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid].Stunnable then
					      		open_stun_frame()
					      	end
				      	end
			      	end
		      	end
	        end
          
  	    end
  	  end
    end
	end
end

local function combat_log_event_unfiltered_handler(self, ...)
  if ITrack.dungeons_mapid[select(8, GetInstanceInfo())] then
    local timestamp, type, hide_caster, source_GUID, source_name, source_flags, source_flags_2, dest_GUID, dest_name, dest_flags, dest_flags_2 = CombatLogGetCurrentEventInfo()
      if type == "SPELL_AURA_APPLIED" and dest_GUID:sub(0,8) == "Creature" then
        local _, _, _, _, _, _, _, _, _, _, _, spell_id, _, _, _  = CombatLogGetCurrentEventInfo()
        if ITrack.Stun_SpellID[spell_id] then
          if db_ITrackU_Stun[select(8, GetInstanceInfo())] == nil then db_ITrackU_Stun[select(8, GetInstanceInfo())] = {} end
          if db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())] == nil then db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())] = {} end

          --Extract GUID
          local unit_guid_log = dest_GUID:sub(28,32)

          if db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid_log] == nil then 
          	db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid_log] = {} 
          	db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid_log].Name = dest_name
         	end
          	
          	if db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid_log].Stunnable == nil then
		          db_ITrackU_Stun[select(8, GetInstanceInfo())][select(3, GetInstanceInfo())][unit_guid_log].Stunnable = true
		          print(L["ADD_ADDED_TO_BDD"], unit_guid_log, " - ", dest_name)

		          -- Call changement de target si MAJ de la table
		          player_target_changed_handler()

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
    ["PLAYER_TARGET_CHANGED"] = player_target_changed_handler,
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

