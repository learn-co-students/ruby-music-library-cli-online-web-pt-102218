require 'pry'

class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    new = Dir.entries(@path).reject { |path| path == "." or path == ".."}
  end
  
  def import
    Song.create_from_filename(self.files)
  end 
end