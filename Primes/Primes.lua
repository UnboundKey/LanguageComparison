local sqrt, floor = math.sqrt, math.floor

local primeLimit = arg[1]
local errorStr
if not primeLimit then
	errorStr = "Usage: lua Primes.lua <primeLimit>"
elseif not tonumber(primeLimit) then
	errorStr = "Argument must be a number"
else
	primeLimit = tonumber(primeLimit)
	if primeLimit < 1 then
		errorStr = "Argument must be above zero."
	end
end

if not errorStr then

	local primes = {2}
	local prime, maxdiv
	local target = 1

	repeat
		target = target + 2
	   prime = true
	   maxdiv = floor(sqrt(target))

	    for div = 3, maxdiv, 2 do
	        if target % div == 0 then
	            prime = false
	            break
	        end
	    end

	    if prime then
	    	primes[#primes + 1] = target
	    end
	until #primes >= primeLimit

	print(string.format("Prime #%d is %d", primeLimit, primes[primeLimit]))
else
	print(errorStr)
end