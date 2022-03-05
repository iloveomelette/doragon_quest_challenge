class Character
  attr_accessor :name, :hp, :attack, :defense

  def initialize(name, hp, attack, defense)
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
  end
end
