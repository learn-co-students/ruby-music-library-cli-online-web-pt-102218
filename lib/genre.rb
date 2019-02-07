require_relative './concerns/findable.rb'

class Genre
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
    genre = self.new(name)
    genre.save
    genre
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end 
  
  def artists
    artists = []
    songs.collect do |song|
      artists << song.artist 
    end 
    artists.uniq
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
