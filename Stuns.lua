---------------------------------------------------------------------------------------------------
--------------------------------   SAVED VARIABLES DECLARATIONS   ---------------------------------
---------------------------------------------------------------------------------------------------



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

  if ITrackUStuns == nil then ITrackUStuns = {} end

  ITrackUStuns.frame_stun_target = get_frame()
  ITrackUStuns.frame_stun_target = modify_frame(ITrackUStuns.frame_stun_target, UIParent, {bgFile = [[Interface\ChatFrame\ChatFrameBackground]]}, 100, 100, "CENTER", 0, 0, 1, 0, 0, 1, "BACKGROUND")
  ITrackUStuns.text_frame_stun_target = ITrackUStuns.frame_stun_target:CreateFontString("GUID_Text", "OVERLAY", "GameFontNormal")
  ITrackUStuns.text_frame_stun_target:SetPoint("CENTER", 0, 0)
  ITrackUStuns.text_frame_stun_target:SetText(unit_guid)
  
end

local function close_stun_frame()

end

---------------------------------------------------------------------------------------------------
-------------------------------   INGAME EVENT HANDLING METHODS   ---------------------------------
---------------------------------------------------------------------------------------------------

local function player_target_changed_handler()
  if UnitIsEnemy("player","target") then
    if UnitGUID("target"):sub(0, 8) == "Creature" then
      local unit_guid = UnitGUID("target"):sub(25,29)

      open_stun_frame(unit_guid)

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
}
 
-- ITrackUFrame
local ITrackUFrame = CreateFrame("Frame")
for event, _ in pairs(AllEventHandlers) do
  ITrackUFrame:RegisterEvent(event)
end
ITrackUFrame:SetScript("OnEvent", function(self, event, ...)
    AllEventHandlers[event](self, ...)
end)
