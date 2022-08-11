def substrings(string, dic_in)
  
  all_words = string.scan(/[\w']+/).join(" ").downcase.split(/[\s,']/)
  lower_dic = dic_in.join(" ").downcase.split(" ")

    all_words.reduce(Hash.new(0)) do |count, word|
      count[word] += 1 if lower_dic.include?(word.downcase)
      count
    end

end


dictionary = ["Below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)
