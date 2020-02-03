class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @@all << self 
        @songs = []  # i want to find a way that thiis variable is not there, just call upon Songs.all.artist... why did that not work?
    end

    def self.all 
        @@all 
    end

    def save
        @@all << self
    end
    
    def self.create(name)
        artist = self.new(name)
        artist.name = name 
        artist
    end

    def add_song(song)
        if song.artist == nil 
            song.artist = self
            #Song.all << song
            # @songs << song
        end
        if !@songs.include?(song)
            @songs<< song 
        end
        # if !Song.all.include?(song)
        #     Song.all << song
       # end
        song
    end

    def songs 
        #Song.all.select{|song| song.artist == self}   why doesnt this work instead of jut @songs?
        @songs
    end

    def self.destroy_all
        @@all = []
    end

    def genres
        songs.map{|song| song.genre}.uniq
    end

end