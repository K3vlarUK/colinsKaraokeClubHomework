require("minitest/autorun")
require("minitest/pride")
require_relative("../Guest.rb")
require_relative("../Song.rb")
require_relative("../Room.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Niall", 50)

    @song1 = Song.new("Hotel California")
    @song2 = Song.new("We didn't start the fire")
    @song3 = Song.new("China girl")
    @song4 = Song.new("Everybody wants to rule the world")

    @songs = [@song1, @song2, @song3]

    @room1 = Room.new("Colin's Karaoke", @songs, 4, 5)
  end

  def test_guest_has_name()
    assert_equal("Niall", @guest1.name())
  end

  def test_guest_has_money()
    assert_equal(50, @guest1.money())
  end

  # def test_spend_money()
  #   @guest1.spend_money()
  #   assert_equal(45, @guest1.money())
  # end

  def test_remove_money()
    @guest1.remove_money(@room1.entry_fee())
    assert_equal(45, @guest1.money())
  end

end
