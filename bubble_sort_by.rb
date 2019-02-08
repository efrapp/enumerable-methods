def bubble_sort_by array
    if block_given?
        for j in 0..array.length
            for i in 0...array.length-1        
                val = yield array[i], array[i + 1]
                
                if val > 0
                    temp = array[i]
                    array[i] = array[i+1]
                    array[i+1] = temp
                end
            end
        end
        array
    else
        "Please provide the block for the sorting criteria"
    end
end

result = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
    left.length - right.length
end

p result