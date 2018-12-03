%UHbAMIoQ0tlSDxScMdQJyYAs4yTcbMnmd0+rTPek/g21TARECEpg8ZhnFk6D1CW1kDnWCtrni3bdmj7zwttPQVg58k9cDHkHUz2lmTzwc6OlP3cKLrKlaN/PLSccEJUhigWymykTozY47BHFkAQyhkcsxPkwBIPFHqkiQ+v9xWA=%%18%
local t = {}

t.Foo = 
	function() 
		print("foo") 
	end

t.Bar = 
	function() 
		print("bar") 
	end

t.Help = 
	function(funcNameOrFunc) 
		--input argument can be a string or a function.  Should return a description (of arguments and expected side effects)
		if funcNameOrFunc == "Foo" or funcNameOrFunc == t.Foo then 
			return "Function Foo.  Arguments: None.  Side effect: prints foo" 
		elseif funcNameOrFunc == "Bar" or funcNameOrFunc == t.Bar then 
			return "Function Bar.  Arguments: None.  Side effect: prints bar" 
		end 
	end

return t
