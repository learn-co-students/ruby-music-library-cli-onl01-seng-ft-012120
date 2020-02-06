class Genre
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

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end