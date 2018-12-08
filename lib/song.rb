class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !self.genre.songs.detect {|songs| songs.name == self.name }
      self.genre.songs << self
    end
  end

# Thundercat - For Love I Come - dance.mp3
  def self.new_from_filename(filename)
    names = filename.split(" - ")

    song_name = names[1]
    artist_name = names[0]
    genre_name = names[2].gsub(".mp3", "")

    song = self.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    song.artist = artist
    song.genre = genre

    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    # binding.pry
    song
  end

end
