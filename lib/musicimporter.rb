class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path 
    
  end 
  
  def files
    all_files = Dir.entries @path
    all_mp3 = all_files.select { |file_name| file_name.end_with?("mp3") }
    # all_mp3.map do |filename|
    #   filename.delete_suffix(".mp3")
    # end 
  end 
  
  def import 
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end 
    #creates new song for each filename, calls Song.create_from_filename
  end 
  
end 