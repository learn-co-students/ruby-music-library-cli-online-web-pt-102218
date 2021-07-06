class Genre

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
    genre = self.new(name)
    genre
  end
  
  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
end
