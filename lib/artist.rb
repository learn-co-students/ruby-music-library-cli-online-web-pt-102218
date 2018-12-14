class Artist
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    self.name = name
    @@all << self
  end
  
  def self.create
    Artist.new.save
  end
  
  def save
    # binding.pry
    @@all << self
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