class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all=[]

    def initialize(name, artist = false, genre = false)
        @name=name
        if artist
            artist.add_song(self)
            #self.artist=artist
        end
        if genre
            genre.songs.push(self)
            self.genre=genre
        end
    end
    
    def artist=(artist)
        @artist=artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre=genre
        genre.songs = genre.songs.push(self).uniq
        genre
    end

    def self.new_from_filename(filename)
        info = filename.split(' - ')
        info[info.length-1]=info[info.length-1].split('.')[0]
        self.new(info[1],Artist.find_or_create_by_name(info[0]),Genre.find_or_create_by_name(info[2]))
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
    
    def self.find_by_name(name)
        @@all.find{|song| song.name==name}
    end

    def self.find_or_create_by_name(name)
        
        if self.find_by_name(name)!=nil
            self.find_by_name(name)
        else
            self.create(name)
        end
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