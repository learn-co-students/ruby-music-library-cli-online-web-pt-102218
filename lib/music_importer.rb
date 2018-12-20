require 'pry'

class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = []
    new = Dir.entries(@path).reject { |path| path == "." or path == ".."}
    
  end
  
end