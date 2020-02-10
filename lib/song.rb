require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre 
  
  @@all = [] 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist unless artist==nil #@artist = artist #undefined method `add_song' for nil:NilClass
    self.genre = genre unless genre==nil #@genre = genre
   
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
  
  def artist= (artist)
    @artist = artist 
    artist.add_song(self) 
    #binding.pry #artist.add_song(self)
  end   
  
  def genre= (genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self) #include? 
  end   
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end   
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end   
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    
    #expected: "For Love I Come"
    #got: "Thundercat - For Love I Come - dance.mp3"
    
    song_name = array[1] #remove " - "
    artist_name = array[0] 
    genre_name = array[2].split(".mp3").join #expected "dance" need to remove ".mp3" then "re"join
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    
    Song.new(song_name, artist, genre) 
  
  end   
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end   
  
end 