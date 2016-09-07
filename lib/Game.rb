
class Scrabble::Game
  attr_reader :game_bag

  def initialize
    @game_bag = Scrabble::TileBag.new
  end

end