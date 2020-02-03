class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @@all << self 
        @songs = []
        
    end

    def self.all 
        @@all 
    end

    def save
        @@all << self
    end
    
    def self.create(name)
        genre = self.new(name)
        genre.name = name
        genre
    end

    def add_song(song)
        if song.genre == nil
            song.genre = self
        end
        if !@songs.include?(song)
            @songs << song
        end
        song
    end

    def self.destroy_all
        @@all = []
    end

    def artists
        @songs.map {|song| song.artist}.uniq
    end


end