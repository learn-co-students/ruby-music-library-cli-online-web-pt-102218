require 'pry'

class MusicLibraryController
  attr_accessor :MusicImporter
  
  @@all = []
  
  def initialize(path = "./db/mp3s")
    @MusicImporter = MusicImporter.new(path)
    @@all << @MusicImporter.import
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
    gets 
    gets
    gets
    gets
  end
  
  def list_songs
    unnum_list = @@all
    counter = 1
    unnum_list.map do |file|
      puts "#{counter}. #{file}"
      counter += 1 
    end
  end
end