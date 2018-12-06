require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    self.artist != nil ? self.artist.add_song(self) : nil
  end

  def genre=(genre)
    @genre = genre
    if self.genre != nil && self.genre.songs.include?(self) == false
      self.genre.songs.push(self)
    end
  end

  def self.new_from_filename(filename)
    fixed = filename.gsub(" - ",".")
    info = fixed.split(".")
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2])
    if self.find_by_name(info[1]) == nil
      self.new(info[1], artist, genre)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
