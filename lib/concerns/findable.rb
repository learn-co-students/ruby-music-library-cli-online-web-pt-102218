module Concerns::Findable
  def find_by_name(name)
    all.detect {|object| object.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
    # object = find_by_name(name)
    # if object
    #   object
    # else
    #   object = create(name)
    # end
  end
end
