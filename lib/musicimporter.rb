class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path).grep(/.*\.mp3/)
    # .grep returns a new array listing the elements requested/passed through the block aka .mp3
      #this is how you import a file to a directory-- from Collaborating Objects lab
  end

  def import
   files.each{|filename| Song.create_from_filename(filename)}
   end

end 
