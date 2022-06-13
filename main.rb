require_relative 'monster'
require_relative 'brave'
require_relative 'message'
include Message

monster1 = Monster.new('アークデーモン', 150, 185, 60)
monster2 = Monster.new('シャーク', 300, 250, 300)
monster3 = Monster.new('ジェイソン', 160, 270, 50)
monster_lists = [monster1, monster2, monster3]

brave1 = Brave.new('スミス', 140, 170, 100)
brave2 = Brave.new('マイケル', 250, 90, 280)
brave3 = Brave.new('トミー', 205, 210, 70)
brave_lists = [brave1, brave2, brave3]

def allow_users_to_choose(brave_lists)
  while true
    selected_brave_num = ask_which_brave_message(brave_lists.length)
    if (1..brave_lists.length).include?(selected_brave_num)
      brave_lists[selected_brave_num - 1]
      break
    else
      puts "＊【1】から【#{brave_lists.length}】までの数字を選択してください"
    end
  end

  brave_lists[selected_brave_num - 1]
end

def randomly_determine_monsters(monster_lists)
  last_index = monster_lists.length - 1
  index = rand(0..last_index)

  monster_lists[index]
end

def brave_fight_monster(brave, monster)
  loop do
    brave.attack_monster(monster)
    brave.knock_monster_down(monster) if monster.hp <= 0

    monster.attack_brave(brave)
    monster.knock_brave_down(brave) if brave.hp <= 0

    show_rest_hp_message(brave, monster)
  end
end

# ===== 勇者のリストを表示する処理 =====
brave_lists.each.with_index(1) do |brave, num|
  show_brave_lists_message(brave, num)
end

# ===== 勇者を選択させる処理 =====
brave = allow_users_to_choose(brave_lists)

# ===== ランダムでモンスターを決定する処理 =====
monster = randomly_determine_monsters(monster_lists)

monster.appear

# ===== 勇者とモンスターの戦闘処理 =====
brave_fight_monster(brave, monster)
