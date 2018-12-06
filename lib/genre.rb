class Genre

  attr_accessor :name, :save

@@all = []

def initialize(name)
  @name = name
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
  genre = Genre.new(name)
  @@all << genre
  genre
end

end
