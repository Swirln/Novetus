-- Creates all neccessary scripts for the gui on initial load, everything except build tools
-- Created by Ben T. 10/29/10
-- Please note that these are loaded in a specific order to diminish errors/perceived load time by user
local scriptContext = game:GetService("ScriptContext")
local touchEnabled = game:GetService("UserInputService").TouchEnabled

Game:GetService("CoreGui"):WaitForChild("RobloxGui")
local screenGui = Game:GetService("CoreGui"):FindFirstChild("RobloxGui")

-- SettingsScript
scriptContext:AddCoreScriptLocal("CoreScripts/Settings", screenGui)

local luaControlsSuccess, luaControlsFlagValue = pcall(function() return settings():GetFFlag("UsePlayerScripts") end)
if not touchEnabled then
	-- ToolTipper  (creates tool tips for gui)
	scriptContext:AddCoreScriptLocal("CoreScripts/ToolTip", screenGui)
else
	if not luaControlsSuccess or luaControlsFlagValue == false then
		scriptContext:AddCoreScriptLocal("CoreScripts/TouchControls", screenGui)
	end
end

-- MainBotChatScript
scriptContext:AddCoreScriptLocal("CoreScripts/MainBotChatScript", screenGui)

-- Developer Console Script
scriptContext:AddCoreScriptLocal("CoreScripts/DeveloperConsole", screenGui)

-- Popup Script
scriptContext:AddCoreScriptLocal("CoreScripts/PopupScript", screenGui)
-- Friend Notification Script (probably can use this script to expand out to other notifications)
scriptContext:AddCoreScriptLocal("CoreScripts/NotificationScript", screenGui)
-- Chat script
local success, chatFlagValue = pcall(function() return settings():GetFFlag("NewLuaChatScript") end)
if success and chatFlagValue == true then
	scriptContext:AddCoreScriptLocal("CoreScripts/ChatScript2", screenGui)
else
	scriptContext:AddCoreScriptLocal("CoreScripts/ChatScript", screenGui)
end
-- Purchase Prompt Script
scriptContext:AddCoreScriptLocal("CoreScripts/PurchasePromptScript", screenGui)
-- Health Script
scriptContext:AddCoreScriptLocal("CoreScripts/HealthScript", screenGui)

local playerListSuccess, playerListFlagValue = pcall(function() return settings():GetFFlag("NewPlayerListScript") end)
if not touchEnabled then
	-- New Player List
	if playerListSuccess and playerListFlagValue == true then
		scriptContext:AddCoreScriptLocal("CoreScripts/PlayerListScript2", screenGui)
	else
		scriptContext:AddCoreScriptLocal("CoreScripts/PlayerListScript", screenGui)
	end
elseif Game:GetService("GuiService"):GetScreenResolution().Y >= 500 then
	-- New Player List
	if playerListSuccess and playerListFlagValue == true then
		scriptContext:AddCoreScriptLocal("CoreScripts/PlayerListScript2", screenGui)
	else
		scriptContext:AddCoreScriptLocal("CoreScripts/PlayerListScript", screenGui)
	end
end
		scriptContext:AddCoreScriptLocal("CoreScripts/BackpackScript", screenGui)


if touchEnabled then -- touch devices don't use same control frame
	-- only used for touch device button generation
	scriptContext:AddCoreScriptLocal("CoreScripts/ContextActionTouch", screenGui)

	screenGui:WaitForChild("ControlFrame")
	screenGui.ControlFrame:WaitForChild("BottomLeftControl")
	screenGui.ControlFrame.BottomLeftControl.Visible = false
end