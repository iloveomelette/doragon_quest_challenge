require_relative 'character'
class Brave < Character
  def attack_monster(monster)
    damage = (attack - monster.defense) / 2
    damage = attack / 10 if damage <= 0

    puts <<~TEXT

      #{name}の攻撃！
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
