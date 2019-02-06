def bubble_sort_by array
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

    return array
end

result = bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
    right.length - left.length
end

print result