require 'pry' 
class Artist 
  
  attr_accessor :name
  
  @@all = [] 
  
  def initialize(name)
    @name = name
    @songs = [] 
  end 
  
  def self.all 
    @@all 
  end   
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    song = self.new(name)
    @@all << song 
    song 
  end   
  
  def self.destroy_all 
    @@all.clear 
  end   
  
  def songs 
    @songs   
  end  
  
  def add_song(song) 
    if song.artist == nil 
      song.artist = self  
    end 
    @songs << song unless songs.include?(song) #include? 
    #binding.pry #song.artist= nil 
  end   
  
  def genres 
    self.songs.collect {|song| song.genre}.uniq #.uniq removes duplicates
  end   
  
end 