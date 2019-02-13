require 'pry'

class MusicLibraryController
  
  extend Concerns::Findable
  
  def initialize(path = "./db/mp3s")
    new_music_import_object = MusicImporter.new(path)
    new_music_import_object.import
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
    input = gets
    case input
    when "list songs"
      self.list_songs
    when "list artists"
      self.list_artists
    when "list genres"
      self.list_genres
    when "list artist"
      self.list_songs_by_artist
    when "list genre"
      self.list_songs_by_genre
    when "play song"
      self.play_song
    when "exit"
      'exit'
    else
      call
    end
  end
    
  def list_songs
    song_list = Song.all.sort do |a, b| 
      a.name <=> b.name
    end
    song_list.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
      
  def list_artists
    artist_list = Artist.all.sort do |a, b| 
      a.name <=> b.name
    end
    artist_list.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end    
  
  def list_genres
    genre_list = Genre.all.sort do |a, b| 
      a.name <=> b.name
    end
    genre_list.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end   
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets
    if artist = Artist.find_by_name(artist_input)
      artist.songs.sort{ |a, b| a.name <=> b.name}.each.with_index do |song, index| 
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets
    if genre = Genre.find_by_name(genre_input)
      genre.songs.sort{ |a, b| a.name <=> b.name}.each.with_index do |song, index| 
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    song_list = Song.all.sort do |a, b| 
      a.name <=> b.name
    end
    puts "Which song number would you like to play?"
    play_input = gets.to_i - 1
    if play_input > 0 && play_input <= song_list.size
      song = song_list[play_input]
      puts "Playing #{song.name} by #{song.artist.name}" unless song == nil
    end
  end
    

end