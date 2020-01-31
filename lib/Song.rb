class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre 

    @@all = [] 

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) unless artist == nil
        self.genre=(genre) unless genre == nil
    end

    def self.all 
        @@all
    end

    def save
        @@all << self 
    end

    def self.create(name)
        song = Song.new(name)
        @@all << song 
        song
    end

    def self.destroy_all
        @@all.clear
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(file)
        name = file.split(" - ")[1]
        artist = Artist.find_or_create_by_name(file.split(" - ")[0])
        genre = Genre.find_or_create_by_name(file.split(" - ")[2].split(".")[0])
        Song.new(name, artist, genre)

    end

    def self.create_from_filename(file)
        
        song = self.new_from_filename(file)
        @@all << song
        
    end

end