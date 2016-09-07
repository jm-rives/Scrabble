require_relative 'spec_helper.rb'

require_relative '../lib/Player.rb'

describe "Testing Player Class" do

  it 'Test that the instantiation of the Player class requires EXACTLY one argument' do
    expect( proc {Scrabble::Player.new}).must_raise(ArgumentError)
    expect( proc {Scrabble::Player.new("One", "Two")}).must_raise(ArgumentError)
  end

  it 'Test that .name method returns the instance variable name' do
    player1 = Scrabble::Player.new("Joanna")
    player2 = Scrabble::Player.new("Alyssa")
    player3 = Scrabble::Player.new("12345")
    expect(player1.name).must_equal("Joanna")
    expect(player2.name).must_equal("Alyssa")
    expect(player3.name).must_equal("12345")
  end

  it 'Test that the player is initiated with a blank plays array' do
    player1 = Scrabble::Player.new("Joanna")
    expect(player1.plays).must_equal([])
  end

  it 'Test that .play(word) adds the input word to the array of words played by the player and that the .plays method returns the array of words played by the player' do
    player4 = Scrabble::Player.new("Joanna")
    player4.play("APPLE")
    player4.play("QUILT")
    player4.play("jam")
    expect(player4.plays).must_equal(["APPLE", "QUILT", "jam"])
  end

  it 'Test that .play(word) returns false if the player has already won' do
    player7 = Scrabble::Player.new("Pancakes")
    player7.play("QQQQQQQ")
    expect(player7.play("Word")).must_equal(false)
  end

  it 'Test that .play(word) returns word score if the player has not already won' do
    player8 = Scrabble::Player.new("Joanna")
    expect(player8.play("Word")).must_equal(8)
  end

  it 'Test that .total_score method returns total score' do
    player9 = Scrabble::Player.new("Joanna")
    player9.play("word")
    player9.play("quilt")
    expect(player9.total_score).must_equal(22)
  end

  it 'Test that .highest_scoring_word method returns highest scoring word' do
    player5 = Scrabble::Player.new("Waffles")
    player5.play("APPLE")
    player5.play("QUILT")
    player5.play("jam")
    expect(player5.highest_scoring_word).must_equal("QUILT")
  end

  it 'Test that .highest_word_score method returns highest scoring word score' do
    player6 = Scrabble::Player.new("Waffles")
    player6.play("APPLE")
    player6.play("QUILT")
    player6.play("jam")
    expect(player6.highest_word_score).must_equal(14)
  end

  it 'Test that .won method returns false if player has fewer than 100 points' do
    player10 = Scrabble::Player.new("Joanna")
    player10.play("Quilt")
    player10.play("jam")
    player10.play("apple")
    expect(player10.won?).must_equal(false)
  end

  it 'Test that .won method returns true if player has more than 100 points' do
    player11 = Scrabble::Player.new("Joanna")
    player11.play("QQQQQQQ")
    expect(player11.won?).must_equal(true)
  end

  it 'Test that .tiles returns a collection of playable letters' do
    player12 = Scrabble::Player.new("Whiskey")
    tile_bag12 = Scrabble::TileBag.new
    player12.draw_tiles(tile_bag12)
    expect(player12.tiles.class).must_equal(Array)
    player12.tiles.each do |x|
      expect(x.length).must_equal(1)
      expect('ABCDEFGHIJKLMNOPQRSTUVWXYZ').must_include(x.upcase)
    end
  end

  it 'Test that legal word play returns score' do
    player13 = Scrabble::Player.new("Bourbon")
    tile_bag13 = Scrabble::TileBag.new
    player13.draw_tiles(tile_bag13)
    letters_available = player13.tiles
    word_to_test = "#{letters_available[0]}#{letters_available[1]}#{letters_available[2]}"
    expect(player13.play(word_to_test)).must_equal(Scrabble::Scoring.score(word_to_test))
  end

  it 'Test that illegal word play raise ArgumentError' do
    player14 = Scrabble::Player.new("Bourbon")
    tile_bag14 = Scrabble::TileBag.new
    player14.draw_tiles(tile_bag14)
    letters_available = player14.tiles
    word_to_test = "#{letters_available[0]}#{letters_available[1]}#{letters_available[2]}XX"
    expect( proc {player14.play(word_to_test)}).must_raise ArgumentError
  end

  # it 'Test that .draw_tiles(tile_bag) fills tile_array to equal 7 letters' do
  #   player13 = Scrabble::Player.new("FrenchToast")
  #   tile_bag13 = Scrabble::TileBag.new
  #   player13.draw_tiles(tile_bag13)
  #   expect(player13.tiles.length).must_equal(7)
  # end

end
