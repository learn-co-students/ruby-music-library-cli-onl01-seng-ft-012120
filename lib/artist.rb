class Artist 
  attr_accessor :name, :songs
  
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
        artist = self.new(name)
        artist.name = name 
        artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist
      songs << song unless songs.include?(song)
    else
      song.artist = self
    end
  end
  
  
end