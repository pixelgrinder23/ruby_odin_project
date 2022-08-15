def cipher(string, shifter=5)
  
  ascii_codes = string.bytes

  shifted = ascii_codes.map do |item| 
    item += 26 if item - shifter < 65 || ( item.between?(97, 122) && item - shifter < 97 )
    item -= shifter
    item.chr 
  end

  shifted.join
end

puts cipher("hello", 10)