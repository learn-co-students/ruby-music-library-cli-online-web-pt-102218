require_relative './concerns/findable.rb'


class Artist
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end 
  
  def genres 
    genres = []
    songs.collect do |song|
      genres << song.genre 
    end 
    genres.uniq
  end
  
  
  def self.destroy_all
    self.all.clear
  end
  
end
