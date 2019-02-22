module Enumerable

	def my_each
		i = 0
		while i < self.length
			yield(self[i])
			i+=1     	
		end
		self     
	end

	def my_each_with_index
		i = 0
		while i < self.length do
			yield(self[i],i)
			i += 1     	
		end
	end

	def my_select
		selected = []
		self.my_each do|element| 
			if yield(element)
					selected.push(element)
			end
		end
			selected
	end

	def my_all?    	
		self.my_each do |element|
			if !yield(element)
				return false
			end    
		end
		true
	end

	def my_any?
		self.my_each do |element|
			if yield(element)
				return true   
			end    	  	
		end
		false
	end

	def my_none?
		self.my_each do |element|
			if yield(element)
				return false 
			end    	  	
		end
		true
	end

	def my_count (number = nil)	
		if(number)	
			counter = 0
			self.my_each do |element| 
				if element == number
					counter += 1
				end
			end
			return counter		
		elsif block_given?
			 counter = 0
			self.my_each do |element| 
				if yield(element)
					counter += 1
				end
			end
			return counter		
		else
			return self.length
		end
	end

	def my_map proc = nil
		new_val = nil
		new_arr = []

		if !proc
			self.my_each do |element|
				new_val = yield element
				new_arr << new_val
			end
		else
			self.my_each do |element|
				new_val = proc.call element
				new_arr << new_val
			end
		end

		new_arr
	end

	def my_inject initial = nil
		
		if initial
			first_val = initial
			i = 0
		else
			first_val = self[0]
			i = 1
		end

		while i < self.length
			accum = yield first_val, self[i]
			first_val = accum
			i += 1
		end

		accum
	end

end