require 'pry'
class Artist
extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []
def initialize(name)
  @name = name
  @songs = []
  # @@all << self
end

def self.all
  @@all
end

def self.destroy_all
  @@all = []
end

def save
  @@all << self
end

def self.create(name)
  artist = Artist.new(name)
   artist.save
  artist
end

def add_song(song)
  song.artist = self if !song.artist
  if @songs.include?(song) == false
      @songs << song
  end
end

def genres
  self.songs.map do |song|
    song.genre
  end.uniq


end

end
