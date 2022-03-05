require_relative 'character'
class Monster < Character
  def initialize(name, hp, attack, defense)
    super(name, hp, attack, defense)
    @monster = { name: @name, hp: @hp, attack: @attack, defense: @defense }
  end
end
