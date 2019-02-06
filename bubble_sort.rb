array = [3,6,2,78,90]
def bubble_sort array
    for j in 0..array.length
        for i in 0...array.length-1
            if array[i] > array[i+1]
                temp = array[i]
                array[i] = array[i+1]
                array[i+1] = temp    
            end
        end        
    end
    return array
end

result = bubble_sort(array)
print result