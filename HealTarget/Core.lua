local spellBeingCast, playerTarget, localClass, playerClass, spellFound, spellCheck

-- Beautified Print
local function Print(string)
	ChatFrame1:AddMessage(string, 1, 0.5, 0)
end

local function SpellIsFound(class, spell)
	spellCheck = nil
	for i = 1, #SPELLLIST[class] do
		if spell == SPELLLIST[class][i] then
			spellCheck = spell
		end
	end
	return spellCheck
end

local function castHandler(spellGUID, playerClass)
	localeTargetClass, targetClass = UnitClass("target")
	-- playerTarget = GetUnitName("playertarget")
	MainFrame.spellTex:SetTexture("Interface\\AddOns\\HealTarget\\icons\\spells\\" .. playerClass .. "\\" .. spellGUID .. ".tga")
	if playerTarget and UnitIsPlayer("target") then
		MainFrame.classTex:SetTexture("Interface\\AddOns\\HealTarget\\icons\\classes\\" .. targetClass .. ".tga")
		if targetClass == "DEATHKNIGHT" then
			TargetText:SetText("|cFFC41E3A" .. playerTarget .. "|r") -- red
			MainFrame:Show()
		elseif targetClass == "DRUID" then
			TargetText:SetText("|cFFFF7C0A" .. playerTarget .. "|r") -- orange
			MainFrame:Show()
		elseif targetClass == "HUNTER" then
			TargetText:SetText("|cFFAAD372" .. playerTarget .. "|r") -- green
			MainFrame:Show()
		elseif targetClass == "MAGE" then
			TargetText:SetText("|cFF3FC7EB" .. playerTarget .. "|r") -- blue
			MainFrame:Show()
		elseif targetClass == "PALADIN" then
			TargetText:SetText("|cFFF48CBA" .. playerTarget .. "|r") -- pink
			MainFrame:Show()
		elseif targetClass == "PRIEST" then
			TargetText:SetText("|cFFFFFFFF" .. playerTarget .. "|r") -- white
			MainFrame:Show()
		elseif targetClass == "ROGUE" then
			TargetText:SetText("|cFFFFF468" .. playerTarget .. "|r") -- yellow
			MainFrame:Show()
		elseif targetClass == "SHAMAN" then
			TargetText:SetText("|cFF0070DD" .. playerTarget .. "|r") -- blue
			MainFrame:Show()
		elseif targetClass == "WARLOCK" then
			TargetText:SetText("|cFF8788EE" .. playerTarget .. "|r") -- purple
			MainFrame:Show()
		elseif targetClass == "WARRIOR" then
			TargetText:SetText("|cFFC69B6D" .. playerTarget .. "|r") -- brown
			MainFrame:Show()
		end
	elseif not playerTarget then
		if playerClass == "DRUID" then
			TargetText:SetText("|cFFFF7C0A" .. GetUnitName("player") .. "|r") -- orange
			MainFrame.classTex:SetTexture("Interface\\AddOns\\HealTarget\\icons\\classes\\DRUID.tga")
			MainFrame:Show()
		elseif playerClass == "PALADIN" then
			TargetText:SetText("|cFFFF1493" .. GetUnitName("player") .. "|r") -- pink
			MainFrame.classTex:SetTexture("Interface\\AddOns\\HealTarget\\icons\\classes\\PALADIN.tga")
			MainFrame:Show()
		elseif playerClass == "PRIEST" then
			TargetText:SetText("|cFFF5F5F5" .. GetUnitName("player") .. "|r") -- white
			MainFrame.classTex:SetTexture("Interface\\AddOns\\HealTarget\\icons\\classes\\PRIEST.tga")
			MainFrame:Show()
		elseif playerClass == "SHAMAN" then
			TargetText:SetText("|cff0000ff" .. GetUnitName("player") .. "|r") -- blue
			MainFrame.classTex:SetTexture("Interface\\AddOns\\HealTarget\\icons\\classes\\SHAMAN.tga")
			MainFrame:Show()
		end
	elseif MainFrame:IsShown() then
		MainFrame:Hide()
	end
end

--f:SetScript("OnEvent", castHandler);

MainFrame:SetScript("OnEvent", function(self, event, ...)
	-- Triggers on player spellcast, given the spell is found in SpellList.lua
	if event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START" then
		local unit, spellGUID = ...
		localePlayerClass, playerClass = UnitClass("player")
		if unit == "player" then
			if playerClass == "DRUID" or playerClass == "PALADIN" or playerClass == "PRIEST" or playerClass == "SHAMAN" then
				MainFrame:Hide()
				if SpellIsFound(playerClass, spellGUID) then
					castHandler(spellGUID, playerClass)
				end
			end
		end
	end
	-- Triggers when player changes target
	if event == "PLAYER_TARGET_CHANGED" then
		playerTarget = GetUnitName("playertarget")
	end
	-- Triggers after player enters world or types "/reload"
	if event == "PLAYER_LOGIN" then
		DEFAULT_CHAT_FRAME:AddMessage("|cFF0070DDBethy|r's HealTarget loaded. Works only with Default Cast Bar. Enable 'Auto Self-Cast' for optimal performance.")
	end
end);