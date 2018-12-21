class Song
  attr_accessor :name, :artist, :genre 
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre 
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
    @@all = []
  end
  
  def self.create(name)
    new_song = Song.new(name) 
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre
    @genre 
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
    
  # def self.find_by_name(name)
  #   @@all.find do |song|
  #     if song.name == name 
  #       song 
  #     end
  #   end 
  #   end 
    
  # def self.find_or_create_by_name(name)
  #     if self.find_by_name(name) == nil 
  #       self.create(name)
  #     else 
  #       self.find_by_name(name)
  #     end
  #   end
  
  def self.new_from_filename(filename)
    file = filename.split(/ - |\./)
    song_name = file[1]
    artist_name = file[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = file[2]
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  

end
