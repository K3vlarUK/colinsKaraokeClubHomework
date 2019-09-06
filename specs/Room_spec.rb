require("minitest/autorun")
require("minitest/pride")
require_relative("../Room.rb")
require_relative("../Guest.rb")
require_relative("../Song.rb")

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Niall", "Hotel California", 50)
    @guest2 = Guest.new("Colin", "We didn't start the fire", 100)
    @guest3 = Guest.new("Jordan", "Everybody wants to rule the world", 80)
    @guest4 = Guest.new("Kevin", "Hurricane", 90)
    @guest5 = Guest.new("Paul", "Bonkers", 60)

    @song1 = Song.new("Hotel California")
    @song2 = Song.new("We didn't start the fire")
    @song3 = Song.new("China girl")
    @song4 = Song.new("Everybody wants to rule the world")

    @songs = [@song1, @song2, @song3]

    @room1 = Room.new("Colin's Karaoke", @songs, 4, 5)
  end

  def test_room_has_name()
    assert_equal("Colin's Karaoke", @room1.name())
  end

  def test_room_has_songs()
    assert_equal(3, @room1.songs().length())
  end

  def test_room_has_max_capacity()
    assert_equal(4, @room1.capacity())
  end

  def test_room_has_entry_fee()
    assert_equal(5, @room1.entry_fee())
  end

  def test_room_starts_empty()
    assert_equal(0, @room1.customers().length())
  end

  def test_add_guest_to_room()
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.customers().length())
    assert_equal([@guest1], @room1.customers())
  end

  def test_remove_specific_guest_from_room()
    @room1.add_guest(@guest1)
    @room1.remove_guest(@guest1)
    assert_equal(0, @room1.customers().length())
  end

  def test_add_song_to_song_list()
    @room1.add_song(@song4)
    assert_equal(4, @room1.songs().length())
  end

  def test_check_if_at_capacity()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    assert_equal(false, @room1.at_capacity?())
    @room1.add_guest(@guest4)
    assert_equal(true, @room1.at_capacity?())
  end

  def test_refuse_entry_if_full()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    assert_equal("Sorry, Full", @room1.add_guest(@guest5))
    assert_equal(4, @room1.customers().length())
  end

  def test_charge_entry_fee()
    @room1.charge_entry_fee(@guest1)
    assert_equal(45, @guest1.money())
  end

  def test_guest_fav_song_cheer()
    assert_equal("wooooo!", @room1.guest_fav_song_cheer(@guest1))
  end

end
