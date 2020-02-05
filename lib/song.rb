class Song
  extend MyModule::ClassModule
  include MyModule::InstanceModule

  ## It's Weird than I can't make it work from the module ClassModule
  ## to pass the test but in Pry works fine.
  @@all =[]
  def self.all 
    @@all
  end
  ####################################
  attr_accessor :artist
  def initialize(name, artist=nil)
    super(name)
    self.artist = artist
  end
  def artist=(artist)
    
    if artist.nil?
     artist.add_song(self)
    else
      @artist = nil
    end
  end
end