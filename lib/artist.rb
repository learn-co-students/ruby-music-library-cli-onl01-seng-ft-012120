class Artist 
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self 
    end

    def self.create(name)
        artist = self.new(name)
        artist.save 
        artist 
    end

    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end

    def genres
        songs.map do |song|
            song.genre if song.artist = self 
        end.uniq 
    end
    

end