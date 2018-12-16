require 'pry'

class Song
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    # @@all << self
  end
  
  def save
    # binding.pry
    @@all << self
  end
  
  ### artist ###
  
  def assign_artist(artist)
    @artist = artist
  end
  
  def artist=(artist)
    artist.add_song(self)
  end
  
  ### genre ###
  
  def assign_genre(genre)
    @genre = genre
  end
  
  def genre=(genre)
    genre.add_song(self)
    # binding.pry
  end
  
  ### filenames ###
  
  def self.new_from_filename(filename)
    data = data_from_filename(filename)
    artist = Artist.find_or_create_by_name(data[:a_name])
    genre = Genre.find_or_create_by_name(data[:g_name])
    self.new(data[:s_name], artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end
  

  
  ### class methods ###
  
  # finding REPLACED BY FINDABLE MODULE
  
  # def self.find_by_name(name)
  #   self.all.find { |song| song.name == name }
  # end
  
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end
      
  
  def self.create(name)
    c_song = self.new(name)
    c_song.save
    c_song
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end