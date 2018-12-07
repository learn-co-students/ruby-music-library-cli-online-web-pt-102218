class Song
  
  attr_accessor :name
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end
  
  def genre= (genre)
    genre.songs << self if genre.songs.include?(self) == false
    @genre = genre
  end
  
  def genre
    @genre
  end
  
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  
 def artist 
   @artist
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