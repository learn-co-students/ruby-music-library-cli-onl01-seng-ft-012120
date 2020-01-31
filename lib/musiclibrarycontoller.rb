class MusicLibraryController

    def initialize(path = './db/mp3s')
        MusicImporter.new(path).import
    end

    def call

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets.strip

        case input
        when "list songs"
            list_songs
        when "list artists"
            list_artists
        when "list genres"
            list_genres
        when "list artist"
            list_songs_by_artist
        when "list genre"
            list_songs_by_genre
        when "play song"
            play_song
        when "exit"
            return
        else
            call
        end
        
    end

    def list_songs
        songs = Song.all.sort {|a, b| a.name <=> b.name }
        songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"     
        end
    end

    def list_artists
        
        artists = Artist.all.map {|artist| artist.name}.sort!.uniq
        artists.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist}"
        end
    end

    def list_genres
        genres = Genre.all.map {|genre| genre.name}.sort!.uniq
        genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre}"
        end 
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.chomp
        if Artist.find_by_name(input) != nil
            
            songs = []
            Song.all.each do |song| 
                if song.artist.name == input
                    songs << song
                end
            end
    
            songs = songs.map {|song| "#{song.name} - #{song.genre.name}"}.sort!
            songs.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp
        
        if Genre.find_by_name(input) != nil
            songs = []
            Song.all.each do |song| 
                if song.genre.name == input
                    songs << song
                end
            end

            songs.sort! {|a, b| a.name <=> b.name}
            songs = songs.map {|song| "#{song.artist.name} - #{song.name}"}
            songs.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
        end
    end

    def play_song
        songlist = Song.all.sort {|a, b| a.name <=> b.name }
        puts "Which song number would you like to play?"
        input = gets.chomp
        
        if input.to_i < 6 && input.to_i > 0
            puts "Playing #{songlist[input.to_i-1].name} by #{songlist[input.to_i-1].artist.name}"
        end
    end
end