require_relative 'monster'
require_relative 'brave'

monster1 = Monster.new('アークデーモン', 150, 185, 60)
monster2 = Monster.new('シャーク', 300, 250, 300)
brave1 = Brave.new('ゆうしゃ', 140, 170, 85)

def show_rest_hp_message(brave, monster)
  puts <<~TEXT

    *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
    【#{brave.name}】HP: #{brave.hp.round}
    【#{monster.name}】HP: #{monster.hp.round}
    *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*

  TEXT
end

# ===== ゆうしゃが勝つパターン =====

monster1.appear
loop do
  brave1.attack_monster(monster1)
  brave1.knock_monster_down(monster1) if monster1.hp <= 0

  monster1.attack_brave(brave1)
  monster1.knock_brave_down(brave1) if brave1.hp <= 0

  show_rest_hp_message(brave1, monster1)
end

# ===== モンスターが勝つパターン =====

# monster2.appear
# loop do
#   brave1.attack_monster(monster2)
#   brave1.knock_monster_down(monster2) if monster2.hp <= 0

#   monster2.attack_brave(brave1)
#   monster2.knock_brave_down(brave1) if brave1.hp <= 0

#   show_rest_hp_message(brave1, monster2)
# end
