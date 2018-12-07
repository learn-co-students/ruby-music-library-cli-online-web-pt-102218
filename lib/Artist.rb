require 'pry'
require_relative '../lib/Concerns.rb'


class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all =[]
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
    end
    
  def genres
      genre = songs.map do |song|
          song.genre
        end
        genre.uniq
      end
      
 def songs 
   @songs.uniq
 end
 
 def add_song(song)
   if song.artist != self
     song.artist = self
   else 
 end
     if @songs.include?(song) == true   
     #do nothing
   else song != @songs.include?(song)
     @songs << song
   end
end
  
 def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end
  
end