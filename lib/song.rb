class Song

  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist=(artist) unless artist == nil
    # invokes artist method instead of simply assigning to an artist instance variable to ensure assocaiations are created upon initialization
    self.genre=(genre) unless genre == nil
    self.save
  end

  def self.all
    @@all
  end

  def save
    # @@all << self
    @@all << self if @@all.index {|song| song.name == self.name}.nil?
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = self.new(name)
    # new_song.save
    new_song
    # new(name, artist, genre).tap{|s| s.save}
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song|song.name == name}
    #you need to put name in as the arg. because you did that in initialize
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")

    song_artist = Artist.find_or_create_by_name(filename_array[0])
    song_genre = Genre.find_or_create_by_name(filename_array[2].chomp(".mp3"))
    Song.new(filename_array[1], song_artist, song_genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end 
