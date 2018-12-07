require_relative '../lib/MusicImporter.rb'

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
    name = filename.split(" - ")[1]
    new_song = Song.new(name)
    
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