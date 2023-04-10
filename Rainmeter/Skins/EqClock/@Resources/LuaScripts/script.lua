-- #@#LuaScripts\script.lua

--[[

]]

function Initialize()
	print('init has been called')

	xOffset = SKIN:GetW() / 2
	yOffset = SKIN:GetH() / 2

	print('`xOffset` is: ' .. xOffset .. ' and `yOffset` is: ' .. yOffset)
end

function calcDigitalPosition(whichVar)		
	-- gets the time, simple
	local hours = os.date('%I')  -- 12hr format is %I
	local minutes = os.date('%M')

	-- finds angle to the 3 lines, relative to the North line (ie the y-axis)
	local angleOfHourLine = hours / 12 * 360
	local angleOfMinuteLine = minutes / 60 * 360
	local angleOfBisectionLine = math.abs(angleOfHourLine - angleOfMinuteLine) / 2 + math.min(angleOfHourLine, angleOfMinuteLine)

	-- magic
	-- info: https://math.stackexchange.com/questions/260096/find-the-coordinates-of-a-point-on-a-circle
	local radiusOfCircle = 70  -- random value to make the text fit
	local xPoint = radiusOfCircle * math.sin(math.rad(angleOfBisectionLine))
	local yPoint = radiusOfCircle * math.cos(math.rad(angleOfBisectionLine))

	-- multiply by -1 to rotate by 180
	-- matrices would be more elegant and prob better but I cba
	local rotatedXPoint = xPoint * -1
	local rotatedYPoint = yPoint * -1

	-- we add an offset because rainmeter only uses positive numbers
	-- so we offset by half the screen so our standard 4-quadrant graph is moved to a single quadrant
	-- and rounding because integers are better
	local rotatedXPointWithOffset = math.floor(rotatedXPoint + xOffset)
	local rotatedYPointWithOffset = math.floor(yOffset - rotatedYPoint)

	--[[
		-- debugging local vars
		local i = 1
		repeat
			local k, v = debug.getlocal(1, i)
			if k then
				print(k, v)
				i = i + 1
			end
		until k == nil
	]]

	-- rainmeter only accepts one return value
	-- so we run the script twice and return a diff value
	-- info: https://forum.rainmeter.net/viewtopic.php?t=38703
	if string.lower(whichVar) == 'x' then
		return rotatedXPointWithOffset
	elseif string.lower(whichVar) == 'y' then
		return rotatedYPointWithOffset
	else
		print('You need to define which variable you want!')
		return 0
	end
end
