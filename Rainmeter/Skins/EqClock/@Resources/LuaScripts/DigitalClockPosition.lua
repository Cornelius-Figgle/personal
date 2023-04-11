-- #@#LuaScripts\DigitalClockPosition.lua

--[[
	A lua script for use with Rainmeter. Calculates a point on the
	normal to angle bisector of the hour and minute on an analog
	clock. See the inline comments for more information. Sample
	rainmeter code is below (the important line is the inclusion
	of `DynamicVariables=1` in your Meter code

	Also please ignore the ridiculously long variable names

	```rainmeter
	[Rainmeter]
	Update=20

	[MeasureDateTime]
	Measure=Time
	Format=%H:%M:%S#CRLF#%Y-%m-%d

	[MeasureCalcDigitalPosition]
	Measure=Script
	ScriptFile=#@#LuaScripts\DigitalClockPosition.lua
	Disabled=1

	[StyleDateTimeDigital]
	StringAlign=Left
	X=[&MeasureCalcDigitalPosition:calcDigitalPosition(1)]
	Y=[&MeasureCalcDigitalPosition:calcDigitalPosition(2)]
	FontColor=192,192,192,200
	AntiAlias=1
	ClipString=0

	[MeterDigitalDateTime]
	Meter=String
	MeasureName=MeasureDateTime
	MeterStyle=StyleDateTimeDigital
	DynamicVariables=1
	Text=%1
	```
]]

function calcDigitalPosition(whichVar)		
	-- gets the time, simple
	local hours = os.date('%I')  -- 12hr format is %I
	local minutes = os.date('%M')

	-- finds angle to the 3 lines, relative to the North line (ie the y-axis)
	-- the angles for the clock hands are relatively simple, we just calculate the fraction of the whole day/hour
	-- then multiple this by 360 to get the degrees
	local angleOfHourLine = hours / 12 * 360
	local angleOfMinuteLine = minutes / 60 * 360
	-- the angle for the bisection line is more complicated
	-- we first find the difference between the two angles 
	-- and the absolute positive of this (because then it doesn't matter what order the subtraction is in)
	-- this is divided by 2
	-- we then have to add the smallest angle to find the bisection angle relative to the the North line
	-- rather than relative to the hour/minute lines
	local angleOfBisectionLine = math.abs(angleOfHourLine - angleOfMinuteLine) / 2 + math.min(angleOfHourLine, angleOfMinuteLine)

	-- maths magic
	-- more info: https://math.stackexchange.com/questions/260096/find-the-coordinates-of-a-point-on-a-circle
	local radiusOfCircle = 30  -- random value to make the text fit
	local xPoint = radiusOfCircle * math.sin(math.rad(angleOfBisectionLine))
	local yPoint = radiusOfCircle * math.cos(math.rad(angleOfBisectionLine))

	-- multiply by -1 to rotate by 180
	-- matrices would be more elegant and prob better but I cba
	local rotatedXPoint = xPoint * -1
	local rotatedYPoint = yPoint * -1

	-- retrieves the size of the Rainmeter skin
	-- we add an offset because Rainmeter only uses positive numbers
	-- so we offset by half the screen so our standard 4-quadrant graph is moved to a single quadrant
	local xOffset = SKIN:GetW() / 2
	local yOffset = SKIN:GetH() / 2
	local rotatedXPointWithOffset = math.floor(rotatedXPoint + xOffset)
	local rotatedYPointWithOffset = math.floor(yOffset - rotatedYPoint)

	if rotatedXPointWithOffset > 220 then
		local textAlign = 'Left'
	else if rotatedXPointWithOffset < 220 then
		local textAlign = 'Right'
	else
		local textAlign = 'Left'  -- default
	end

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
	-- more info: https://forum.rainmeter.net/viewtopic.php?t=38703
	if whichVar == 1 then
		return rotatedXPointWithOffset
	elseif whichVar == 2 then
		return rotatedYPointWithOffset
	elseif whichVar == 3 then
		return textAlign
	else
		print('You need to define which variable you want!')
		return 0
	end
end
