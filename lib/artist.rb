
class Artist 

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
    Artist.all << self
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include? song
     song.artist = self unless song.artist == self
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

end
