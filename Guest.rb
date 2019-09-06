class Guest
  attr_reader :name, :money

  def initialize(name, money)
    @name = name
    @money = money
  end

  def remove_money(amount)
    @money -= amount
  end

end
