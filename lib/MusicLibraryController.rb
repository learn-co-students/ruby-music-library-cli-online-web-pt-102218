class MusicLibraryController 
  
  attr_accessor :musicimporter  
  
  def initialize(path= "./db/mp3s") 
    MusicImporter.new(path).import 
  end 
  
  def call
    # command != "exit"
    
    puts "Welcome to your music library!"
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    puts "To list all of your songs, enter 'list songs'."
    
    prompt
  end 
  
  def prompt 
    input = gets.strip
    
    case input 
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song 
    when "list songs"
      list_songs
    when "exit"
      # puts "bye"
    else 
      puts "Sorry, I did not understand your input"
  
      prompt
    end 
  end 


 def list_songs
      #first you need to sort the song list in alp. order 
    Song.all.sort_by { |song| song.name }.each_with_index do |song, index|
      # take that new array, list it in numerical order by Artist name, song name, genre
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{ |artist| artist.name }.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{ |genre| genre.name }.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    if artist = Artist.find_by_name(artist)
      #first the artists name found is identified in arrray 
      artist.songs.sort_by!{ |song| song.name }.each_with_index do |song, index|
        #the artists songs will be sorted by song names and matched with indexes... list by index #, song name and genre name 
        #***SONG name has to go in the block and get called on because the song is being alphabetized.... not the artist. 
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    if genre = Genre.find_by_name(genre)
      genre.songs.sort_by!{ |song| song.name }.each_with_index do |song, index|
        #***SONG name has to go in the block and get called on because the song is being alphabetized.... not the genre. 
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.chomp.to_i
    song = Song.all.sort_by{ |song| song.name }[number - 1] if number > 0 && number < Song.all.length
    #number has to fall between these two properties  
    puts "Playing #{song.name} by #{song.artist.name}" if song
    #if the song matches it will list the song name and artist being played 
  end
end
