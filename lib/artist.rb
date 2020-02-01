class Artist 
  attr_accessor :name, :songs 
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(name)
    self.new(name).tap { |a| a.save }
  end 
  
  def add_song(song)
    if !song.artist 
      song.artist = self
    end 
    if !@songs.include?(song)
      @songs << song 
    end 
  end 
  
  def genres 
    array = @songs.map { |s| s.genre }
    array.uniq 
  end 
  
end 