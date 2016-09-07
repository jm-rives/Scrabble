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

      tester_tiles = @tiles # Copy of player's tiles to test on without modifying original
      if tester_tiles.length != 0
        word.each_char do |word_char|
          (0...tester_tiles.length).each do |index|
            if tester_tiles[index] == word_char
              tester_tiles[index] = nil
              break
            end 
            raise ArgumentError
          end
        end
      end

      # word.each_char do |x|
      #   puts x
      #   print @tiles
      #   puts @tiles.include? x
      #   if @tiles.include? x == false
      #     raise ArgumentError
      #   end
      # end

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
