require 'pry'

class Song
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    self.name = name
    # @@all << self
  end
  
  def self.create
    Song.new.save
  end
  
  def save
    # binding.pry
    @@all << self
  end
  
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