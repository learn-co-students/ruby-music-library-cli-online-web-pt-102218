class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    songs.collect{ |song| song.genre }.uniq
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
    Artist.new(name).save
  end

end
