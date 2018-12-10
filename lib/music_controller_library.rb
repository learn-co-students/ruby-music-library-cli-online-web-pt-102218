require 'pry'

class MusicLibraryController

  attr_accessor :file

  def initialize(path='./db/mp3s')
    @path = path
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
    input = gets.strip
      if input == 'list songs'
        list_songs
      elsif input == 'list genres'
        list_genres
      elsif input == 'list artists'
        list_artists
      elsif input == 'list artist'
        list_songs_by_artist
      elsif input == 'list genre'
        list_songs_by_genre
      elsif input == 'play song'
        play_song
      elsif input == 'exit'
        return
      else call
      end
  end

  def list_songs
        sorted = Song.all.sort_by {|song| song.name}
          sorted.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
  end


  def list_artists
    sorted = Artist.all.sort_by {|artist| artist.name}
      sorted.each_with_index do |artist, index|
        puts "#{index+1}. #{artist.name}"
      end
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}
      sorted.each_with_index do |genre, index|
        puts "#{index+1}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      a = artist.songs.sort_by {|song| song.name}
      a.each_with_index do |artist, index|
        puts "#{index+ 1}. #{artist.name} - #{artist.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
    a = genre.songs.sort_by {|song| song.name}
    a.each_with_index do |genre, index|
      puts "#{index+ 1}. #{genre.artist.name} - #{genre.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    if (1..Song.all.length).include?(input)
    song = Song.all.sort {|a, b| a.name <=> b.name}[input - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
    end
  end


end
