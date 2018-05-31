print("Load réussi V4")
 
 --Next DEVS
 -- Max stacks
 -- Icon Rôle
 
-- FRAME Pool
local framepool = {}
    
	-- Remove frame
        local function removeframe(f)
            f:Hide()
            f:SetBackdrop(nil)
            f:SetParent(nil)
            tinsert(framepool, f)
        end
    
	-- Get Frame
        local function getframe()
            local f = tremove(framepool)
            if not f then
                -- Create your frame
                f = CreateFrame("StatusBar", nil)
            end
            return f
        end
	
	-- Distance between 2 players
	function ComputeDistance(unit2)
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
 
local ITrackU = {}
local Height_Title = 27
local Height_Debuffed = 20
local Width_Global = 150
local Width_PlayerDistance = 10
local Width_Ecart_Global_PlayerDistance = 3

	-- Get Table
	local function getTable()
		local t = {}
		for k, _ in pairs(Debuffs) do
			-- if k ==
				for l, w in pairs(Debuffs[k]) do
					for m, x in pairs(Debuffs[k][l]) do
						t[l] = {
							[m] = x
						}
					end
				end
		end
	end

-- IfActive = Yes/No
-- Type = Classic / Stack / Spread
-- TypeDistance = M or nil
-- Rôle = Tank / DPS / Heal / All
-- Max Stacks

local Debuffs = {
					[2074] = {
							[243961] = {
											["IfActive"] = "Yes",
											["Count"] = 0,
											["Type"] = "Classic",
											["TypeDistance"] = nil,
											["Rôle"] = "Tank"
										},
							[244093] = {
											["IfActive"] = "Yes",
											["Count"] = 0,
											["Type"] = "Classic",
											["TypeDistance"] = nil,
											["Rôle"] = "Tank"
										}
								}
				}
               
