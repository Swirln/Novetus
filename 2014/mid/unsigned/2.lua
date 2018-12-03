--rbxsig%MgmxzgmsPB3UcMLj3wYOkSOtbJsnF8I/Q2PguW7Zp3gKE5GIm1qUzyTGgBs16GXCrbZXVB9/EYfxZseJ7qCfooUsxcWpC5Jqvff2QD1KjoP3CgvH1QpYjoSKE5ZRem3JHWoeGXtMJiubYX2ApRkqv2EFmFkfNFkXv6Tp7EP1YQk=%
--rbxassetid%2%
-- Library Registration Script
-- This script is used to register RbxLua libraries on game servers, so game scripts have
-- access to all of the libraries (otherwise only local scripts do)

local sc = game:GetService("ScriptContext")
local tries = 0
 
while not sc and tries < 3 do
	tries = tries + 1
	sc = game:GetService("ScriptContext")
	wait(0.2)
end
 
if sc then
	sc:RegisterLibrary("Libraries/RbxGui", "21")
	sc:RegisterLibrary("Libraries/RbxGear", "22")
	sc:RegisterLibrary("Libraries/RbxUtility", "23")
	sc:RegisterLibrary("Libraries/RbxStamper", "24")
	sc:LibraryRegistrationComplete()
else
	print("failed to find script context, libraries did not load")
end
