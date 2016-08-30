require_relative 'spec_helper.rb'

require_relative '../Lib/Scrabble.rb'

describe "Testing Scrabble" do
  it 'Test that a letter input returns the appropriate letter value' do
    expect(Scrabble::Scoring.letter_check("A")).must_equal(1)
    expect(Scrabble::Scoring.letter_check("D")).must_equal(2)
    expect(Scrabble::Scoring.letter_check("B")).must_equal(3)
    expect(Scrabble::Scoring.letter_check("F")).must_equal(4)
    expect(Scrabble::Scoring.letter_check("K")).must_equal(5)
    expect(Scrabble::Scoring.letter_check("J")).must_equal(8)
    expect(Scrabble::Scoring.letter_check("Q")).must_equal(10)
    expect(Scrabble::Scoring.letter_check("L")).must_equal(1)
    expect(Scrabble::Scoring.letter_check("W")).must_equal(4)
  end

  it 'Test that a word returns the correct score' do
    expect(Scrabble::Scoring.score("APPLE")).must_equal(9)
    expect(Scrabble::Scoring.score("QUILT")).must_equal(14)
    expect(Scrabble::Scoring.score("JAM")).must_equal(12)
  end

  it 'Test that a word returns the correct score regardless of case' do
    expect(Scrabble::Scoring.score("apple")).must_equal(9)
    expect(Scrabble::Scoring.score("QuIlT")).must_equal(14)
    expect(Scrabble::Scoring.score("Jam")).must_equal(12)
  end

  it 'Test that a seven-letter word returns the correct score including bonus' do
    expect(Scrabble::Scoring.score("PIZZAZZ")).must_equal(95)
    expect(Scrabble::Scoring.score("JUJUBES")).must_equal(73)
    expect(Scrabble::Scoring.score("BUZZARD")).must_equal(78)
  end

  it 'Test that user input ONLY contains alpha characters' do
    expect(Scrabble::Scoring.score(1234)).must_raise(ArgumentError)
    expect(Scrabble::Scoring.score("1a3b")).must_raise(ArgumentError)
    expect(Scrabble::Scoring.score("A234")).must_raise(ArgumentError)
  end
end
