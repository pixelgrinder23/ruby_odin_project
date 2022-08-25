class Cinema
  
  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
    @movies = []
  end

  def add_movie(movie)
    @movies = movie
    movie.cinema = self
  end

end

class Movies

  attr_accessor :title, :showtime, :cinema

  @@all = []

  def initialize(title, showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end

end

showcase = Cinema.new("Showcase", "Nottingham")
=> <Cinema:0x000055f412aa1110 @location="Nottingham", @movies=[], @name="Showcase">

spiderman = Movies.new("Spiderman", "9am")
=> <Movies:0x000055f412c58d50 @showtime="9am", @title="Spiderman">

showcase.add_movie(spiderman)
=> 
<Cinema:0x000055f412aa1110
 @location="Nottingham",
 @movies=
  <Movies:0x000055f412c58d50
   @cinema=#<Cinema:0x000055f412aa1110 ...>,
   @showtime="9am",
   @title="Spiderman">,
 @name="Showcase">