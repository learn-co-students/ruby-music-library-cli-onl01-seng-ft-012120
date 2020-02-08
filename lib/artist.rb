class Artist
  extend MyModule::ClassModule
  include MyModule::InstanceModule
  extend Concerns::Findable

  attr_accessor :songs
  
  @@all =[]

  def self.all 
    @@all
  end

  def initialize(name)
     super(name)
     self.songs = []
  end

  def add_song(song)
    if song.artist
      songs << song unless songs.include?(song)
    else
      song.artist = self
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end