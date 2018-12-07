require 'pry'

class Song
  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist
    @artist
  end

  def self.find_by_name(name)
   @@all.find do |tune|
     if tune.name == name
     tune
    end
   end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end


end
