class Song
  extend MyModule::ClassModule
  include MyModule::InstanceModule
  extend Concerns::Findable
  
  attr_accessor :artist, :genre
  
  @@all =[]

  def self.all 
    @@all
  end

  def initialize(name, artist=nil, genre=nil)
    super(name)
    self.artist = artist
    self.genre = genre
  end

  def artist=(arg)
    if arg.instance_of? Artist
      @artist = arg
      arg.add_song(self)
    else
      @artist =arg
    end
  end
  
  def genre=(arg)
    if arg.instance_of? Genre
      @genre = arg
      arg.songs << self unless arg.songs.include?(self)
    else
      @genre = arg
    end
  end

  def self.new_from_filename(file_name)
    data= file_name.split(' - ')
    song_name = data[1]
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2][0...-4])
    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).tap{|ins| ins.save}
  end
end