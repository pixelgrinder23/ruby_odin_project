#require "pry-byebug" # Need to put the correct path for this to work, whatever that is? Works fine in the command line

def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split

#  binding.pry

  unique_length = string_array.uniq.length
  original_length == unique_length
end

isogram?("Odin")