class Genre
    attr_accessor :name, :songs
    
    extend Concerns::Findable

    @@all=[]
    def initialize(name)
        @name=name
        @songs=[]
    end
    
    def add_song(song)
        if !song.artist
            song.genre=self
            if !@songs.include?(song)
                @songs.push(song)
            end
        end
    end

    def artists
        @songs.map{|song|song.artist}.uniq
        
    end

    def save
        @@all.push(self)
    end
    def self.create(name)
        new_genre = new(name)
        new_genre.save
        new_genre
    end
    def self.all
        @@all
    end
    def self.destroy_all
        @@all=[]
    end  

end