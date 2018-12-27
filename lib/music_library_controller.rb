require 'pry'

class MusicLibraryController
  attr_accessor :MusicImporter
  
  def initialize(path = "./db/mp3s")
    @MusicImporter = MusicImporter.new(path)
    @MusicImporter.import 
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
    input = gets.strip
    if input == 'list songs'
      list_songs
    elsif input == 'list artists'
      list_artists
    elsif input == 'list genres'
      list_genres
    elsif input == 'list artist'
      list_songs_by_artist
    elsif input == 'list genre'
      list_songs_by_genre
    elsif input == 'play song'
      play_song
    else 
      call unless input == 'exit'
   end
  end
  
  #CLI Methods
  
  def list_songs
    list = Song.all.sort_by! { |a| a.name }
    new = list.uniq.each.with_index(1) do |index, value|
      puts "#{value}. #{index.artist.name} - #{index.name} - #{index.genre.name}"
    end
  end
    
  
  def list_artists
    list = Artist.all.sort_by! { |a| a.name }
    new = list.uniq.each.with_index(1) do |index, value|
      puts "#{value}. #{index.name}"
    end
  end

  def list_genres
    list = Genre.all.sort_by! { |a| a.name }
    new = list.uniq.each.with_index(1) do |index, value|
      puts "#{value}. #{index.name}"
    end
  end
  
  def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.strip
        #when user inputs artist, return numbered(alphebatized) list of artist and genre
      if artist = Artist.find_by_name(user_input)
        artist.songs.sort_by {|artist_name| artist_name.name}.each_with_index do |song, index|
          puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
      else
    end
  end
   
  def list_songs_by_genre
     puts "Please enter the name of a genre:"
        user_input = gets.strip
      if genre = Genre.find_by_name(user_input)
        genre.songs.sort_by {|genre_name| genre_name.name}.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      else
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip 
    x = Integer(input) rescue false
    if x.is_a?(Integer) == false 
      nil 
   elsif x <= Song.all.size 
      Song.all.sort_by {|name| name.name}.each.with_index(1) do |index, value|
        if value == x 
          puts "Playing #{index.name} by #{index.artist.name}"
        end
      end
    else
    end
  end
  
end