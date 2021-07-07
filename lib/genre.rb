
class Genre 

  extend Concerns::Findable

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @artist = artist
    @songs = []
    #@@all = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    Genre.all << self
  end

  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

end
