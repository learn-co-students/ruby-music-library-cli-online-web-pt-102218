require 'pry'

module Concerns
  module Findable

  # def find_by_name(name)
  #     found = all.detect do |tune|
  #       tune.name == name
  #     end
  # end

  def find_by_name(name)
    all.each do |tune|
      if tune.name == name
        return tune
      end
    end
    return nil
  end


  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  end
end
