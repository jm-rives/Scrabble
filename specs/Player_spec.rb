require_relative 'spec_helper.rb'

require_relative '../Lib/Player.rb'

describe "Testing Player Class" do

  it 'Test that the instantiation of the Player class requires EXACTLY one argument' do
    expect( proc {Scrabble::Player.new}).must_raise(ArgumentError)
    expect( proc {Scrabble::Player.new("One", "Two")}).must_raise(ArgumentError)
  end

  it 'Test that .name method returns the instance variable name' do
    expect(Scrabble::Player.new("Joanna").name).must_equal("Joanna")
    expect(Scrabble::Player.new("Alyssa").name).must_equal("Alyssa")
    expect(Scrabble::Player.new("12345").name).must_equal("12345")
  end

  it 'Test that the player is initiated with a blank plays array' do
    player1 = Scrabble::Player.new("Joanna")
    expect(player1.plays)must_equal([])
  end

  it 'Test that .play(word) adds the input word to the array of words played by the player and that the .plays method returns the array of words played by the player' do
    player1 = Scrabble::Player.new("Joanna")
    player1.play("Some")
    player1.play("Array")
    expect(player1.plays).must_equal(["Some", "Array"])
  end

  it 'Test that .play(word) returns false if the player has already won' do
    player1 = Scrabble::Player.new("Joanna")
    player1.total_score = 101
    expect(player1.play("Word")).must_equal(false)
  end

  it 'Test that .play(word) returns word score if the player has not already won' do
    player1 = Scrabble::Player.new("Joanna")
    player1.total_score = 0
    expect(player1.play("Word")).must_equal(8)
  end

  it 'Test that .total_score method returns total score' do
    player1 = Scrabble::Player.new("Joanna")
    player1.total_score = 82
    expect(player1.total_score).must_equal(82)
  end

  it 'Test that .highest_scoring_word method returns highest scoring word' do
    player1 = Scrabble::Player.new("Joanna")
    player1.plays = ["APPLE", "QUILT", "JAM"]
    expect(player1.highest_scoring_word).must_equal("QUILT")
  end

  it 'Test that .highest_scoring_word method returns highest scoring word' do
    player1 = Scrabble::Player.new("Joanna")
    player1.plays = ["APPLE", "QUILT", "JAM"]
    expect(player1.highest_word_score).must_equal(14)
  end

  it 'Test that .won method returns false if player has fewer than 100 points' do
    player1 = Scrabble::Player.new("Joanna")
    player1.total_score = 0
    expect(player1.won).must_equal(false)

    player3 = Scrabble::Player.new("Joanna")
    player3.total_score = 100
    expect(player1.won).must_equal(false)
  end

  it 'Test that .won method returns true if player has more than 100 points'
    player2 = Scrabble::Player.new("Joanna")
    player2.total_score = 101
    expect(player1.won).must_equal(true)
  end

end
