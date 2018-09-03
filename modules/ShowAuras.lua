SlashCmdList['ITRACKU_SHOWAURAS_SLASHCMD'] = function()

---------------------------------------------------------------------------------------------------
------------------------------------   CONSTANT DECLARATIONS   ------------------------------------
---------------------------------------------------------------------------------------------------

  local ITrackU_ShowAuras_GlobalHeight = 20
  local ITrackU_ShowAuras_GLobalWidth = 200
  local ITrackU_ShowAuras_WidthBetweenItems = 10
  local ITrackU_ShowAuras_HeightBetweenItems = 5


  if ITrackU_showauras then

---------------------------------------------------------------------------------------------------
---------------------------------   MAIN FRAME INITIALIZATION   -----------------------------------
---------------------------------------------------------------------------------------------------

    ITrackU_ShowAuras_Frame = CreateFrame("FRAME", "ITrackU_ShowAuras_Frame", UIParent)
    ITrackU_ShowAuras_Frame:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
    ITrackU_ShowAuras_Frame:SetWidth(ITrackU_ShowAuras_GLobalWidth)
    ITrackU_ShowAuras_Frame:SetHeight(40)
    ITrackU_ShowAuras_Frame:SetBackdropColor(1,0,0,1)
    ITrackU_ShowAuras_Frame:SetPoint("CENTER", 0, 0)
    ITrackU_ShowAuras_Frame:SetFrameStrata("MEDIUM")
    ITrackU_ShowAuras_Frame:Show()

---------------------------------------------------------------------------------------------------
--------------------------------   TITRE FRAME INITIALIZATION   -----------------------------------
---------------------------------------------------------------------------------------------------

    ITrackU_ShowAuras_Titre_Frame = CreateFrame("FRAME", "ITrackU_ShowAuras_Titre_Frame", ITrackU_ShowAuras_Frame)
    ITrackU_ShowAuras_Titre_Frame:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
    ITrackU_ShowAuras_Titre_Frame:SetWidth(ITrackU_ShowAuras_GLobalWidth)
    ITrackU_ShowAuras_Titre_Frame:SetHeight(ITrackU_ShowAuras_GlobalHeight)
    ITrackU_ShowAuras_Titre_Frame:SetBackdropColor(0,1,0,1)
    ITrackU_ShowAuras_Titre_Frame:SetPoint("TOPLEFT", 0, 0)
    ITrackU_ShowAuras_Titre_Frame:SetFrameStrata("HIGH")
    ITrackU_ShowAuras_Titre_Frame:Show()

      -- Text_Frame_Titre
      ITrackU_ShowAuras_Titre_Text = ITrackU_ShowAuras_Titre_Frame:CreateFontString("ITrackU_ShowAuras_Titre_Text", "OVERLAY", "GameFontNormal")
      ITrackU_ShowAuras_Titre_Text:SetPoint("CENTER", 0, 0)
      ITrackU_ShowAuras_Titre_Text:SetText(ITrackU_showauras.encounter.." - "..ITrackU_showauras.difficulty)
      ITrackU_ShowAuras_Titre_Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "MONOCHROME")
      ITrackU_ShowAuras_Titre_Text:SetTextColor(1, 0, 0, 1)

