require_relative 'character'
class Monster < Character
  def appear
    puts "#{name}があらわれた！"
  end

  def attack_brave(brave)
    damage = attack - brave.defense
    puts <<~TEXT
      #{name}の攻撃！
      #{brave.name}は#{damage}のダメージを受けた
    TEXT
    brave.hp -= damage
  end
end
