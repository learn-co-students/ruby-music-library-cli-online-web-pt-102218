require 'pry'

class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end
  
  def save
    # binding.pry
    @@all << self
  end
  
  def add_song(song)
    # assign current artist to a song's 'artist' property
    # songs are responsible for managing attachment
    if !song.artist
      song.assign_artist(self)
      self.songs << song
    end
  end
  
  def genres
    # binding.pry
    self.songs.map do |song|
      song.genre
    end.uniq
  end
  
  def self.create(name)
    c_artist = self.new(name)
    c_artist.save
    c_artist
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end