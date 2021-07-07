class Genre 
  
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
  end 
  
  def self.create(genre)
    new = Genre.new(genre)
    new.save 
    new 
  end 
    
  def songs 
    @songs 
  end 
  
  def artists 
    new = @songs.map do |i| 
      i.artist
    end 
    new.uniq 
  end 
end 
  
  
