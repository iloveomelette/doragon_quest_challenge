require_relative 'character'
class Brave < Character
  def attack_monster(monster)
    attack_message, damage = calc_damage(monster) # `Character`クラス
    attack_monster_message(name, attack_message, monster.name, damage)
    monster.hp -= damage
  end

  def knock_monster_down(monster)
    puts <<~TEXT

      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
      【#{name}】HP: #{hp.round}
      【#{monster.name}】HP: 0
      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*

      #{monster.name}をやっつけた!
    TEXT

    exit
  end
end
