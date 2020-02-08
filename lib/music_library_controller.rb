class MusicLibraryController
  def initialize(file_path='./db/mp3s')
    db = MusicImporter.new(file_path).tap{|ins| ins.import}
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
    when 'list songs'
      self.list_songs
    when 'list artists'
      self.list_artists
    when 'list genres'
      self.list_genres
    when 'list artist'
      self.list_songs_by_artist
    when 'list genre'
      self.list_songs_by_genre
    when  'play song'
      self.play_song 
    when 'exit'
      #Here we can exit our program with Abort('any message')
    else
      call
    end



  end


  def list_songs
    sort_list = Song.all.sort_by{|song| song.name}
    sort_list.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sort_list = Artist.all.sort_by{|artist| artist.name}
    sort_list.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
    sort_list
  end

  def list_genres
    sort_list = Genre.all.sort_by{|genre| genre.name}
    sort_list.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts 'Please enter the name of an artist:'
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist
      alpha_list = artist.songs.sort_by{|s| s.name}
      alpha_list.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      genre.songs.sort_by{|s| s.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input -1 >=0 
      song = Song.all.sort_by{|song| song.name}[input-1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end




end