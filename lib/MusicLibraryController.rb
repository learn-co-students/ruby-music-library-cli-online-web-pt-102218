class MusicLibraryController
  
  extend Concerns::Findable
  
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    gets.chomp!
    puts "To list all of your songs, enter 'list songs'."
    gets.chomp!
    puts "To list all of the artists in your library, enter 'list artists'."
    gets.chomp!
    puts "To list all of the genres in your library, enter 'list genres'."
    gets.chomp!
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
  end
  
  def list_songs
  song_sorted_by_songs = Song.all.sort_by do |song| song.name 
  end
   song_sorted_by_songs.each.with_index(1) do |song,index| 
    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
  
  def list_artists
    song_sorted_by_artist = Artist.all.sort_by do |artist| artist.name 
  end
   song_sorted_by_artist.each.with_index(1) do |artist,index| 
    puts "#{index}. #{artist.name}"
  end
  end
  
  def list_genres
    songs_sorted_by_genres = Genre.all.sort_by do |genre|
      genre.name 
    end
    songs_sorted_by_genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end 
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input) 
      songs_sorted_by_name = artist.songs.sort_by do |song|
        song.name
      end
      
      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      songs_sorted_by_name = genre.songs.sort_by do |song|
        song.name
      end
      
      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song # plays matching song from list of output by song list
    puts "Which song number would you like to play?"
    # list_of_songs = Song.all.sort_by {|song|song.name}
    input = gets.strip.to_i
     if input.between?(1,Song.all.length)
       song = list_songs[input]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end