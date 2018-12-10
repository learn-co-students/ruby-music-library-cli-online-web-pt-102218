require 'pry'
require 'bundler'
Bundler.require

module Concerns
  
  module Findable 
    
    def find_by_name(param)
      self.all.any? {|i| 
      if param == i.name
        return i
      end
      }
    end
    
    
    def find_or_create_by_name(param)
      if self.find_by_name(param)
        self.find_by_name(param)
      else
        self.create(param)
      end
    end
  end
  
end

require_all 'lib'
