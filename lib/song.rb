class Song
  
  extend Concerns::Findable
 
  @@all = []

  attr_accessor :name, :artist, :genre


  def initialize(name, artist = nil, genre = nil)
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre !=nil
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    @@all << self
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
def genre=(genre)
    @genre = genre
    genre.songs << self if !(genre.songs.include?(self))
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].split(".")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end
   
   def self.create_from_filename(filename)
    new_from_filename(filename) || save
  end
end