---------------------------------------------------------------------------------------------------
-----------------------------   TITRE PLAYER FRAME INITIALIZATION   -------------------------------
---------------------------------------------------------------------------------------------------

    if ITrackU_showauras.bdd.PLAYER then
      ITrackU_ShowAuras_Titre_Player_Frame = CreateFrame("FRAME", "ITrackU_ShowAuras_Titre_Player_Frame", ITrackU_ShowAuras_Frame)
      ITrackU_ShowAuras_Titre_Player_Frame:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
      ITrackU_ShowAuras_Titre_Player_Frame:SetWidth(ITrackU_ShowAuras_GLobalWidth)
      ITrackU_ShowAuras_Titre_Player_Frame:SetHeight(ITrackU_ShowAuras_GlobalHeight)
      ITrackU_ShowAuras_Titre_Player_Frame:SetBackdropColor(0,0,1,1)
      ITrackU_ShowAuras_Titre_Player_Frame:SetPoint("TOPLEFT", 0, -ITrackU_ShowAuras_GlobalHeight)
      ITrackU_ShowAuras_Titre_Player_Frame:SetFrameStrata("HIGH")
      ITrackU_ShowAuras_Titre_Player_Frame:Show()

        -- Text_Frame_Titre
        ITrackU_ShowAuras_Titre_Player_Text = ITrackU_ShowAuras_Titre_Player_Frame:CreateFontString("ITrackU_ShowAuras_Titre_Player_Text", "OVERLAY", "GameFontNormal")
        ITrackU_ShowAuras_Titre_Player_Text:SetPoint("CENTER", 0, 0)
        ITrackU_ShowAuras_Titre_Player_Text:SetText("Buffs/Debuffs Alliés")
        ITrackU_ShowAuras_Titre_Player_Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "MONOCHROME")
        ITrackU_ShowAuras_Titre_Player_Text:SetTextColor(1, 0, 0, 1)

        --Init
        local updated = false
        local i = 0
        local j = 0
        ITrackU_ShowAuras_Player_Auras_Frame = {}   
        ITrackU_ShowAuras_Player_Auras_Text = {}

        local Player_Activated = false

        if Player_Activated then

          for k, v in pairs(ITrackU_showauras.bdd.PLAYER) do
            ITrackU_ShowAuras_Player_Auras_Frame[k] = CreateFrame("FRAME", "ITrackU_ShowAuras_Player_Auras_Frame", ITrackU_ShowAuras_Frame)
            ITrackU_ShowAuras_Player_Auras_Frame[k]:SetBackdrop({bgFile = [[Interface\ChatFrame\ChatFrameBackground]]});
            ITrackU_ShowAuras_Player_Auras_Frame[k]:SetWidth(ITrackU_ShowAuras_GLobalWidth)
            ITrackU_ShowAuras_Player_Auras_Frame[k]:SetHeight(ITrackU_ShowAuras_GlobalHeight)
            ITrackU_ShowAuras_Player_Auras_Frame[k]:SetBackdropColor(0,0,1,1)
            ITrackU_ShowAuras_Player_Auras_Frame[k]:SetPoint("TOPLEFT", ITrackU_ShowAuras_WidthBetweenItems + i*(ITrackU_ShowAuras_GLobalWidth + ITrackU_ShowAuras_WidthBetweenItems), (-2*ITrackU_ShowAuras_GlobalHeight) - (j*(ITrackU_ShowAuras_GlobalHeight + ITrackU_ShowAuras_HeightBetweenItems)))
            ITrackU_ShowAuras_Player_Auras_Frame[k]:SetFrameStrata("HIGH")
            ITrackU_ShowAuras_Player_Auras_Frame[k]:Show()

              -- Text_Frame_Titre
              ITrackU_ShowAuras_Player_Auras_Text[k] = ITrackU_ShowAuras_Player_Auras_Frame[k]:CreateFontString("ITrackU_ShowAuras_Player_Auras_Text", "OVERLAY", "GameFontNormal")
              ITrackU_ShowAuras_Player_Auras_Text[k]:SetPoint("CENTER", 0, 0)
              ITrackU_ShowAuras_Player_Auras_Text[k]:SetText(k.." - "..(select(1, GetSpellInfo(k))))
              ITrackU_ShowAuras_Player_Auras_Text[k]:SetFont("Fonts\\FRIZQT__.TTF", 10, "MONOCHROME")
              ITrackU_ShowAuras_Player_Auras_Text[k]:SetTextColor(1, 0, 0, 1)

            if not updated then
            --Update other frames
              -- Frame Principale
              ITrackU_ShowAuras_Frame:SetWidth(ITrackU_ShowAuras_WidthBetweenItems + (i+1)*(ITrackU_ShowAuras_GLobalWidth + ITrackU_ShowAuras_WidthBetweenItems))

              --Frame Titre           
              ITrackU_ShowAuras_Titre_Frame:SetWidth(ITrackU_ShowAuras_WidthBetweenItems + (i+1)*(ITrackU_ShowAuras_GLobalWidth + ITrackU_ShowAuras_WidthBetweenItems))

              -- Frame Titre Player
              ITrackU_ShowAuras_Titre_Player_Frame:SetWidth(ITrackU_ShowAuras_WidthBetweenItems + (i+1)*(ITrackU_ShowAuras_GLobalWidth + ITrackU_ShowAuras_WidthBetweenItems))
            end


            -- Update HEight MAin Frame
            ITrackU_ShowAuras_Frame:SetHeight((2*ITrackU_ShowAuras_GlobalHeight) + ((j+1)*(ITrackU_ShowAuras_GlobalHeight + ITrackU_ShowAuras_HeightBetweenItems)))



            --Update i and j
            i = i + 1
            if i == 5 then
              i = 0
              j = j + 1
              updated = true
            end
          end

        end

---------------------------------------------------------------------------------------------------
----------------------------   TITRE CREATURE FRAME INITIALIZATION   ------------------------------
---------------------------------------------------------------------------------------------------

    end
  end
end
SLASH_ITRACKU_SHOWAURAS_SLASHCMD1 = '/showauras'