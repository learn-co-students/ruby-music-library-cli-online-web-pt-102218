class Artist

  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end
  
  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end
end
