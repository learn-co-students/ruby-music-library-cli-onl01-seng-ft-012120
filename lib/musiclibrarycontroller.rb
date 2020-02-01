class MusicLibraryController

  def initialize(path = "./db/mp3s")
    mi = MusicImporter.new(path)
    mi.import
    
  end 
  
  def call 
    loop do 
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
        end 
        if input == "exit"
          break
        end 
    end 
  end 
  
  def list_songs
    sorted_list = Song.all.sort_by { |s| s.name }
    sorted_list.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end 
  end 
  
  def list_artists
    sorted_list = Artist.all.sort_by { |a| a.name }
    sorted_list.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end 
  end 
  
  def list_genres
    sorted_list = Genre.all.sort_by { |g| g.name }
    sorted_list.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    a = Artist.find_by_name(input)
    if !!a
      sorted_list = a.songs.sort_by { |s| s.name }
      sorted_list.each_with_index do |s, i|
        puts "#{i+1}. #{s.name} - #{s.genre.name}"
      end
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    g = Genre.find_by_name(input)
    if !!g
      sorted_list = g.songs.sort_by { |s| s.name }
      sorted_list.each_with_index do |s, i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    sorted_list = Song.all.sort_by { |s| s.name }
    if input.to_i > 0 && input.to_i <= sorted_list.length 
      s = sorted_list[input.to_i-1]
      puts "Playing #{s.name} by #{s.artist.name}"
    elsif input.to_i == 0
      s = Song.find_by_name(input)
      if !!s 
        puts "Playing #{s.name} by #{s.artist.name}"
      else 
      end 
    end 
  end 

end 

# rspec spec/011_music_library_cli_methods_spec.rb

