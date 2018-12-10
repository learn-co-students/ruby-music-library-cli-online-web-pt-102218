require 'pry'
class MusicImporter 
  
  attr_accessor :path
  @@files = []
  
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    files = Dir.entries(@path)
    files.map { |song|
      if song.split('').last(4) == ('.mp3').split('') && song != nil
        song
      end
    }.uniq.reject {|i| i == nil}
  end
  
  def import 
    files.each do |i|
      Song.create_from_filename(i)
    end
  end
    
  
end