class Guest
  attr_reader :name, :money, :fav_song

  def initialize(name, fav_song, money)
    @name = name
    @fav_song = fav_song
    @money = money
  end

  def remove_money(amount)
    @money -= amount
  end

  def has_fav_song()
    return @fav_song
  end

end
