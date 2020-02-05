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
 
 ### I'm in an infinite loop and don't know how to solve.
 def artist=(arg)
    if arg.instance_of? Artist
      binding.pry
      arg.add_song(self)
    end
    @artist =arg
 end

end