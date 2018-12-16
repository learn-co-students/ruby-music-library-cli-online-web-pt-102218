require 'pry'

class MusicImporter
  
  attr_accessor :path
  attr_reader :files
  
  
  def initialize(path)
    @path = path
    @files = []
    load_files
  end
  
  def load_files
    @files = Dir.entries("#{self.path}").select { |f| f.match('.mp3') }
    # clean_files
  end
  

  
  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
end