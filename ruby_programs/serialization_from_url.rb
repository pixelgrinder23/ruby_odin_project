require 'open-uri'

#read from URL
#write all data from URL to local file
#close both locations - done as part of block

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"

local_fname = "hamlet.txt"

File.open(local_fname, "w") { |file| file.write(URI.open(url).read) }

# --------

#reads local file
#prints every 42nd line to the console

File.open(local_fname, "r") do |file|
  file.readlines.each_with_index do |line, index|
    puts line if index % 42 == 0
  end
end

#prints out only Hamlet's lines from local file

File.open(local_fname, "r") do |file|
  while !file.eof? do
    current = file.readline
    if current[0..5] == "  Ham."
      puts current
      next_line = file.readline
      while next_line[0..3] == "    " do
        puts next_line
        next_line = file.readline
      end
    end
  end
end


# scanning a directory, counting the file types, & writing them to a spreadsheet

dirname = "rubyio"
ext_array = []

Dir.glob("#{dirname}/**/*.*").each do |fname|
  ext_array << File.extname(fname).upcase[1..3]
end

counthash = ext_array.reduce(Hash.new(0)) do |ext, count|
  ext[count] += 1
  ext
end

output = "Documents/filetypes_ruby.csv"

File.open(output, "w") do |file|
  file.write "File Type,Count\n"
  counthash.each_key do |key|
    file.write "#{key},#{counthash[key]}\n"
  end
end


