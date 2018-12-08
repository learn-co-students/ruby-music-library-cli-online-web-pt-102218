class Artist
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
      artist = self.new(name)
      self.all << artist
      artist
    end

    def add_song(song)
      if !song.artist
        song.artist = self
      end
      if !@songs.detect {|songs| songs.name == song.name }
        @songs << song
      end
    end

    def songs
      @songs
    end

    def genres
      genre_collection = @songs.collect do |song|
        song.genre
      end
      genre_collection.uniq
    end
end
