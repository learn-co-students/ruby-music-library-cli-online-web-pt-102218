class MusicLibraryController
  attr_accessor :music_importer

  def initialize(path="./db/mp3s")
    @music_importer = MusicImporter.new(path)
    @music_importer.import
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

    input = gets.chomp

    while(input != "exit")
        if input == "list songs"
          list_songs
        elsif input == "list artists"
          list_artists
        elsif input == "list genres"
          list_genres
        elsif input == "list artist"
          list_songs_by_artist
        elsif input == "list genre"
          list_songs_by_genre
        elsif input == "play song"
          play_song
        end
        input = gets.chomp
    end

  end

  def list_songs
    # binding.pry
    i = 1
    sorted_song_list = Song.all.sort_by {|song| song.name}
    sorted_song_list = sorted_song_list.uniq
    sorted_song_list.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 1
    sorted_artist_list = Artist.all.sort_by {|artist| artist.name}
    sorted_artist_list = sorted_artist_list.uniq
    sorted_artist_list.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    i = 1
    sorted_genre_list = Genre.all.sort_by {|genre| genre.name}
    sorted_genre_list = sorted_genre_list.uniq
    sorted_genre_list.each do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    # binding.pry
    i = 1
    artist = Artist.find_by_name(artist_name)
    # binding.pry
    if artist
      # binding.pry
      sorted_songs_by_artist = artist.songs.sort_by {|song| song.name}
      # sorted_songs_by_artist_list = sorted_songs_by_artist_list.uniq
      sorted_songs_by_artist.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    i = 1
    genre = Genre.find_by_name(genre_name)
    # binding.pry
    if genre
      # binding.pry
      sorted_songs_by_genre = genre.songs.sort_by {|song| song.name}
      # sorted_songs_by_artist_list = sorted_songs_by_artist_list.uniq
      sorted_songs_by_genre.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end

  def play_song
    # list_songs
    puts "Which song number would you like to play?"
    song_index = gets.chomp.to_i - 1

    if song_index >= 0 && song_index < Song.all.uniq.count
      sorted_song_list = Song.all.sort_by {|song| song.name}
      sorted_song_list = sorted_song_list.uniq
      song = sorted_song_list[song_index]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
