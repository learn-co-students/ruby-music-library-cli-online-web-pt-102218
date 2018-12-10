require 'pry'
class   Song

attr_accessor :name, :artist, :genre
extend Concerns::Findable

@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre
    if artist != nil
      self.artist = artist
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)     # Uses the artist.add_song method to pass in the instance of Song (self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)

    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    genre_name = file.split(' - ')[2].chomp(".mp3")
    song_object = Song.new(song_name)
    song_object.artist = Artist.find_or_create_by_name(artist_name)
    song_object.genre = Genre.find_or_create_by_name(genre_name)
    song_object


  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)  #if find_by_name(name) returns nil, the right side is executed
  # end
end
end
