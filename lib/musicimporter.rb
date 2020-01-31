require 'pry'
class MusicImporter
    attr_reader :path
    @@files = []

    def initialize(path)
        @path = path
        files
    end

    def files
         @@files = Dir.children(path)
    end 

    def import
    
        @@files.each do |file|
            Song.create_from_filename(file)
        end
    end
    

end
