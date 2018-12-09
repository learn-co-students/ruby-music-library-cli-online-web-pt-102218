class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    current_dir = Dir.getwd
    Dir.chdir(@path)
    filenames = Dir.glob("*.mp3")
    Dir.chdir(current_dir)
    filenames
  end
  
    def import
    files.map{ |filename| Song.create_from_filename(filename) }
    end
  
end