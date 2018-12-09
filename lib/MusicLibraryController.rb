require_relative '../lib/MusicImporter.rb'

class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
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
  
end