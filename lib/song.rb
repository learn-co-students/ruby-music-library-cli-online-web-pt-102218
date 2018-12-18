class Song
  
  attr_accessor :name, :artist, :genre
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end
  
  @@all = [] 
  
  def self.all
    @@all 
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all 
    @@all.clear 
  end
  
  def self.create(name)
    song = self.new(name)
    song.save 
    song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def genre 
    @genre 
  end
  
  def self.find_by_name(name)
    self.all.detect {|object| object.name == name}
  end
  
  def self.create_by_name(name)
    song = self.new(name)
    song.save 
  end
  
  def self.find_or_create_by_name(name)
    #self.find_by_name(name) || self.create_by_name(name)
    found = self.find_by_name(name)
    if found
      found
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    song = self.new(filename.split(" - ")[1])
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.artist=(artist)
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    song.genre=(genre)
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    
  end
  
end