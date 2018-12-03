%MgmxzgmsPB3UcMLj3wYOkSOtbJsnF8I/Q2PguW7Zp3gKE5GIm1qUzyTGgBs16GXCrbZXVB9/EYfxZseJ7qCfooUsxcWpC5Jqvff2QD1KjoP3CgvH1QpYjoSKE5ZRem3JHWoeGXtMJiubYX2ApRkqv2EFmFkfNFkXv6Tp7EP1YQk=%%1%
-- novetus
local scriptContext = game:GetService("ScriptContext")

-- library registration
scriptContext:AddCoreScript(2, scriptContext,"/Libraries/LibraryRegistration/LibraryRegistration")

local function waitForChild(instance, name)
	while not instance:FindFirstChild(name) do
		instance.ChildAdded:wait()
	end
end
local function waitForProperty(instance, property)
	while not instance[property] do
		instance.Changed:wait()
	end
end

-- for some reason the buttons don't remove automatically

game.CoreGui.RobloxGui.ControlFrame.BottomLeftControl.Exit:Destroy()
game.CoreGui.RobloxGui.ControlFrame.BottomLeftControl.TogglePlayMode:Destroy()
game.CoreGui.RobloxGui.ControlFrame.BottomLeftControl.ToolButton:Destroy()

game.CoreGui.RobloxGui.ControlFrame.BottomRightControl.Help:Destroy()
game.CoreGui.RobloxGui.ControlFrame.BottomRightControl.RecordToggle:Destroy()
game.CoreGui.RobloxGui.ControlFrame.BottomRightControl.ReportAbuse:Destroy()
game.CoreGui.RobloxGui.ControlFrame.BottomRightControl.Screenshot:Destroy()
game.CoreGui.RobloxGui.ControlFrame.BottomRightControl.ToggleFullScreen:Destroy()

-- Responsible for tracking logging items
local scriptContext = game:GetService("ScriptContext")
scriptContext:AddCoreScript(3, scriptContext, "CoreScripts/Sections")

waitForChild(game:GetService("CoreGui"),"RobloxGui")
local screenGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")

-- ToolTipper  (creates tool tips for gui)
scriptContext:AddCoreScript(4,screenGui,"CoreScripts/ToolTip")

-- SettingsScript 
scriptContext:AddCoreScript(5,screenGui,"CoreScripts/Settings")

-- MainBotChatScript
scriptContext:AddCoreScript(6,screenGui,"CoreScripts/MainBotChatScript")

-- ChatScript
scriptContext:AddCoreScript(17,screenGui,"CoreScripts/ChatScript")

-- New Player List
scriptContext:AddCoreScript(7,screenGui,"CoreScripts/PlayerListScript")
-- Popup Script
scriptContext:AddCoreScript(8,screenGui,"CoreScripts/PopupScript")
-- Friend Notification Script (probably can use this script to expand out to other notifications)
scriptContext:AddCoreScript(9,screenGui,"CoreScripts/NotificationScript")

if game.CoreGui.Version >= 3 then
	-- Backpack Builder, creates most of the backpack gui
	scriptContext:AddCoreScript(10,screenGui,"CoreScripts/BackpackScripts/BackpackBuilder")

	waitForChild(screenGui,"CurrentLoadout")
	waitForChild(screenGui,"Backpack")
	local Backpack = screenGui.Backpack
	
	-- Manager handles all big backpack state changes, other scripts subscribe to this and do things accordingly
	if game.CoreGui.Version >= 7 then
		scriptContext:AddCoreScript(11,Backpack,"CoreScripts/BackpackScripts/BackpackManager")
	end
	
	-- Backpack Gear (handles all backpack gear tab stuff)
	game:GetService("ScriptContext"):AddCoreScript(12,Backpack,"CoreScripts/BackpackScripts/BackpackGear")
	-- Loadout Script, used for gear hotkeys
	scriptContext:AddCoreScript(13,screenGui.CurrentLoadout,"CoreScripts/BackpackScripts/LoadoutScript")
end