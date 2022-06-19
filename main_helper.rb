require_relative 'message'
module MainHelper
  include Message

  ALIVE = 0
  DEAD = 1
  CONTINUE_NUMBER = 1
  EXIT_NUMBER = 2

  def allow_users_to_choose(brave_lists)
    while true
      selected_brave_num = ask_which_brave_message(brave_lists.length)  # Messageモジュール
      if (1..brave_lists.length).include?(selected_brave_num)
        brave_lists[selected_brave_num - 1]
        break
      else
        user_choice_error_message(brave_lists) # Messageモジュール
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
    brave_dead_or_alive = ALIVE
    brave.hp = character_hp_reset_lists[0]
    monster.hp = character_hp_reset_lists[1]

    loop do
      show_rest_hp_message(brave, monster) # Messageモジュール

      brave.attack_monster(monster)
      brave.knock_monster_down(monster) if monster.hp <= 0

      monster.attack_brave(brave)
      if brave.hp <= 0
        monster.knock_brave_down(brave)
        brave_dead_or_alive = DEAD
      end

      if brave_dead_or_alive == DEAD
        continue_or_exit(CONTINUE_NUMBER, EXIT_NUMBER, brave, monster,
                         character_hp_reset_lists)
      end
    end
  end

  private

  def character_reset(character_hp_reset_lists)
    brave = character_hp_reset_lists[0]
    monster = character_hp_reset_lists[1]

    [brave, monster]
  end

  def continue_or_exit(continue_number, exit_number, brave, monster, character_hp_reset_lists)
    puts <<~TEXT

      *=*=*=*=*=*コンテニュー？=*=*=*=*=*=*=*

      【#{continue_number}】: 続ける  【#{exit_number}】: やめる

      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*

    TEXT

    print '番号を選択 > '
    selected_continue_or_exit_number = gets.to_i

    case selected_continue_or_exit_number
    when CONTINUE_NUMBER
      puts <<~TEXT

        *=*=*=*=*=*=*=*=*=*=**=*=*=*

        再挑戦します...

        *=*=*=*=*=*=*=*=*=*=**=*=*=*

      TEXT

      brave_fight_monster(brave, monster, character_hp_reset_lists)
    when EXIT_NUMBER
      puts <<~TEXT

        *=*=*=*=*=*=*=*=*=*=**=*=*=*

        ゲームを終了します...

        *=*=*=*=*=*=*=*=*=*=**=*=*=*

      TEXT

      exit
    end
  end
end
