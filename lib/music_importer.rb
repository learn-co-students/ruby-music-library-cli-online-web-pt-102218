require 'pry'

class MusicImporter

  attr_accessor :path, :filenames

  def initialize(path)
    @path = path
  end

  def files
    @filenames = Dir.glob('./spec/fixtures/mp3s/*')
    @filenames.map do |file|
    file.split("./spec/fixtures/mp3s/")[1]
    end
  end


end
