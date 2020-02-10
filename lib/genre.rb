class Genre 
  
  attr_accessor :name, :songs  
  
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
    genre = self.new(name)
    @@all << genre  
    genre 
  end   
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def songs
    @songs 
  end  
  
  def artists  
    self.songs.collect {|song| song.artist}.uniq #.uniq removes duplicates
  end  
  
end 