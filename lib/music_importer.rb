class MusicImporter 

  attr_reader :path
  def initialize(file_path)
    @path = file_path
  end
  def files
    list = Dir["#{self.path}/*.mp3"]
    list.collect{|item| item[self.path.size+1..-1]}
  end
  def import 
    self.files.each{|file| Song.create_from_filename(file)}
  end

end