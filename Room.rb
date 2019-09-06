class Room
  attr_reader :name, :songs, :capacity, :entry_fee, :customers

  def initialize(name, songs, capacity, entry_fee)
    @name = name
    @songs = songs
    @capacity = capacity
    @entry_fee = entry_fee
    @customers = []
  end

  def add_guest(guest)
    if !at_capacity?()
      @customers.push(guest)
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

end
