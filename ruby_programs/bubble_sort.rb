def bubble_sort(data)

  count = 1
  
  while count < data.length
    i = 0
    complete = true
    while i < data.length - count
      if data[i] > data[i + 1]
        data[i], data[i + 1] = data[i + 1], data[i]
        complete = false
      end
      i += 1
    end
    count += 1
    break if complete
  end

  print "Sorted : "
  p data
  puts "passes : #{count - 1}"

end

bubble_sort([4,3,78,2,93,232])
bubble_sort([432,3,748,2,0,2])
bubble_sort([4,312,78,24,0,342])
bubble_sort(["camel", "zebra", "owles", "horse", "badge"])
bubble_sort(["f","r","t","s","w","r","y","j","u","y"])