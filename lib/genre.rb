class Genre 
  attr_accessor :name, :songs, :artists 
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.name = name
    genre
  end
  
  def artists
    self.songs.collect {|x| x.artist}.uniq
  end
  
end