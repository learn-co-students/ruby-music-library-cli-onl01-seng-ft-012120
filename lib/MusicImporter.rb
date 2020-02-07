class MusicLibraryController
  
  def list_songs()

    @all_songs = Song.all
    songs_sorted_by_name = @all_songs.sort_by do |song|
      song.name
    end
    songs_sorted_by_name.each.with_index(1) do |song,index|
          puts "#{index}. #{song.artist} - #{song.name} - #{song.genre}"
        end
  end
end