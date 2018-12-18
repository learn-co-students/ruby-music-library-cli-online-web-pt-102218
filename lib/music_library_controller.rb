require 'pry'
class MusicLibraryController 
  
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path 
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call 
    puts "Welcome to your music library!"
    answer = gets.chomp
    #until answer == 'exit' do
      puts "To list all of your songs, enter 'list songs'."
      answer = gets.chomp
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      answer = gets.chomp
      puts "What would you like to do?"
      answer = gets.chomp
    #end
  end
  
  def list_songs 
    Song.all.sort_by!{|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists 
    Artist.all.sort_by!{|artist| artist.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres 
    Genre.all.sort_by!{|genre| genre.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
     artist_name = gets.chomp
     Artist.all.each do |artist|
       if artist.name == artist_name 
         artist.songs.sort_by!{|song| song.name}.each_with_index do |song, index|
           puts "#{index + 1}. #{song.name} - #{song.genre.name}"
         end
       end
     end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp 
    Genre.all.each do |genre|
      if genre.name == genre_name 
        genre.songs.sort_by!{|song| song.name}.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end 
      end 
    end
  end
  
  def play_song
    num = gets.chomp
    puts "Which song number would you like to play?"
    if (1..Song.all.length).include?(num)
      s_a = Song.all.sort_by!{|song| song.name}[num -1]
      binding.pry
    end
    
    puts "Playing #{s_a.name} by #{s_a.artist.name}."
  end
  
end