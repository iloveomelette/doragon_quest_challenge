require_relative 'character'
class Brave < Character
  def attack_monster(monster)
    tmp_attack, attack_message, damage = calc_damage(monster)

    puts <<~TEXT

      #{name}の#{attack_message}！
      #{monster.name}に#{damage}のダメージを与えた
    TEXT

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
