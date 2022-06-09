require_relative 'character'
class Brave < Character
  def attack_monster(monster)
    damage = attack - monster.defense / 2
    puts <<~TEXT
      #{name}の攻撃！
      #{monster.name}に#{damage}のダメージを与えた
    TEXT
    monster.hp -= damage
  end
end
