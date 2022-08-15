def stock_picker(days)
  
  best_day = {}
  daily_stats = []

  days.each_with_index do |price, index|
    daily_high = 0
    which_day = 0
    days.slice(index + 1...days.length).each_with_index do |compare, index|
      difference = compare - price
      if difference > daily_high
        daily_high = difference 
        which_day = days.find_index(compare)
      end
    end
    daily_stats << { buy_day: index, sell_day: which_day, dif: daily_high }
  end

  current_max = 0
  daily_stats.each_with_index do |day, index|
    if daily_stats[index][:dif] > current_max
      best_day = daily_stats[index]
      current_max = daily_stats[index][:dif]
    end
  end

  if best_day.empty? 
    puts "----"
    puts "Best not to trade in this period"
    puts " "
  else 
    puts "----"
    puts "Buy day  : #{best_day[:buy_day] + 1}"
    puts "Sell day : #{best_day[:sell_day] + 1}"
    puts "Profit   : $#{best_day[:dif]}"
    puts " "
  end

end

puts "Period 1"
stock_picker([17,3,6,9,15,8,6,1,10])
puts "Period 2"
stock_picker([1,2,3,4,5,6,7,8,9,10])
puts "Period 3"
stock_picker([10,9,8,7,6,5,4,3,2,1])
puts "Period 4"
stock_picker([1,34,2,5,65,34,3,322])