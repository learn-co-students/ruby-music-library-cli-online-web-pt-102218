module Concerns
  
  module Findable 
  
    def find_by_name(name)
       self.all.detect {|object| object.name == name} 
    end
    
    def find_or_create_by_name(name)
      found = find_by_name(name)
      if found 
        found 
      else
        self.create(name)
      end
    end
    
  end
  
end