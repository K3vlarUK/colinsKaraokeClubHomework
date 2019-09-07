require("pry")

class Room
  attr_reader :name, :songs, :capacity, :entry_fee, :customers, :till_balance

  def initialize(name, songs, capacity, entry_fee)
    @name = name
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee
    @customers = []
    @till_balance = 1000
  end

  def add_guest(guest)
    if !at_capacity?()
      @customers.push(guest)
      add_entry_money_to_til()
    else
      return "Sorry, Full"
    end
  end

  def remove_guest(guest)
    @customers.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def at_capacity?()
    if @customers.length() >= @capacity
      return true
    else
      return false
    end
  end

  def charge_entry_fee(guest)
    guest.remove_money(@entry_fee)
  end

  def guest_fav_song_cheer(guest)
    for song in @songs
      # binding.pry - forgot .title() on song
      if song.title() == guest.has_fav_song()
        return "wooooo!"
      end
    end
  end

  def add_entry_money_to_til()
    @till_balance += @entry_fee
  end

  def guest_buy_drink(guest, drink)
    guest.remove_money(drink.price())
    @till_balance += drink.price()
  end

end
