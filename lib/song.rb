class Song 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    self.artist=(artist) if artist != nil?
    save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name) 
    song.name = name
    song
  end
  
end