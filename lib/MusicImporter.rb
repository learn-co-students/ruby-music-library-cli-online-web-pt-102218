class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/","")
    end
  end
  
    def import
    files.map{ |filename| Song.new_from_filename(filename) }
    end
  
end