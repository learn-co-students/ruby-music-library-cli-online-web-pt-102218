
module Concerns::Findable

  def find_by_name(name)

    all.detect {|object| object.name == name}
    #find will return nil of the name isn't in @@all
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)  #if find_by_name(name) returns nil, the right side is executed
  end

  def find_or_create_by_file(name)
    self.find_by_name(name) || self.create(name)  #if find_by_name(name) returns nil, the right side is executed
  end


end
