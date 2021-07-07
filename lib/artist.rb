require "pry"
class Artist 
  extend Concerns::Findable
  
  attr_accessor :name 

  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def save 
    @@all << self
    self 
  end 
  
  def self.create(name)
    self.new(name).save
  end 
  
  def songs
    @songs 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist == self 
    # assigns itself unless it is already within the array.. equals itself 
    @songs << song unless @songs.include?(song)
    #add song to array unless within songs array song is included 
  end 
  
  def genres
    self.songs.collect {|song| song.genre}.uniq
    # collecting a new array of the diff. genres of this artist through songs 
  end 
end 