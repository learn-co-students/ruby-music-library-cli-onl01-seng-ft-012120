class MusicImporter
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end   
  
  def files
    Dir.entries(@path).select {|entry| entry.end_with?(".mp3")}
    # Dir.entries("testdir") returns an array containing all of the filenames in the given directory. 
    # select method 
    # end_with? checks that the string ends with those characters 
  end   
  
  def import 
    self.files.each{|filename| Song.create_from_filename(filename)}
    # self.files.each do |filename|
    #   Song.create_from_filename(filename)
    # end 
  end
  
end   