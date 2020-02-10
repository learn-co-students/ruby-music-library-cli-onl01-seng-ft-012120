class MusicLibraryController
  
  def initialize(file_path='./db/mp3s')
    base = MusicImporter.new(file_path).tap{|x| x.import}
    
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
    # when 'list_songs'
    #   self.list_songs

    when 'exit'
      
    else
      call
    end
    
  end
  
  

  
end