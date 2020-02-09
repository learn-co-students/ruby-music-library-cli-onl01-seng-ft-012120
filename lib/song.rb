class Song 
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end
  
  def self.find_by_name(name)
    all.find {|x| x.name == name}
    # @@all << self
  end
  
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
end