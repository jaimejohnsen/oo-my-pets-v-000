#require_relative './fish.rb'
#require_relative './dog.rb'
#require_relative './cat.rb'
require 'pry'
class Owner
@@all = [] #keeps track of the owners created

attr_accessor :pets, :name
attr_reader :species

  def initialize(species) #each time an owner is created it is initialized with its pets
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    #@name = name
    @@all << self
  end

  def self.all
    @@all#returns all the instances of the Owner class
  end

  def self.reset_all
 #removes any instances in the array
    @@all.clear  #why do we need to reset the array?  Where are they coming from?
  end

  def self.count
    @@all.size #returns the number of values in the array
  end

  def say_species
    "I am a #{species}."#using string interpolation and the values upon initialization.
  end

  def buy_fish(name) #we initialize with a mood as a default value. When we create a new object it already has a mood value.
    pets[:fishes] << Fish.new(name)#creating a new fish object, shoveling to the fish array.
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy" } #accessing the pet hash at dog key.
  # iterating over the values of the array which contain Dog objects which have a name and mood method.
  # Then passing each object in under 'dog' temp var and calling an instance method mood and rewriting it to happy.
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets #each_value method → an_enumerator. Calls block once for each key in hsh, passing the value as a parameter.
                                  #If no block is given, an enumerator is returned instead.
    pets.each_value do |array| #going to the pets hash, accessing just the value which is the array.
          array.each do |pet|#iterating on the array
        pet.mood = "nervous"#calling the method mood on pet because pet is a value of that array.
      end
    end
    # pets.each do |pet_type, pets|#we are iterating over the pets hash, it's keys and values, the value is an array, and arrays can have multiple pieces of data, which are objects like fish class,
    #   arrayofpetobj.each do |eachpet| #we are iterating over the array.eachpet is an object. temp_var represents multiple iterations.(for us just fido and Daisy)
    #     eachpet.mood  = "nervous"#this is the same thing as fido.mood. because fido is variable that contains the object. we can call methods from the dog class
    #   end
    # end
    pets.clear
  end
  #def sell_pets
  #  pets.each do |species, animals|
  #    animals.each do |animal|
  #      animal.mood = "nervous"
  #    end
  #animals.clear
#end
#end
  def list_pets
    "I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
  end
 #binding.pry
end

#binding.pry

# make note to Z about pry and code below

# sally = Owner.new("Sally")
# sally.buy_fish("Nemo")
# sally.buy_dog("Brunno")
# sally.buy_cat("WoofWoof")
# sally.buy_dog("Fido")
