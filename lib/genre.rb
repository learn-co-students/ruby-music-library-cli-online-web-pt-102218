class Genre
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    self.name = name
    @@all << self
  end
  
  def self.create
    Genre.new.save
  end
  
  def save
    # binding.pry
    @@all << self
  end
  
  def self.create(name)
    c_genre = self.new(name)
    c_genre.save
    c_genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end