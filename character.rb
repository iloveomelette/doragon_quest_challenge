class Character
  attr_accessor :name, :hp, :attack, :defense

  RANDOM_NUMBERS = [0, 0, 0, 0, 1, 1, 2]

  def initialize(name, hp, attack, defense)
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
  end

  def calc_damage(character)
    tmp_attack = 0

    case RANDOM_NUMBERS[rand(0..RANDOM_NUMBERS.length)]
    when 0
      tmp_attack = attack
      attack_message = '通常攻撃'
    when 1
      tmp_attack = attack * 2
      attack_message = '急所攻撃'
    when 2
      tmp_attack = attack * 3
      attack_message = '会心の一撃'
    end

    damage = (tmp_attack - character.defense) / 2
    damage = tmp_attack / 10 if damage <= 0

    [tmp_attack, attack_message, damage]
  end
end
