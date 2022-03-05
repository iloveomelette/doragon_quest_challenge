require_relative 'character'
class Brave < Character
  def initialize(name, hp, attack, defense)
    super(name, hp, attack, defense)
    @brave = [@name, @hp, @attack, @defense]
  end
end
