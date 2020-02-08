class MusicImporter
    attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller
    def initialize(path)
      @path = path
    end
  
    def files
      Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
      #binding.pry
    end
  
    def import
      self.files.each do |filename|
        Song.create_from_filename(filename)
        #binding.pry
      end
    end
  
  end