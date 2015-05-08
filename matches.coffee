calculate_matches = (input_string, additional..., callback)->

	#	input_string, 
	# add for all solutions
	# trace for console
	# callback for soul

	add = additional[0] or true
	trace = additional[1] or false

	if trace then console.log "input was: #{input_string}"
	input_string = input_string.split '='
	equal = +input_string[1]
	exp = input_string[0]
	output_buffer = []

	act = #additional case table
		0:[8]
		1:[7]
		2:[]
		3:[9]
		4:[9]
		5:[6,9]
		6:[8]
		7:[]
		8:[]
		9:[8]
		'+':[]
		'-':['+']
		
	rct = #removing case table
		0:[]
		1:[]
		2:[]
		3:[]
		4:[]
		5:[]
		6:[5] #another 6
		7:[1]
		8:[0,6,9]
		9:[5] #another 9
		'+':['-']
		'-':[]
		
	self =
		0:[6,9]
		1:[]
		2:[3]
		3:[2,5]
		4:[11]
		5:[3]
		6:[0,9]
		7:[]
		8:[]
		9:[0,6]
		'+':[]
		'-':[]
		
	try_ = (exp, equal) ->
	
		if trace then console.log "triing: #{exp.join ''}"
		
		if eval(exp.join '')==equal

			if trace then console.log 'GOT!'
			if trace then console.log  "#{exp.join ''} = #{equal}"

			if add
				if output_buffer.length
					output_buffer.push "\n#{exp.join ''}=#{equal}"
				else
					output_buffer.push "#{exp.join ''}=#{equal}"
			else
				output_buffer.push "\n#{exp.join ''}=#{equal}"
			return true

		false
			
		
	(->
		got_solution = false
		exp = exp.split ''
		ln = exp.length-1
		for k, char of exp
			if rct[char].length>0
				for new_char1 in rct[char]
					temp_exp = [exp[0...+k]..., new_char1, exp[+k+1..ln]...]
					for ki, chari of temp_exp
						if act[chari] 
							for new_char2 in act[chari]
								if try_ [temp_exp[0...+ki]..., new_char2, temp_exp[+ki+1..ln]...], equal  then got_solution=true
			for new_char1 in self[char]
				if try_ [exp[0...+k]..., new_char1, exp[+k+1..ln]...], equal then got_solution=true

		if !got_solution then output_buffer.push '0'
		console.log output_buffer.join ''
		callback output_buffer.join ''
	)(this)