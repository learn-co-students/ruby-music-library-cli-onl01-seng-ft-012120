class Song
    extend Concerns::Findable
    attr_accessor :name, :genre, :artist
    #attr_reader :artist  if we have a written out artist= method, why can't I use attr_reader instead of accessor? doesnt work.

    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.genre=(genre) if genre != nil
        self.artist=(artist) if artist != nil
        @@all << self 
        
    end

    def self.all 
        @@all 
    end

    #this part really tripped me up... set artist= to link the song and artist, genre= to link the genre and song, using addsong to link them.
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.new_from_filename(filename)
        song_name = filename.split(' - ')[1]
        artist_name = filename.split(' - ')[0]
        genre_name = filename.split(' - ')[2]
        genre_name  = genre_name.split('.')[0]
        #get the same instance of artist or genre if it exists, so as to not duplicate.
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        Song.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
    end

    def save
        @@all << self
    end
    
    def self.create(name, artist = nil, genre = nil)
        song = self.new(name, artist = nil, genre = nil)
        song.name = name
        #song.artist=(artist)
        #all of the below happsn when calling self.new so it does not need to happen again
        #song.artist.songs << self
        #song.genre.songs << self
        #Song.artist.songs << song
        #song.genre = genre
        #@@all << song    dont need this because it will just duplicate the song in the all, its already added to all in .new
        song
    end


    #when is this used? example, song.artists('beyonce') gives the song the artst name if it doesnt have it..
    #adds artist to all if it isnt found in al... just another link?
    def artists(artist)
        if song.artist = nil || !Artist.find_by_name(name)
            song.artist = artist 
            Artist.all << artist 
        end 
    end

    def genres(genre)
        if song.genre = nil || !Genre.find_by_name(name)
            song.genre = genre
            Genre.all << genre
        end 
    end

    def self.destroy_all
        @@all = []
    end

end