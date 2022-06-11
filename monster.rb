require_relative 'character'
class Monster < Character
  def appear
    puts "#{name}があらわれた！"
  end

  def attack_brave(brave)
    damage = (attack - brave.defense) / 2
    damage = attack / 10 if damage <= 0

    puts <<~TEXT
      #{name}の攻撃！
      #{brave.name}は#{damage}のダメージを受けた
    TEXT

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

    exit
  end
end
