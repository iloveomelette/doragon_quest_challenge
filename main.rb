require_relative 'monster'
require_relative 'brave'

monster1 = Monster.new('アークデーモン', 150, 185, 60)
monster2 = Monster.new('シャーク', 300, 250, 300)
monster3 = Monster.new('ジェイソン', 160, 270, 50)
monster_lists = [monster1, monster2, monster3]

brave1 = Brave.new('スミス', 140, 170, 100)
brave2 = Brave.new('マイケル', 250, 90, 280)
brave3 = Brave.new('トミー', 205, 210, 70)
brave_lists = [brave1, brave2, brave3]

def show_brave_lists(brave, num)
  puts <<~TEXT

    -----------------------------------------

    No.#{num} 【#{brave.name}】HP: #{brave.hp} Attack: #{brave.attack} Defense: #{brave.defense}

    -----------------------------------------
  TEXT
end

def ask_which_brave(num)
  puts <<~TEXT

    どの勇者を選択しますか？
    (【1】から【#{num}】までの半角数字で選択してください)

  TEXT
  print 'リストから選択 > '
  gets.to_i
end

def show_rest_hp_message(brave, monster)
  puts <<~TEXT

    *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
    【#{brave.name}】HP: #{brave.hp.round}
    【#{monster.name}】HP: #{monster.hp.round}
    *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*

  TEXT
  print 'Enterを押して進める '
  gets.to_i
end

# ゆうしゃのリストを表示する処理
brave_lists.each.with_index(1) do |brave, num|
  show_brave_lists(brave, num)
end

# ゆうしゃを選択させる処理
while true
  selected_brave_num = ask_which_brave(brave_lists.length)
  if (1..brave_lists.length).include?(selected_brave_num)
    brave = brave_lists[selected_brave_num - 1]
    break
  else
    puts "＊【1】から【#{brave_lists.length}】までの数字を選択してください"
  end
end

# ランダムでモンスターを選択する処理
last_index = monster_lists.length - 1
index = rand(0..last_index)
monster = monster_lists[index]

monster.appear
loop do
  brave.attack_monster(monster)
  brave.knock_monster_down(monster) if monster.hp <= 0

  monster.attack_brave(brave)
  monster.knock_brave_down(brave) if brave.hp <= 0

  show_rest_hp_message(brave, monster)
end
