require("minitest/autorun")
require_relative("../ecosystem")


class EcoTest < MiniTest::Test

  def setup
    @fish1 = Fish.new("Albert")
    @bear1 = Bear.new("Winston", "Grizzly")
    @river1 = River.new("Nile")
  end

  def test_take_fish_from_river_no_fish
    fish_in_bear = @bear1.food_count()
    fish_in_river = @river1.fish_count()
    @bear1.bear_eats_fish_from_river(@river1)
    assert_equal(fish_in_bear, @bear1.food_count())
    assert_equal(fish_in_river, @river1.fish_count())
  end

  def test_fish_count
    result = @river1.fish_count()
    assert_equal(0, result)
  end

  def test_take_fish_from_river_yes_fish
    @river1.add_fish(Fish.new("Luke"))
    fish_in_bear = @bear1.food_count()
    fish_in_river = @river1.fish_count()
    #bear eats fish
    @bear1.bear_eats_fish_from_river(@river1)
    assert_equal(fish_in_bear + 1, @bear1.food_count())
    assert_equal(fish_in_river - 1, @river1.fish_count())
  end


  def test_bear_name
    assert_equal("Winston", @bear1.name)
  end

  def test_add_fish
    @river1.add_fish(Fish.new("Luke"))
    assert_equal(1, @river1.fish_count())
  end

  def test_river_has_name
    assert_equal("Nile", @river1.name)
  end

end
