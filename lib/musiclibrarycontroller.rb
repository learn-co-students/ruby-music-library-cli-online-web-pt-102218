class MusicLibraryController
    def initialize(path = './db/mp3s')
        MusicImporter.new(path).import


        
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        loop {
            case gets.chomp
            when 'list songs'
                list_songs
            when 'list artists'
                list_artists
            when 'list genres'
                list_genres
            when 'list artist'
                list_songs_by_artist
            when 'list genre'
                list_songs_by_genre
            when 'play song'
                play_song
            when 'exit'
                break
            end
        }
    end

    def list_songs
        Song.all.sort{|song1,song2| song1.name<=>song2.name}.each_with_index{|song,i| puts (i+1).to_s+'. '+song.artist.name+' - '+song.name+' - '+song.genre.name }
    end

    def list_artists
        Artist.all.sort{|artist1,artist2| artist1.name<=>artist2.name}.each_with_index{|artist,i| puts (i+1).to_s+'. '+artist.name}
    end

    def list_genres
        Genre.all.sort{|genre1,genre2| genre1.name<=>genre2.name}.each_with_index{|genre,i| puts (i+1).to_s+'. '+genre.name}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        selection = gets.strip
        if selected = Artist.find_by_name(selection) 
            selected.songs.sort{|song1,song2| song1.name<=>song2.name}.each_with_index{|song,i| puts (i+1).to_s+'. '+song.name+' - '+song.genre.name }
        end
        #Artist.find_by_name(gets.chomp).songs.each_with_index{|song,i| (i+1).to_s+'. '+song.artist.name+' - '+song.genre.name }
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        selection = gets.chomp
        if selected = Genre.find_by_name(selection) 
            selected.songs.sort{|song1,song2| song1.name<=>song2.name}.each_with_index{|song,i| puts (i+1).to_s+'. '+song.artist.name+' - '+song.name }
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        selection = gets.chomp.to_i
        
        if selection<=Song.all.length && selection>0
            song = Song.all.sort{|x,y| x.name<=>y.name}[selection-1]
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end
    

end