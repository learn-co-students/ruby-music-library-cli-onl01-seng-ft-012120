require 'pry'

class MusicLibraryController
    attr_accessor :path
    def initialize(path = './db/mp3s')
        new_importer = MusicImporter.new(path)
        new_importer.import
    end

    def call
        i = 1 
        while 1 <= 4 do 
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            user_input = gets.strip
            if user_input == 'exit'
                return
            
            else 
                case user_input 
                    when "list songs"
                        list_songs 
                    when "list artists"
                        list_artists
                    when "list genres"
                        list_genres
                    when "play song"
                        play_song
                    when "list artist"
                        list_songs_by_artist
                    when "list genre"
                        list_songs_by_genre
                end

            end
        i += 1 
        end
    end


    def list_songs 
        sorted_songs = Song.all.sort_by {|song| song.name}
        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        sorted_artists = Artist.all.sort_by {|artist| artist.name}.uniq
        sorted_artists.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end
   
    def list_genres
        sorted_genres = Genre.all.sort_by {|genre| genre.name}.uniq
        sorted_genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end
   
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        list_of_songs = []
        artist = Artist.find_by_name(input)
        if !!artist 
            list_of_songs = artist.songs.sort_by{|song| song.name}
            list_of_songs.each_with_index do |song1, index|
                puts "#{index + 1}. #{song1.name} - #{song1.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        genre = Genre.find_by_name(input)
        if !!genre 
            list_of_songs = genre.songs.sort_by{|song| song.name}
            list_of_songs.each_with_index do |song, index|
                puts "#{index+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end


    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i - 1 
        songs = Song.all.sort_by {|song| song.name}
        if input >= 0 && input < songs.length 
            song = songs[input]
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end



    

    




end
