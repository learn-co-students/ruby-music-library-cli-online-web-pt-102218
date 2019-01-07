
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end

  def call

    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    
  end
end

end
