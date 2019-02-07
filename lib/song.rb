class Song
  attr_accessor :name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist= nil, genre= nil)
    @name = name
    @@all << self
    self.artist= artist if artist
    self.genre = genre if genre
  end
  
  def artist
    @artist
  end
  
  def artist= (artist)
    @artist= artist
    @artist.add_song(self)
  end
  
  def genre 
    @genre
  end
  
  def genre= (genre)
    @genre= genre
    @genre.add_song(self)
  end
  
  def save
    self.class.all << Song.new(name)
  end
  
  def self.create(name)
   new(name).tap{ |s| s.save }
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
