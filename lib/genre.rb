class Genre
  extend Concerns::Findable
    attr_accessor :name

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
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
      genre = self.new(name)
      self.all << genre
      genre
    end

    def songs
      @songs
    end

    def artists
      artist_collection = @songs.collect do |song|
        song.artist
      end
      artist_collection.uniq
    end
end
