require_relative '../Scrabble.rb'

class Scrabble::Scoring

  attr_reader :LETTER_VALUE_ARRAY

  @@LETTER_VALUE_ARRAY = {
      ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]=>1,
      ["D", "G"]=>2,
      ["B", "C", "M", "P"]=>3,
      ["F", "H", "V", "W", "Y"]=>4,
      ["K"]=>5,
      ["J", "X"]=>8,
      ["Q", "Z"]=>10
    }


  def self.letter_check(input)
    raise ArgumentError if input =~ /[[:digit:][:punct:][:blank:]]/ || input.length != 1
    @@LETTER_VALUE_ARRAY.each do |key, value|
      if key.include? input
        return value
      end
    end
  end

  def self.score(word)
    raise ArgumentError if word =~ /[[:digit:][:punct:][:blank:]]/ || word.length == 0
    score = 0
    word.upcase.each_char do |letter|
      score += letter_check(letter)
    end
    is_seven_or_more(word) ? score  += 50 : nil
    return score
  end

  def self.highest_score_from(array_of_words)
    high_score = 0
    high_score_word = nil
    array_of_words.each do |word|
      current_word_score = score(word)
      if current_word_score == high_score
        if word.length < high_score_word.length
          high_score_word = word
        end
      end
      if current_word_score > high_score
        high_score = current_word_score
        high_score_word = word
      end
    end
    return high_score_word
  end

  def self.is_seven_or_more(word)
    if word.length >= 7
      return true
    end
    return false
  end

end

#puts Scrabble::Scoring.score("QQQQQQQQ")
