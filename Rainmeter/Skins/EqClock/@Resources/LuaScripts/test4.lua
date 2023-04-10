function test(whichVar, a, b, c)
	
	x = a+b
	y = b+c

	if string.lower(whichVar) == 'x' then
	
		return x
		
	elseif string.lower(whichVar) == 'y' then
	
		return y
	
	else
		
		print('You need to define which variable you want!')
		return 0
	
	end
		
	
end