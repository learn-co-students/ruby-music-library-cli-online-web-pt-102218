class Genre 
    extend Concerns::Findable
    attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []
  end 
  
  def artists 
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
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
    genre = Genre.new(name)
  end 
  
  
end 