module Message
  # ===== ここからメインの処理で利用 =====
  def monster_appear_message(monster_name)
    puts <<~TEXT

      #{monster_name}があらわれた！
    TEXT
  end

  def show_brave_lists_message(brave, num)
    puts <<~TEXT

      -----------------------------------------

      No.#{num} 【#{brave.name}】HP: #{brave.hp} Attack: #{brave.attack} Defense: #{brave.defense}

      -----------------------------------------
    TEXT
  end

  def ask_which_brave_message(num)
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

  def user_choice_error_message(brave_lists)
    puts <<~TEXT

      =========================================================

        ! Error ! ＊【1】から【#{brave_lists.length}】までの数字を選択してください

      =========================================================

    TEXT
  end

  def knock_monster_down_message(brave, monster)
    puts <<~TEXT

      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
      【#{brave.name}】HP: #{brave.hp.round}
      【#{monster.name}】HP: 0
      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*

      #{monster.name}をやっつけた!
    TEXT

    exit
  end

  def knock_brave_down_message(brave, monster)
    puts <<~TEXT

      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*
      【#{brave.name}】HP: 0
      【#{monster.name}】HP: #{monster.hp.round}
      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*=*=*

      #{brave.name}はしんでしまった!
    TEXT
  end

  def continue_or_exit_message(continue_number, exit_number)
    puts <<~TEXT

      *=*=*=*=*=*コンテニュー？=*=*=*=*=*=*=*

      【#{continue_number}】: 続ける  【#{exit_number}】: やめる

      *=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*

    TEXT

    print '番号を選択 > '
    gets.to_i
  end

  def brave_revenge_message
    puts <<~TEXT

      *=*=*=*=*=*=*=*=*=*=**=*=*=*

      再挑戦します...

      *=*=*=*=*=*=*=*=*=*=**=*=*=*

    TEXT
  end

  def game_exit_message
    puts <<~TEXT

      *=*=*=*=*=*=*=*=*=*=**=*=*=*

      ゲームを終了します...

      *=*=*=*=*=*=*=*=*=*=**=*=*=*

    TEXT

    exit
  end

  # ===== `class Brave`の処理で利用 =====
  def attack_monster_message(name, attack_message, monster_name, damage)
    puts <<~TEXT

      #{name}の#{attack_message}！
      #{monster_name}に#{damage}のダメージを与えた
    TEXT
  end

  # ===== `class Monster`の処理で利用 =====
  def attack_brave_message(name, attack_message, brave_name, damage)
    puts <<~TEXT

      #{name}の#{attack_message}！
      #{brave_name}は#{damage}のダメージを受けた
    TEXT
  end
end
