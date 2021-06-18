class Artist
    attr_accessor :name, :songs

    extend Concerns::Findable

    @@all=[]

    def initialize(name)
        @name=name
        @songs = []
    end
    
    def add_song(song)
        if !song.artist
            song.artist=self
            if !@songs.include?(song)
                @songs.push(song)
            end
        end
    end
    
    def genres
        @songs.map{|song|song.genre}.uniq
    end

    def save
        @@all.push(self)
    end

    def self.create(name)
        new_song = new(name)
        new_song.save
        new_song
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all=[]
    end
end