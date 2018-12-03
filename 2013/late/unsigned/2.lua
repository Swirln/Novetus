%Xc9VQQO+w6Rjhl9/Yx9J/xhj+z3clOXxCrs1aJYtNPxbnDJrd7r4/TIz822KunCCrxhWDPEEmGVtxUlq8tU5lsKgxiHuuhmXdOucMzkoaEfGJsRIBKfhz3gdQpCl2h6QPXVj9CsLAA4rkp5ePo8ZnZMEYf0fIoYBaDvQz0JHSxw=%%2%
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
	sc:RegisterLibrary("Libraries/RbxGui", "17")
	sc:RegisterLibrary("Libraries/RbxGear", "18")

	sc:RegisterLibrary("Libraries/RbxUtility", "19")
	sc:RegisterLibrary("Libraries/RbxStamper", "20")
	sc:LibraryRegistrationComplete()
else
	print("failed to find script context, libraries did not load")
end
