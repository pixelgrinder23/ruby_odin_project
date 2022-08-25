# using rescue to escape the TypeError, return a message, & not crash

# a = 10
# b = "43"

# begin
#   a + b
# rescue
#   puts "I can't do that I'm afraid"
# else
#   puts "a + b = #{a + b}"
# end

# showing it working without crashing. Also, wicked misc content creator

# values = [42, 'a', 'r', 9, 5, 10022, 8.7, "sharon", "Libya", "Mars", "12", 98, rand + rand, {:dog=>'cat'}, 100, nil, 200.0000, Object, 680, 3.14, "Steve", 78, "Argo"].shuffle

# while values.length > 0
#   a = values.pop
#   b = values.pop

#   begin 
#     a + b
#   rescue
#     puts "I can't do that I'm afraid"
#   else
#     puts "a + b = #{a + b}"
#   end

# end

# begin..rescue block example

# require "open-uri"
# require "timeout"

# remote_base_url = "https://en.wikipedia.org/wiki"

# start_year = 1900
# end_year = 2000

# (start_year..end_year).each do |yr|
#   begin
#     rpage = open("#{remote_base_url}/#{yr}")
#   rescue StandardError=>e   #this is how you test for standard errors. They have their own classes. This is storing the error in variable e.
#     puts "Error: #{e}"
#   else
#     rdata = rpage.read
#   ensure    #this gets run regardless of the outsome of the begin..rescue block
#     puts "sleeping"
#     sleep 5
#   end

#   if rdata
#     File.open("copy-of-#{yr}.html", "w"){ |f| f.write(rdata) }
#   end

# end

for i in "A".."C"
  retries = 2
  begin
    puts "Executing command: #{i}"
    raise "Exception: #{i}"   # raise creates an exception error event & names it
  rescue Exception=>e    # saving the Exception error code to e
    puts "\tCaught: #{e}" # \t is a tab
    if retries > 0
      puts "\tTrying #{retries} more times\n" # \n untabs
      retries -= 1
      sleep 2
      retry   # sends the program back to begin
    end
  end
end