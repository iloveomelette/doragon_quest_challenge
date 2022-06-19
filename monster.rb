require_relative 'character'
class Monster < Character
  def appear
    puts <<~TEXT

      #{name}があらわれた！
    TEXT
  end

  def attack_brave(brave)
    attack_message, damage = calc_damage(brave) # `Character`クラス
    attack_brave_message(name, attack_message, brave.name, damage)
    brave.hp -= damage
  end

  def knock_brave_down(brave)
    puts <<~TEXT

      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
      【#{brave.name}】HP: 0
      【#{name}】HP: #{hp.round}
      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*

      #{brave.name}はしんでしまった!
    TEXT
  end
end
