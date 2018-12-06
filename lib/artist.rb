require 'pry'
class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist == nil ? song.artist = self :
    self.songs.include?(song) ? nil : self.songs.push(song)
  end

  def genres
    self.songs.collect {|song|song.genre}.uniq
  end

end
