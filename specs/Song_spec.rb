require("minitest/autorun")
require("minitest/pride")
require_relative("../Song.rb")

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Hotel California")
    @song2 = Song.new("We didn't start the fire")
    @song3 = Song.new("China girl")
  end

  def test_song_has_title()
    assert_equal("Hotel California", @song1.title())
  end

end
