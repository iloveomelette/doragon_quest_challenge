require_relative 'monster'
require_relative 'brave'
require_relative 'message'
require_relative 'main_helper'
include Message
include MainHelper

monster1 = Monster.new('アークデーモン', 150, 185, 60)
monster2 = Monster.new('シャーク', 300, 250, 300)
monster3 = Monster.new('ジェイソン', 160, 270, 50)
monster_lists = [monster1, monster2, monster3]

brave1 = Brave.new('スミス', 140, 170, 100)
brave2 = Brave.new('マイケル', 250, 90, 280)
brave3 = Brave.new('トミー', 205, 210, 70)
brave_lists = [brave1, brave2, brave3]

# ===== 勇者のリストを表示する処理 =====
brave_lists.each.with_index(1) do |brave, num|
  show_brave_lists_message(brave, num)
end

# ===== 勇者を選択させる処理 =====
brave = allow_users_to_choose(brave_lists)

# ===== ランダムでモンスターを決定する処理 =====
monster = randomly_determine_monsters(monster_lists)

character_hp_reset_lists = [brave.hp, monster.hp]

monster_appear_message(monster.name)

# ===== 勇者とモンスターの戦闘処理 =====
brave_fight_monster(brave, monster, character_hp_reset_lists)
