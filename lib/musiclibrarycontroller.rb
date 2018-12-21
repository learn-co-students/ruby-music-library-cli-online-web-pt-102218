class MusicLibraryController
  attr_accessor 
  
  def initialize(path = "./db/mp3s/")
    @path = path 
  end
end