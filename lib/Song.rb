require 'pry'
class Song 
  
  attr_accessor :name, :artist, :genre 
  @@all = []
  
def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre 
    self.artist = artist if artist
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
    new = Song.new(name)
    new.save 
    new 
end 
  
def artist=(artist)
    @artist = artist 
    artist.add_song(self)
end 
  
def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
end 
  
def self.find_by_name(name)
    @@all.find do |i| 
      if i.name == name 
        name
      end 
    end 
end 
    
def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create(name)
    else 
      self.find_by_name(name)
  end 
end 
  
def self.new_from_filename(filename)
  @mp3 = []
  song = filename.split(/[.-]/)
  song.pop 
  song.map do |i| 
    @mp3 << i.strip 
  end 
  artist_name = @mp3[0]
  artist = Artist.find_or_create_by_name(artist_name)
  genre_name = @mp3[2] 
  genre = Genre.find_or_create_by_name(genre_name)
  new_song = Song.new(@mp3[1], artist, genre)
  new_song
end 

def Song.create_from_filename(filename)
  @@all << self.new_from_filename(filename)
end 
  

  
  end 