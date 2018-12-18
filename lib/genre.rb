class Genre 
  
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
    genre = self.new(name)
    genre.save 
  end
  
  def songs 
    @songs 
  end
  
  def add_song(song)
    @songs << song 
  end
  
  def artists 
    a = []
    songs.collect do |song|
      a << song.artist 
    end
    a.uniq
  end
end 