require_relative '../Scrabble.rb'

class Scrabble::Player
  attr_reader  :name, :highest_scoring_word, :total_score, :highest_word_score, :plays, :player_bag, :tiles

  def initialize(name)
    @name = name
    @plays = Array.new
    @total_score = 0
    @highest_scoring_word = nil
    @highest_word_score = 0
    @tiles = []

  end

  def play(word)
    if won?
      return false
    else
      score = Scrabble::Scoring.score(word)
      @total_score += score
      plays << word
      if score > @highest_word_score
        @highest_word_score = score
        @highest_scoring_word = word
      end
      return score
    end
  end

  def won? 
    if @total_score > 100 
      true
    else
      false
    end
  end

  def  draw_tiles(tile_bag)
    tile_hand = tile_bag.draw_tiles(7 - @tiles.length)
    tile_hand.each do |x|
      @tiles << x
    end
    return @tiles
  end

end
