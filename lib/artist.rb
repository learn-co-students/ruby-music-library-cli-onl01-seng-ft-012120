class Artist 
  attr_accessor :name, :songs, :genres
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
        artist = self.new(name)
        artist.name = name 
        artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
      
    end
  end
  
  def genres
    self.songs.collect {|x| x.genre}.uniq
  end
  
  
  
end