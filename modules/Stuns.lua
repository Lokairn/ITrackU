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

local function open_stun_frame(unit_guid)
  if ITrack.SpellStun_SpellID[select(2, UnitClass("player"))] then
    i = 0

    --Pour chaque sort de la table ITrack.SpellStun_SpellID on affiche une frame
      for k, v in pairs(ITrack.SpellStun_SpellID[select(2, UnitClass("player"))]) do
        if ITrackUStuns[k] == nil then ITrackUStuns[k] = {} end

        ITrackUStuns[k].frame_stun_target = get_frame()
        ITrackUStuns[k].frame_stun_target = modify_frame(ITrackUStuns[k].frame_stun_target, TargetFrame, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, 200, 20, "CENTER", 0, (20 * i), 1, 0, 0, 1, "BACKGROUND")
        ITrackUStuns[k].frame_stun_target:Show()

        ITrackUStuns[k].text_frame_stun_target = ITrackUStuns.frame_stun_target:CreateFontString("GUID_Text", "OVERLAY", "GameFontNormal")
        ITrackUStuns[k].text_frame_stun_target:SetPoint("CENTER", 0, 0)
        ITrackUStuns[k].text_frame_stun_target:SetText(unit_guid)

        i = i - 1

      end
  else
    -- Pas de sorts de stun donc on affiche juste "stunnable"
        ITrackUStuns.frame_stun_target = get_frame()
        ITrackUStuns.frame_stun_target = modify_frame(ITrackUStuns.frame_stun_target, TargetFrame, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, 200, 20, "CENTER", 0, 0, 1, 0, 0, 1, "BACKGROUND")
        ITrackUStuns.frame_stun_target:Show()

        ITrackUStuns.text_frame_stun_target = ITrackUStuns.frame_stun_target:CreateFontString("GUID_Text", "OVERLAY", "GameFontNormal")
        ITrackUStuns.text_frame_stun_target:SetPoint("CENTER", 0, 0)
        ITrackUStuns.text_frame_stun_target:SetText("Stunnable")
  end
end

local function close_stun_frame()
  if ITrackUStuns.frame_stun_target then
    if ITrack.SpellStun_SpellID[select(2, UnitClass("player"))] then
      for k, v in pairs(ITrack.SpellStun_SpellID[select(2, UnitClass("player"))]) do
        ITrackUStuns[k].text_frame_stun_target:SetText("")
        remove_frame(ITrackUStuns[k].frame_stun_target)
        ITrackUStuns[k].frame_stun_target = nil
      end
    else
    ITrackUStuns.text_frame_stun_target:SetText("")
    remove_frame(ITrackUStuns.frame_stun_target)
    ITrackUStuns.frame_stun_target = nil
    end
  end
end

---------------------------------------------------------------------------------------------------
-------------------------------   INGAME EVENT HANDLING METHODS   ---------------------------------
---------------------------------------------------------------------------------------------------

local function player_target_changed_handler()

  close_stun_frame()

  if UnitIsEnemy("player","target") then
    if UnitGUID("target"):sub(0, 8) == "Creature" then

      local unit_guid = UnitGUID("target"):sub(25,29)

      open_stun_frame(unit_guid)

    end
  end
end

local function combat_log_event_unfiltered_handler(self, ...)
  if ITrack.dungeons_mapid[select(7, GetInstanceInfo())] then
    local timestamp, type, hide_caster, source_GUID, source_name, source_flags, source_flags_2, dest_GUID, dest_name, dest_flags, dest_flags_2 = CombatLogGetCurrentEventInfo()
      if type == "SPELL_AURA_APPLIED" then
        local _, _, _, _, _, _, _, _, _, _, _, spell_id, _, _, aura_type  = CombatLogGetCurrentEventInfo()
        if ITrack.Stun_SpellID[spell_id] then
          if db_ITrackU_Stun[select(7, GetInstanceInfo())] == nil then db_ITrackU_Stun[select(7, GetInstanceInfo())] = {} end
          if db_ITrackU_Stun[select(7, GetInstanceInfo())][select(3, GetInstanceInfo())] == nil then db_ITrackU_Stun[select(7, GetInstanceInfo())][select(3, GetInstanceInfo())] = {} end
          if db_ITrackU_Stun[select(7, GetInstanceInfo())][select(3, GetInstanceInfo())][dest_GUID] == nil then db_ITrackU_Stun[select(7, GetInstanceInfo())][select(3, GetInstanceInfo())][dest_GUID] = {} end
          db_ITrackU_Stun[select(7, GetInstanceInfo())][select(3, GetInstanceInfo())][dest_GUID].Stunnable = true
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
