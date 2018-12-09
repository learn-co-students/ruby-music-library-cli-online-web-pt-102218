
class MusicImporter
  require 'pry'

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    @filenames = Dir.glob('./spec/fixtures/mp3s/*')
    @filenames.map do |file|
    file.split("./spec/fixtures/mp3s/")[1]
    end
  end

  def import
    files.each {|filename| Song.create_from_filename(filename) }
  end

end
