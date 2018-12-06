class MusicLibraryController
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts 'Welcome to your music library!'
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp
    case input
    when 'list songs'
      self.list_songs
    when 'list artists'
      self.list_artists
    when 'list genres'
      self.list_genres
    when 'list artist'
      self.list_songs_by_artist
    when 'list genre'
      self.list_songs_by_genre
    when 'play song'
      self.play_song
    end
    input != 'exit' ? self.call : nil
  end

  def list_songs
    sorted = Song.all.sort { |x,y| x.name <=> y.name }
    sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.sort { |x,y| x.name <=> y.name }
    sorted.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort {|x,y| x.name <=> y.name }
    sorted.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input) == nil
    else
      sorted = Artist.find_by_name(input).songs.sort {|x,y| x.name <=> y.name}
      sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input) == nil
    else
      sorted = Genre.find_by_name(input).songs.sort {|x,y| x.name <=> y.name}
      sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i.between?(1,Song.all.length)
      sorted = Song.all.sort { |x,y| x.name <=> y.name }
      puts "Playing #{sorted[input.to_i - 1].name} by #{sorted[input.to_i - 1].artist.name}"
    end
  end

end
