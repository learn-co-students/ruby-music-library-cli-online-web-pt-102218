class MusicImporter 
  
  def initialize(path)
    @path = path 
  end 
  
  def path
    @path 
  end 
  
  def files 
    @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    # to require all files from a directory of ruby Dir["/path/to/directory/*.rb"].each {|file| require file }
    #gsub is to replace the file extension replace = replace.gsub(/bbb/, "Replace bbb with 222")
  end 
  
  def import 
    files.each do |filename|
      Song.create_from_filename(filename)
    end 
  end 
  
end 