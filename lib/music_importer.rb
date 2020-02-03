require 'pry'

class MusicImporter
    attr_accessor :path
    @@files = []
    def initialize(path)
        @path = path
        files  #return files when initialized
    end

    def files
        # array = Dir.entries(path)
        # #this loop to get rid of the '.' and '..' in the array, or can do Dir.children(path)
        # #still didnt work... said expected 5 and got 20... binding.pry looks right though..
        # array.each do |i| 
        #     if i.include?("mp3")
        #         @@files << i 
        #     end
        # end
        # @@files
        # binding.pry
        @@files = Dir.children(path) #this was another problem for me... why my other methods did not work..
    end

    def import 
        @@files.each do |i|
            Song.create_from_filename(i)
        end
    end

end

