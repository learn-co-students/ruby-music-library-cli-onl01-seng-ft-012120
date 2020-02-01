class Song 
  attr_accessor :name
  attr_reader :artist, :genre  
  
  @@all = [] 
  
  def initialize(name, artist = nil, genre = nil )
    @name = name 
    if !!artist 
      self.artist= (artist) 
    end 
    if !!genre 
      self.genre= (genre)
    end 
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
    self.new(name).tap { |s| s.save }
  end 
  
  def artist= (artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre= (genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  def self.find_by_name(name)
    @@all.detect { |s| s.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    if !!find_by_name(name)
      find_by_name(name)
    else 
      create(name)
    end 
  end 
  
  def self.new_from_filename(filename)
    arr = filename.delete_suffix(".mp3").split(" - ")
    a = Artist.find_or_create_by_name(arr[0])
    g = Genre.find_or_create_by_name(arr[2])
    Song.new(arr[1], a, g)
  end 
  
  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    s.save 
  end 
      
  
end 
