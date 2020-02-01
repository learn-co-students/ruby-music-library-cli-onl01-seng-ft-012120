class Genre  
  attr_accessor :name
  attr_reader :songs 
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
    self.new(name).tap { |g| g.save }
  end 
  
  def add_song(song)
    if !song.genre  
      song.genre = self
    end 
    if !@songs.include?(song)
      @songs << song   
    end 
  end 
  
  def artists
    array = @songs.map { |s| s.artist }
    array.uniq 
  end 
end 