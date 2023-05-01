function Initialize()

	-- Initialize the variable inc to zero, so we can do math with it in the Update() function.
	inc = 0

end

function Update()

	-- On each update of the script measure in the skin, add 1 to the variable inc.
	inc = inc + 1
	
	-- Since we are counting in a loop from 1 to 10, if the value of inc is 11, set it  to 1.
	if inc == 11 then 
		inc = 1
	end
	
	-- Return the current value of inc as the string and number value of the script measure.
	return inc

end