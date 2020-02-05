require_relative 'concerns/my_module.rb'
class Artist
 extend MyModule::ClassModule
 include MyModule::InstanceModule

 ## It's Weird than I can't make it work from the module ClassModule
 ## to pass the test but in Pry works fine.
 @@all =[]

 def self.all 
   @@all
 end
 ####################################
 def initialize(name)
  super(name)
  @songs = []
 end

 def songs
  @songs
 end
 def add_song(song)
  if song.artist == nil
    song.artist = self 
    self.songs << song
  end
 end


end