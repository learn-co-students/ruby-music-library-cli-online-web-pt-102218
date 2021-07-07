require_relative './concerns/findable.rb'
require 'pry'

class Song
  attr_accessor :name
  
  extend Concerns::Findable
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist= artist if artist
    self.genre = genre if genre
  end
  
  def artist
    @artist
  end
  
  def artist= (artist)
    @artist= artist
    @artist.add_song(self)
  end
  
  def genre 
    @genre
  end
  
  def genre= (genre)
    @genre= genre
    @genre.add_song(self)
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    song_name = filename_array[1]
    artist_name = filename_array[0]
    genre_name = filename_array[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
  end
  
  
  def self.create_from_filename(filename)
   self.all<< self.new_from_filename(filename)
  end
  
  
  
  def self.destroy_all
    self.all.clear
  end
  
 
  
end

  # def self.create(name)
  #   s = self.new(name).tap{ |s| s.save }
  # end

  