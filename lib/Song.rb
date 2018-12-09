class Song
  
  attr_accessor :name
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def genre= (genre)
    genre.songs << self if genre.songs.include?(self) == false
    @genre = genre
  end
  
  def genre
    @genre
  end
  
  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    artist_name = (filename.split(" - ")[0])
    name = filename.split(" - ")[1]
    genre_name1 = filename.split(" - ")[2]
    genre_name= genre_name1.split(".")[0]
    new_song = self.new(name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song.save
    #binding.pry
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
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
    self
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
  end
  
end