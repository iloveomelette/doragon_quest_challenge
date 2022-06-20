require_relative 'character'
class Monster < Character
  def attack_brave(brave)
    attack_message, damage = calc_damage(brave) # `Character`クラス
    attack_brave_message(name, attack_message, brave.name, damage)
    brave.hp -= damage
  end
end
