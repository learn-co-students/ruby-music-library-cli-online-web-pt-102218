module Concerns::Findable
  def find_by_name(name)
    self.all.bsearch {|object| object.name == name}
  end

  def find_or_create_by_name(name)
    object = self.find_by_name(name)
    if object
      object
    else
      object = self.create(name)
    end
  end
end
