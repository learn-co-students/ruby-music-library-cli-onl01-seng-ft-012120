class Genre
  extend MyModule::ClassModule
 include MyModule::InstanceModule

 ## It's Weird than I can't make it work from the module ClassModule
 ## to pass the test but in Pry works fine.
 @@all =[]

 def self.all 
   @@all
 end
 ####################################

end