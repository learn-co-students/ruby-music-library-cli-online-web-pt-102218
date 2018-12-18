class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  @@all = []
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self 
    self
  end
  
  def self.destroy_all 
    self.all.clear 
  end
  
  def self.create(name)
    artist = self.new(name) 
    artist.save
  end
  
  def songs 
    @songs 
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres 
    g = []
    songs.collect do |song|
      g << song.genre
    end
    g.uniq
  end
    
end