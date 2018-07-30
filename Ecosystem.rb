class River

  attr_reader :name

  def initialize(name)
    @name = name
    @fish_stored = []
  end

  def take_fish()
    if @fish_stored.length == 0
      return nil
    end
    return @fish_stored.shift()
  end

  def add_fish(fish)
    if fish != nil
      @fish_stored.push(fish)
    end
  end


  def fish_count()
    return @fish_stored.length
  end

end

class Fish

  attr_reader :name

  def initialize(name)
    @name = name
  end
end


class Bear

  attr_reader :name

  def initialize(name, type)
    @name = name
    @type = type
    @stomach = []
  end


  def bear_eats_fish_from_river(river)
    fish_content = river.take_fish()
    if fish_content != nil
      @stomach.push(fish_content)
    end
  end

  # EXTENSION

  def roar()
    return "ROARRRR!"
  end

  def food_count()
    return @stomach.length
  end


end
