require 'pry'

class Song
  attr_accessor :name, :artist


  @@all = []

  def initialize(name, artist= nil)
    @name = name
    @artist = artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def artist
    @artist
  end

end
