require_relative '../Scrabble.rb'


class Scrabble::TileBag
  attr_reader :bag

  def initialize
    @bag = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", 
      "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", 
      "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", 
      "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O",
      "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T",
      "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]
  end

  def draw_tiles(num)
    if num <= 0 || num > 7 || num.class != Fixnum
      raise ArgumentError
    else
      tile_hand = []
      @bag.shuffle!
      num.times do 
        tile_hand << @bag.pop
      end
      return tile_hand
    end
  end

  def tiles_remaining
    return @bag.length
  end


end

puts Scrabble::TileBag.new.bag.length