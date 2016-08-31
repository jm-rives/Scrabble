require_relative 'spec_helper.rb'

require_relative '../lib/Scoring.rb'

describe "Testing Scoring Class" do

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
    expect( proc {Scrabble::Scoring.score("1234")}).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.score("1a3b")}).must_raise(ArgumentError)
    expect( proc {Scrabble::Scoring.score("A234")}).must_raise(ArgumentError)
  end

  it 'Test that highest score from method returns highest score word' do
    expect(Scrabble::Scoring.highest_score_from(["APPLE", "QUILT", "JAM"])).must_equal("QUILT")
    expect(Scrabble::Scoring.highest_score_from(["PIZZAZZ", "JUJUBES", "BUZZARD"])).must_equal("PIZZAZZ")
  end

  it 'Two words with equal values will return the shortest word' do
    expect(Scrabble::Scoring.highest_score_from(["zuzim", "jam", "guzzle"])).must_equal("zuzim")
  end

  it 'Two words with equal values will return the 7 letter word' do
    expect(Scrabble::Scoring.highest_score_from(["jumbuck", "nuzzle", "banjax"])).must_equal("jumbuck")
  end

  it 'Test words with the same legnth and score and will return 1st word entered' do
    expect(Scrabble::Scoring.highest_score_from(["hazzan", "fezzes", "wizzes"])).must_equal("hazzan")
    expect(Scrabble::Scoring.highest_score_from(["fezzes", "hazzan", "wizzes"])).must_equal("fezzes")
    expect(Scrabble::Scoring.highest_score_from(["wizzes", "fezzes", "hazzan"])).must_equal("wizzes")
  end
end
