require_relative 'character'
class Monster < Character
  def appear
    puts <<~TEXT

      #{name}があらわれた！
    TEXT
  end

  def attack_brave(brave)
    tmp_attack, attack_message, damage = calc_damage(brave)

    puts <<~TEXT

      #{name}の#{attack_message}！
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
