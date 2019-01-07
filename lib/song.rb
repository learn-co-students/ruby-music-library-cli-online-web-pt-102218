
class Song 

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    @artist = artist
    self.artist = artist if artist != nil
    @genre = genre
    self.genre = genre if genre != nil
    #@@all << self
  end 

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    Song.all << self
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
     self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
   self.all.detect do |song|
      song.name == name
   end
  end

  def self.find_or_create_by_name(name)
    #binding.pry
     find_by_name(name) || create(name)
  end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
  end
end
