
=begin
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!") 

puts GoodDog.ancestors
puts "--------"
puts HumanBeing.ancestors


module HowWeird
  def rating(number)
    if number < 1 || number > 5
      "Number between 1 - 5 please!"
    else
      x = case number
        when 5 then "Very"
        when 4 then "Pretty"
        when 3 then "Kind of"
        when 2 then "A bit of a"
        when 1 then "Kind of"
      end
      end_sentence(x)
    end
  end
end

module WeirdEnd
  def end_sentence(starter)
    puts "#{starter} weird bum you've got there."
  end
end

class WeirdBum
  include HowWeird
end

ang = WeirdBum.new
puts ang.rating(4)

#--------

class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def speak
    "arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w 
  end

  def info
    "#{self.name} weighs #{self.weight}kg & is #{self.height}cm tall."
  end

end

sparky = GoodDog.new("Sparky", 23, 69)
puts sparky.info
sparky.change_info("Harold", 32, 44)
puts sparky.info


#fido = GoodDog.new("Fido")
#puts fido.name
#fido.set_name = "Harold"
#puts "My dog is now called #{fido.name}"

#--------



class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :make
  
  def initialize(m, c, y, s=0)
    @make = m
    @color = c
    @year = y
    @speed = s
  end

  def info
    "My #{color} #{year} #{make} is travelling at #{speed}mph!"
  end

  def speed_up(s)
    self.speed += s
    puts "You speed up to a terrifying #{speed}mph!"
  end

  def slow_down(s)
    self.speed -= s
    puts "You brake, slowing down to #{speed}mph"
  end

  def current_speed
    puts "You are travelling at #{speed}mph"
  end

  def shut_off
    self.speed = 0
    puts "The engine is off"
  end

  def respray(c)
    self.color = c.downcase
    puts "My car looks tight in #{color}"
  end

  def what_year
    puts "This lovely #{color} #{make} was registered in #{year}"
  end

  def mileage(distance, tank_size)
    "#{distance / tank_size} miles per litre"
  end

  def self.what_am_i?
    "I'm a car, you twat"
  end

  def to_s
    puts "Colour  : #{color.capitalize}"
    puts "Make    : #{make}"
    puts "Year    : #{year}"
    puts "Mileage : #{mileage(400, 23)}"
  end

end

phyl = MyCar.new("Ford", "green", 2007)
#puts phyl.info
#phyl.speed_up(10)
#phyl.slow_down(5)
#phyl.current_speed
#phyl.shut_off

#phyl.respray("puRple")
#phyl.what_year
#puts phyl.info

#puts MyCar.what_am_i?

#puts phyl.mileage(400, 20)

puts phyl

#--------

class GoodDog

  DOG_YEARS = 7
  @@number_of_dogs = 0

  attr_accessor :name, :age

  def initialize(n, a)
    @@number_of_dogs += 1
    self.name = n
    self.age = a * DOG_YEARS
  end

  def doggo_info
    "#{name} is #{age} in dog years!"
  end

  def self.how_many_dogs?
    @@number_of_dogs
  end

  def to_s
    "This dog is called #{name} & they are #{age} dog years old."
  end

end

fred = GoodDog.new("Fred", 4)
spot = GoodDog.new("Spot", 2) 

puts "There are #{GoodDog.how_many_dogs?} dogs!"

puts fred.doggo_info
puts spot.doggo_info

puts spot
p fred



class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight =w
  end

  def info
    "#{self.name} weighs #{self.weight}kg & is #{self.height}cm tall."
  end

  def what_is_self?
    self
  end

end

spot = GoodDog.new("Spot", 44, 23)
#p spot.what_is_self?
GoodDog



class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

bob = Person.new("Steve")
puts bob.name
bob.name = "Bob"
puts bob.name

#========



class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

class Cat < Animal
  def initialize(name, color)
    super(name)
    @color = color
  end
end

lambert = Cat.new("Lambert", "silver")

p lambert

#--------



module Swimmer
  def swim
    "Splish splash!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmer
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmer
end

spot = Dog.new
lambert = Cat.new
dory = Fish.new

puts spot.swim
#lambert.swim
puts dory.swim

#--------



module Walkable
  def walk
    "I'm walking!"
  end
end

module Swimmable
  def swim
    "I'm swimming!"
  end
end

module Climbable
  def climb
    "I'm climbing!"
  end
end

class Animal
  include Walkable  

  def speak
    "I'm a speaking animal!"
  end
end

class Dog < Animal
  include Swimmable
  include Climbable
end


puts "----Dog method lookup----"
puts Dog.ancestors
puts ""

fido = Dog.new
puts fido.speak
puts fido.walk
puts fido.climb

#--------


module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end

  def self.some_out_of_place_method(num)
    num ** 4
  end

end

spot = Mammal::Dog.new
lambert = Mammal::Cat.new

spot.speak("Ruff")
lambert.say_name("Rowl")

p value = Mammal.some_out_of_place_method(4)

#--------



class Dog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_info
    "That's #{human_years} in people years!"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = Dog.new("Sparky", 4)
puts sparky.public_info


#--------



class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

malory = Person.new(23)
sterling = Person.new(44)

p malory.older?(sterling)
p sterling.older?(malory)

p malory.age

#--------

class Vehicle
  attr_accessor :make, :color, :year
  @@number_of_vehicles = 0

  def initialize(make, color, year)
    @make = make
    @color = color
    @year = year
    @@number_of_vehicles += 1
  end

  def self.vehicle_count
    @@number_of_vehicles
  end

  def vehicle_info
    "This is a #{self.color} #{self.make} #{self.type} from #{self.year}."
  end

  def age
    age_workings
  end
  
  private

  def age_workings
    t = Time.now
    return t.year - self.year
  end

end

module Backseatable
  def backseats?
    true
  end
end

class MyCar < Vehicle
  include Backseatable
  attr_reader :type

  def initialize(make, color, year)
    super(make, color, year)
    @type = "car"
  end
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  attr_reader :type
  def initialize(make, color, year)
    super(make, color, year)
    @type = "truck"
  end
  NUMBER_OF_DOORS = 2
end

phyl = MyCar.new("Ford","red", 2007)
trukie = MyTruck.new("AMC","green", 1998)

p phyl.color
p trukie.vehicle_info

p Vehicle.vehicle_count

p phyl.backseats?

#p MyCar.ancestors
#p ""
#p MyTruck.ancestors
p phyl.year
p phyl.age

#--------

=end

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other_student)
    self.grade < other_student.grade ? "#{self.name} is better than #{other_student.name}" : "#{self.name} needs to try harder!"
  end

  protected
  attr_reader :grade
end

joe = Student.new("Joe", "D")
sam = Student.new("Sam", "B")

p joe.name
p sam.better_grade_than?(joe)
p joe.better_grade_than?(sam)