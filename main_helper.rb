module MainHelper
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
end
