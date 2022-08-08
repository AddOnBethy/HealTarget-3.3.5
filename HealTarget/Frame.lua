local f = CreateFrame("FRAME", "MainFrame", CastingBarFrame)
	f:SetFrameStrata("MEDIUM")
	f:SetWidth(CastingBarFrame:GetWidth() + 16)
	f:SetHeight(HEIGHT.MAINFRAME)
	f:SetPoint("TOP", 0, 45)
	f:SetBackdrop({
	bgFile = "Interface/TutorialFrame/TutorialFrameBackground",
	edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
	tile = true, tileSize = 32, edgeSize = 32, 
	insets = { left = 4, right = 4, top = 4, bottom = 4 }})
	f:SetBackdropColor(0, 0, 0, 1);
	f.edgeBorder = CreateFrame("FRAME", nil, MainFrame)
		f.edgeBorder:SetFrameStrata("LOW")
		f.edgeBorder:SetWidth(WIDTH.EDGE_BORDER)
		f.edgeBorder:SetHeight(HEIGHT.EDGE_BORDER)
		f.edgeBorder:SetPoint("LEFT", -52, -8)
		f.edgeBorder:SetBackdrop({
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32, 
			insets = { left = 4, right = 4, top = 4, bottom = 4 }})

	f.spellTex = f:CreateTexture("SpellTex", "LOW")
		f.spellTex:SetPoint("LEFT", -OFFSET.TEXTURE_X, OFFSET.TEXTURE_Y)
		f.spellTex:SetSize(WIDTH.TEXTURE, HEIGHT.TEXTURE)

	f.edgeBorder = CreateFrame("FRAME", nil, MainFrame)
		f.edgeBorder:SetFrameStrata("LOW")
		f.edgeBorder:SetWidth(WIDTH.EDGE_BORDER)
		f.edgeBorder:SetHeight(HEIGHT.EDGE_BORDER)
		f.edgeBorder:SetPoint("RIGHT", 52, -8)
		f.edgeBorder:SetBackdrop({
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 4, right = 4, top = 4, bottom = 4 }})

	f.classTex = f:CreateTexture("ClassTex", "LOW")
		f.classTex:SetPoint("RIGHT", OFFSET.TEXTURE_X, OFFSET.TEXTURE_Y)
		f.classTex:SetSize(WIDTH.TEXTURE, HEIGHT.TEXTURE)

	f:Hide()

local t = MainFrame:CreateFontString("TargetText", "ARTWORK")
	t:SetFont("Fonts\\FRIZQT__.TTF", 17)
	t:SetPoint("CENTER", MainFrame, 0, 0)

f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("UNIT_SPELLCAST_START")
f:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
f:RegisterEvent("PLAYER_TARGET_CHANGED")