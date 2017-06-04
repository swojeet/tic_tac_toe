class Player
  attr_accessor :name, :sign, :turn

  def initialize(name, sign, turn = false)
    @name = name
    @sign = sign
    @turn = turn
  end
end
