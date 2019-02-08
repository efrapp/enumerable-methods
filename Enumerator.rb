module Enumerable
    def my_each
      i = 0
      while i < self.length
  		yield(self[i])
      	i+=1     	
      end      
    end

    def my_each_with_index
     i = 0
      while i < self.length
  		yield(self[i],i)
      	i+=1     	
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
    		else
    			return true
    		end    
    	end
    end

    def my_any?
		self.my_each do |element|
			if yield(element)
				return true   
			else
				return false
			end    	  	
		end
	end

	def my_none?
		self.my_each do |element|
			if !yield(element)
				return true   
			else
				return false
			end    	  	
		end
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
end
  some =  [0,0,0,1].my_count{|x| x > 0}
  puts some
