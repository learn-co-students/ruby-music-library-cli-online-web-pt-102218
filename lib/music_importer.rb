require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    self.path = path
  end

  def files
    files = Dir["#{self.path}/*.mp3"]
    filenames = files.map do |files_with_path|
      files_with_path.split('/').last
    end
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end
