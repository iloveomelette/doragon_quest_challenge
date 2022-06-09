require_relative 'monster'
require_relative 'brave'

monster1 = Monster.new('アークデーモン', 150, 185, 60)
brave1 = Brave.new('ゆうしゃ', 140, 170, 85)

def show_hp_message(brave, monster)
  puts <<~TEXT
    *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
    【#{brave.name}】HP: #{brave.hp}
    【#{monster.name}】HP: #{monster.hp}
    *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
  TEXT
end

monster1.appear
brave1.attack_monster(monster1)
monster1.attack_brave(brave1)
show_hp_message(brave1, monster1)
