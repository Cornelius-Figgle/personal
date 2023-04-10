-- #@#LuaScripts\script.lua

--[[

]]

function Initialize()
	print('init has been called')

	xOffset = SKIN:GetW() / 2
	yOffset = SKIN:GetH() / 2

	print('`xOffset` is: ' .. xOffset .. ' and `yOffset` is: ' .. yOffset)

	--[[
		os = require('os')
		math = require('math')
	]]
end

function calcDigitalPosition(whichVar)	
	-- print('`calcDigitalPosition` has been called with value `' .. whichVar .. '`')
	
	local hours = os.date('%I')  -- 12hr format is %I
	local minutes = os.date('%M')

	local angleOfHourLine = hours / 12 * 360
	local angleOfMinuteLine = minutes / 60 * 360
	local sumOfAngles = angleOfHourLine + angleOfMinuteLine
	local angleOfBisectionLine = sumOfAngles > 180 and (360 - sumOfAngles) / 2 or sumOfAngles / 2  -- if reflexive, find the opposite angle
	local angleOfNormalToBisectionLine = angleOfBisectionLine + 180  -- inverts the angle (again)

	local radiusOfCircle = 70  -- random value to make the text fit
	local xPoint = radiusOfCircle * math.sin(math.rad(angleOfNormalToBisectionLine))
	local yPoint = radiusOfCircle * math.cos(math.rad(angleOfNormalToBisectionLine))

	local xPointWithOffset = math.floor(xPoint + xOffset)
	local yPointWithOffset = math.floor(yPoint + yOffset)

	--[[
		local i = 1
		repeat
			local k, v = debug.getlocal(1, i)
			if k then
				print(k, v)
				i = i + 1
			end
		until k == nil
	]]

	if string.lower(whichVar) == 'x' then
		return xPointWithOffset
	elseif string.lower(whichVar) == 'y' then
		return yPointWithOffset
	else
		print('You need to define which variable you want!')
		return 0
	end
end
