class MusicImporter
    attr_reader :path

    def initialize(path)
        @path = path
        
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
        # filenames = Dir.entries(@path)
        # need to read more about Dir
        # why cannot use .entries here?
        # @files = filenames.map {|file| file.gsub("#{path}/", '')}

    def import
        files.collect {|filename| Song.create_from_filename(filename)}
    end

end