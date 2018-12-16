require 'pry'

class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
    
  end
  
  def call

    command = ""
    while command != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
        #     expect($stdout).to receive(:puts).with("To list all of the songs by a particular artist, enter 'list artist'.")
        # expect($stdout).to receive(:puts).with("To list all of the songs of a particular genre, enter 'list genre'.")
        # expect($stdout).to receive(:puts).with("To play a song, enter 'play song'.")
        # expect($stdout).to receive(:puts).with("To quit, type 'exit'.")
        # expect($stdout).to receive(:puts).with("What would you like to do?")
      command_list = {
        'list songs' => :list_songs,
        'list artists' => :list_artists,
        'list genres' => :list_genres,
        'list artist' => :list_songs_by_artist,
        'list genre' => :list_songs_by_genre,
        'play song' => :play_song
      }
      command = gets.chomp.downcase
      if command_list[command]
        # binding.pry
        self.send(command_list[command])
      end
      # binding.pry
    end
  end
  
  def list_songs
    Song.all.sort_by! { |song| song.name }.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    # binding.pry
    Artist.all.sort_by { |artist| artist.name }.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by { |genre| genre.name }.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.chomp)
    if artist
      artist.songs.sort_by { |song| song.name }.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.chomp)
    if genre
      genre.songs.sort_by { |song| song.name }.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    Song.all.sort_by! { |song| song.name }
    index = gets.chomp.to_i - 1
    index >= 0 ? song = Song.all[index] : song = nil
    if song
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end