class Character
  attr_accessor :name, :hp, :attack, :defense

  RANDOM_NUMBERS = [1, 1, 1, 1, 2, 2, 3]
  INITIAL_NUMBER = 0
  NORMAL_HIT = 1
  VITAL_HIT = 2
  CRITICAL_HIT = 3
  DAMAGE_RATE = 2
  EXCEPTION_DAMAGE_RATE = 10

  def initialize(name, hp, attack, defense)
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
  end

  def calc_damage(character)
    tmp_attack, attack_message = determine_tmp_attack

    damage = (tmp_attack - character.defense) / DAMAGE_RATE
    damage = tmp_attack / EXCEPTION_DAMAGE_RATE if damage <= 0

    [tmp_attack, attack_message, damage]
  end

  private

  def determine_tmp_attack
    tmp_attack = INITIAL_NUMBER
    last_index = RANDOM_NUMBERS.length - 1
    index = rand(0..last_index)

    case RANDOM_NUMBERS[index]
    when NORMAL_HIT
      tmp_attack = attack
      attack_message = '通常攻撃'
    when VITAL_HIT
      tmp_attack = attack * VITAL_HIT
      attack_message = '急所攻撃'
    when CRITICAL_HIT
      tmp_attack = attack * CRITICAL_HIT
      attack_message = '会心の一撃'
    end

    [tmp_attack, attack_message]
  end
end
