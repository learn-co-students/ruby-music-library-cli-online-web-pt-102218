require 'pry'
class   Song

attr_accessor :name, :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre
    if artist != nil
      self.artist = artist
    end
    @@all << self
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
    @@all << song
    song
  end

  def self.find_by_name(name)

    @@all.find {|song| song.name == name }
    #find will return nil of the name isn't in @@all

  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)  #if find_by_name(name) returns nil, the right side is executed
  end
end
