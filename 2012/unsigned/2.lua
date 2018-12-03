%MgmxzgmsPB3UcMLj3wYOkSOtbJsnF8I/Q2PguW7Zp3gKE5GIm1qUzyTGgBs16GXCrbZXVB9/EYfxZseJ7qCfooUsxcWpC5Jqvff2QD1KjoP3CgvH1QpYjoSKE5ZRem3JHWoeGXtMJiubYX2ApRkqv2EFmFkfNFkXv6Tp7EP1YQk=%%2%
-- Library Registration Script
-- This script is used to register RbxLua libraries on game servers, so game scripts have
-- access to all of the libraries (otherwise only local scripts do)

local deepakTestingPlace = 3569749
local sc = game:GetService("ScriptContext")
local tries = 0
 
while not sc and tries < 3 do
	tries = tries + 1
	sc = game:GetService("ScriptContext")
	wait(0.2)
end
 
if sc then
	sc:RegisterLibrary("RbxGui", "14")
	sc:RegisterLibrary("RbxGear", "15")
	sc:RegisterLibrary("RbxUtility", "16")
	sc:LibraryRegistrationComplete()
else
	print("failed to find libraries")
end
