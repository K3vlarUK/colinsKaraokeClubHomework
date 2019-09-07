require("minitest/autorun")
require("minitest/pride")
require_relative("../Bar.rb")
require_relative("../Drink.rb")

class TestBar < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Cider", 3)

    @drinks = [@drink1, @drink2]

    @bar = Bar.new("Main Bar", @drinks)

  end

  def test_bar_has_name()
    assert_equal("Main Bar", @bar.name())
  end

  def test_bar_has_drinks()
    assert_equal(@drinks, @bar.drinks())
  end

end
