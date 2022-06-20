require_relative 'message'
module MainHelper
  include Message

  CONTINUE_NUMBER = 1
  EXIT_NUMBER = 2

  def allow_users_to_choose(brave_lists)
    while true
      selected_brave_num = ask_which_brave_message(brave_lists.length)
      if (1..brave_lists.length).include?(selected_brave_num)
        brave_lists[selected_brave_num - 1]
        break
      else
        user_choice_error_message(brave_lists)
      end
    end

    brave_lists[selected_brave_num - 1]
  end

  def randomly_determine_monsters(monster_lists)
    last_index = monster_lists.length - 1
    index = rand(0..last_index)

    monster_lists[index]
  end

  def brave_fight_monster(brave, monster, character_hp_reset_lists)
    brave.hp = character_hp_reset_lists[0]
    monster.hp = character_hp_reset_lists[1]

    loop do
      show_rest_hp_message(brave, monster)

      brave.attack_monster(monster)
      knock_monster_down_message(brave, monster) if monster.hp <= 0

      monster.attack_brave(brave)
      next unless brave.hp <= 0

      knock_brave_down_message(brave, monster)
      continue_or_exit(brave, monster, character_hp_reset_lists)
    end
  end

  def continue_or_exit(brave, monster, character_hp_reset_lists)
    selected_continue_or_exit_number = continue_or_exit_message(CONTINUE_NUMBER, EXIT_NUMBER)

    case selected_continue_or_exit_number
    when CONTINUE_NUMBER
      brave_revenge_message

      brave_fight_monster(brave, monster, character_hp_reset_lists)
    when EXIT_NUMBER
      game_exit_message
    end
  end
end
