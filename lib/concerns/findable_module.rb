require 'pry'
module Concerns::Findable
  def find_by_name(name)
    self.all.each do |object|
      if object.name == name
        return object
      else
        nil
      end
    end
    nil
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
