module Message
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
end
