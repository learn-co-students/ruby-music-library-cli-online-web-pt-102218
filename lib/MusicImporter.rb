require 'pry'
class MusicImporter 
  
  attr_accessor :path, :name
  
  def initialize(path)
    @path = path 
  end 
  
  def files
    @new = []
    dir = Dir.entries(@path)
    dir.each do |i| 
      if i.split('').last(4) == '.mp3'.split('')
        @new << i  
      end 
    end 
    @new
    
  end 
  
  def import 
    self.files.each do |i| 
      Song.create_from_filename(i)
    end 
  end 
  
 
  
  
end 
 