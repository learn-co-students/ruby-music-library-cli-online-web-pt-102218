class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    self.name = name
    @songs = []
    # @@all << self
  end
  
  def save
    # binding.pry
    @@all << self
  end
  
  def add_song(song)
    # assign current genre to a song's genre property
    if !song.genre
      song.assign_genre(self)
      self.songs << song
    end
  end
  
  ### has many artists through songs
  
  def artists
    # binding.pry
    self.songs.map do |song|
      song.artist
    end.uniq
  end
  
  ### class methods
  
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