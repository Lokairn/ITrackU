---------------------------------------------------------------------------------------------------
--------------------------------   SAVED VARIABLES DECLARATIONS   ---------------------------------
---------------------------------------------------------------------------------------------------

-- Set all variables from saved variables or default ones if not available
local function addon_loaded(event, arg1)
  if arg1 == "ITrackU" then
  
    if ITrack == nil then ITrack = {} end

    local L = LibStub("AceLocale-3.0"):GetLocale("ITrackU")
    print(L["LOADING_ADDON"])
    ITrack.profile = UnitName("player").." - "..GetRealmName()
  end
end

---------------------------------------------------------------------------------------------------
-----------------------------------   EVENT HANDLER BINDINGS   ------------------------------------
---------------------------------------------------------------------------------------------------

local AllEventHandlers = {
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