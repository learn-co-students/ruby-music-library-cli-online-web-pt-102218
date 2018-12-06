class Artist

  attr_accessor :name, :save, :songs

@@all = []
def initialize(name)
  @name = name
  @songs = []
  @@all << self
end

def self.all
  @@all
end

def self.destroy_all
  @@all = []
end

def self.save
  @@all << self
end

def self.create(name)
  artist = Artist.new(name)
  @@all << artist
  artist
end

end
