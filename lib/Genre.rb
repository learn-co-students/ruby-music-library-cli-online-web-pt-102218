class Genre
  
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
  
  
  def songs
    @songs
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end
  
end