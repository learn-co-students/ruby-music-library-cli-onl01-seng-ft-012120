class MusicImporter
  attr_accessor :path
  
    @@files = []
    
    def initialize(path)
        @path = path
        files  #return files when initialized
    end
    
    def files
      list = Dir["#{self.path}/*.mp3"]
      list.collect{|item| item[self.path.size+1..-1]}
    end
    
    def import
      self.files.each {|x| Song.create_from_filename(x)}
    end
      
  
end