local AllEventHandlers = {
    ["PLAYER_REGEN_DISABLED"] = function(self, ...)
       
    end,
    ["PLAYER_REGEN_ENABLED"] = function(self, ...)
       for k, v in pairs(ITrackU["DebuffToTrack"]) do
			if ITrackU[k].Table_PlayerDebuffed ~= nil then
				for l, w in pairs(ITrackU[k].Table_PlayerDebuffed) do
					if l ~= nil then
						removeframe(ITrackU[k][l].Frame_PlayerDebuffed)
						removeframe(ITrackU[k][l].Frame_PlayerDistance)
					end
				end
			end
			removeframe(ITrackU[k].Frame_Titre)
	   end
	   ITrackU = nil
       Frame_Main:SetHeight(0)
       Frame_Main:Hide()
    end,
    ["COMBAT_LOG_EVENT_UNFILTERED"] = function(self, ...)
        local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, sourceFlags2, destGUID, destName, destFlags, destFlags2 = ...
            if (type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REFRESH" or type == "SPELL_AURA_APPLIED_DOSE") and ITrackU["DebuffToTrack"] ~= nil then
                local _, _, _, _, _, _, _, _, _, _, _, spellID, _, _, auratype  = ...
                    if ITrackU["DebuffToTrack"][spellID] then
							-- Si la ligne existe déjà, on met juste à jour les variables
							if ITrackU[spellID].Table_PlayerDebuffed[destName] == "True" then
							   
							--Sinon on créé une frame
							else
								-- Création ligne
								ITrackU[spellID].Table_PlayerDebuffed[destName] = "True"
								ITrackU[spellID][destName] = {}
								ITrackU[spellID][destName].AuraType = auratype
								ITrackU["DebuffToTrack"][spellID]["Count"] = ITrackU["DebuffToTrack"][spellID]["Count"] + 1
	 
								local i = 0
								for k, v in pairs(ITrackU["DebuffToTrack"]) do
									if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == "Yes") or ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
										-- Frame_Titre[k]
										ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)
										ITrackU[k].Frame_Titre:Show()
									   
										-- MAJ i
										i = i - Height_Title
									   
										-- MAJ Height Frame Principale
										Frame_Main:SetHeight((-1)*i)
																   
										-- PlayerDebuffed[k]
										if ITrackU[k].Table_PlayerDebuffed ~= nil then
											for l, w in pairs(ITrackU[k].Table_PlayerDebuffed) do
												if w ~= nil then
													if ITrackU[k][l].Activate == nil then
											   
														-- Frame_PlayerDebuffed[l]
														ITrackU[k][l].Frame_PlayerDebuffed = getframe()
														ITrackU[k][l].Frame_PlayerDebuffed:SetParent(Frame_Main)
														ITrackU[k][l].Frame_PlayerDebuffed:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
														ITrackU[k][l].Frame_PlayerDebuffed:SetWidth(Width_Global)
														ITrackU[k][l].Frame_PlayerDebuffed:SetHeight(Height_Debuffed)
															-- Color en fonction du joueur !
															if l == select(1, UnitName("player")) then
																ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(0.208,0.80,0.192,0.5)
															elseif l == select(1, UnitName("focus")) then
																ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(0.632,0.348,0.828,0.5)
															else
																ITrackU[k][l].Frame_PlayerDebuffed:SetBackdropColor(0.78,0.828,0.464,0.5)
															end
														ITrackU[k][l].Frame_PlayerDebuffed:SetPoint("TOPLEFT",0, i)
														ITrackU[k][l].Frame_PlayerDebuffed:SetFrameStrata("LOW")
														ITrackU[k][l].Frame_PlayerDebuffed:Show()
													   
														--Frame_PlayerDebuffed StatusBar
														ITrackU[k][l].Frame_PlayerDebuffed:SetStatusBarTexture([[Interface\ChatFrame\ChatFrameBackground]])
															-- Color en fonction du joueur !
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
																ITrackU[k][l].Frame_PlayerDistance = getframe()
																ITrackU[k][l].Frame_PlayerDistance:SetParent(Frame_Main)
																ITrackU[k][l].Frame_PlayerDistance:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
																ITrackU[k][l].Frame_PlayerDistance:SetWidth(Width_PlayerDistance)
																ITrackU[k][l].Frame_PlayerDistance:SetHeight(Height_Debuffed)
																ITrackU[k][l].Frame_PlayerDistance:SetBackdropColor(0,1,0,1)
																ITrackU[k][l].Frame_PlayerDistance:SetPoint("TOPRIGHT", 0, i)
																ITrackU[k][l].Frame_PlayerDistance:SetFrameStrata("LOW")
																ITrackU[k][l].Frame_PlayerDistance:Show()
																ITrackU[k][l].Frame_PlayerDistance:SetScript("OnUpdate", function(self, elapsed)
																	ITrackU[k][l].PlayerDistance = ComputeDistance(l, select(1, UnitName("player")))
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
																											
														--PlayerStacksText
														ITrackU[k][l].Text_PlayerStacks = ITrackU[k][l].Frame_PlayerDebuffed:CreateFontString("Text_PlayerStacks", "OVERLAY", "GameFontNormal")
														ITrackU[k][l].Text_PlayerStacks:SetPoint("RIGHT", 0, 0)
													   
														-- Variable Max
														ITrackU[k][l].Min = 0
														if auratype == "BUFF" then
															-- Max
															ITrackU[k][l].Max = select(6, UnitBuff(l, select(1, GetSpellInfo(k))))
														elseif auratype == "DEBUFF" then
															-- Max
															ITrackU[k][l].Max = select(6, UnitDebuff(l, select(1, GetSpellInfo(k))))
														end                                            
													   
														-- Set la statusbar
														ITrackU[k][l].Frame_PlayerDebuffed:SetMinMaxValues(ITrackU[k][l].Min, ITrackU[k][l].Max)
													   
															-- this function will run repeatedly, incrementing the value of timer as it goes
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
						   
														-- PlayerDebuffedText
														ITrackU[k][l].Text_PlayerDebuffed = ITrackU[k][l].Frame_PlayerDebuffed:CreateFontString("Text_PlayerDebuffed", "OVERLAY", "GameFontNormal")
														ITrackU[k][l].Text_PlayerDebuffed:SetPoint("CENTER", 0, 0)
														ITrackU[k][l].Text_PlayerDebuffed:SetText(l)
					 
														-- MAJ i
														i = i - Height_Debuffed
													   
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
														i = i - Height_Debuffed
													   
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
            if type == "SPELL_AURA_REMOVED" and ITrackU["DebuffToTrack"] ~= nil then
                local _, _, _, _, _, _, _, _, _, _, _, spellID, auratype = ...
                    if ITrackU["DebuffToTrack"][spellID] then
                       
                        -- Vider les tables
                        ITrackU[spellID].Table_PlayerDebuffed[destName] = nil
						ITrackU[spellID][destName].Text_PlayerStacks:SetText("")
						ITrackU[spellID][destName].Text_PlayerDebuffed:SetText("")
                        removeframe(ITrackU[spellID][destName].Frame_PlayerDebuffed)
						ITrackU["DebuffToTrack"][spellID]["Count"] = ITrackU["DebuffToTrack"][spellID]["Count"] - 1
							--On hide la frame titre si Count = 0
							if ITrackU["DebuffToTrack"][spellID]["IfActive"] == "Yes" and ITrackU["DebuffToTrack"][spellID]["Count"] == 0 then
								ITrackU[spellID].Frame_Titre:Hide()
							end
							--On remove la frame si Stack ou Spread
							if ITrackU["DebuffToTrack"][spellID]["Type"] == "Stack" or ITrackU["DebuffToTrack"][spellID]["Type"] == "Spread" then
								removeframe(ITrackU[spellID][destName].Frame_PlayerDistance)
							end
 
                        -- FRAME Deactivate
                        ITrackU[spellID][destName].Activate = nil
                                               
                            local i = 0
                            for k, v in pairs(ITrackU["DebuffToTrack"]) do
								if (ITrackU["DebuffToTrack"][k]["Count"] ~= 0 and ITrackU["DebuffToTrack"][k]["IfActive"] == "Yes") or ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
									-- Frame_Titre[k]
									ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)              
								   
									-- MAJ i
									i = i - Height_Title
								   
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
												i = i - Height_Debuffed
											   
												-- MAJ Height Frame Principale
												Frame_Main:SetHeight((-1)*i)
											   
										   end
										end
									end
								end
                            end
                       
                       
                    end
            end
           
            -- Pour début du combat
            if type == "SPELL_AURA_APPLIED" or type == "SPELL_AURA_REFRESH" then
                local _, _, _, _, _, _, _, _, _, _, _, spellID, auratype = ...
                local MyPlayer = select(1, UnitName("player"))
                    if spellID == 224001 and destName == MyPlayer then
						print("Lancé")
						ITrackU["DebuffToTrack"] = getTable()
                        local i = 0
                        for k, v in pairs(ITrackU["DebuffToTrack"]) do
                            -- Init
                            ITrackU[k] = {}
                            -- Frame_Titre[k]
                            ITrackU[k].Frame_Titre = getframe()
                            ITrackU[k].Frame_Titre:SetParent(Frame_Main)
                            ITrackU[k].Frame_Titre:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
                            ITrackU[k].Frame_Titre:SetWidth(Width_Global)
                            ITrackU[k].Frame_Titre:SetHeight(Height_Title)
                            ITrackU[k].Frame_Titre:SetBackdropColor(0.368,0.368,0.368,0.9)
                            ITrackU[k].Frame_Titre:SetPoint("TOPLEFT",0, i)
                            ITrackU[k].Frame_Titre:SetFrameStrata("LOW")
								if ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
									ITrackU[k].Frame_Titre:Show()
								else
									ITrackU[k].Frame_Titre:Hide()
								end
                                                       
                            -- Text_Frame_Titre
                            ITrackU[k].Text_Frame_Titre = ITrackU[k].Frame_Titre:CreateFontString("Text_Frame_Titre", "OVERLAY", "GameFontNormal")
                            ITrackU[k].Text_Frame_Titre:SetPoint("LEFT", Height_Title + 4, 0)
                            ITrackU[k].Text_Frame_Titre:SetText(select(1, GetSpellInfo(k)))    
 
                                -- Icon_Frame_Titre
                                ITrackU[k].Icon_Frame_Titre = ITrackU[k].Frame_Titre:CreateTexture(nil,"MEDIUM")
                                ITrackU[k].Icon_Frame_Titre:SetTexture(select(3, GetSpellInfo(k)))
                                ITrackU[k].Icon_Frame_Titre:SetPoint("LEFT", 0, 0)
                                ITrackU[k].Icon_Frame_Titre:SetWidth(Height_Title)
                                ITrackU[k].Icon_Frame_Titre:SetHeight(Height_Title)
                                ITrackU[k].Frame_Titre.texture = ITrackU[k].Icon_Frame_Titre                      
                           
                            -- MAJ i
								if ITrackU["DebuffToTrack"][k]["IfActive"] == "No" then
									i = i - Height_Title
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
}
 
-- Frame_Main
local Frame_Main = CreateFrame("FRAME", "Frame_Main", UIParent)
Frame_Main:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
Frame_Main:SetWidth(Width_Global + Width_Ecart_Global_PlayerDistance + Width_PlayerDistance)
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