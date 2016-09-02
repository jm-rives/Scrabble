require_relative 'spec_helper'

require_relative '../lib/TileBag.rb'


describe 'Testing TileBag Class' do
  it 'Initialize sets of new instance of default tiles' do
    expect(Scrabble::TileBag.new.class).must_equal(Scrabble::TileBag)
  end

  it 'Initialize has an instance variable equal to a fresh tile bag' do
    expect(Scrabble::TileBag.new.bag).must_equal(["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B",
      "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F",
      "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K",
      "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O",
      "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T",
      "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"])
  end

  it 'Test .draw_tiles(num) returns a number of random tiles' do
    bag1 = Scrabble::TileBag.new
    expect(bag1.draw_tiles(7).length).must_equal(7)
  end

  it 'Test .draw_tiles(num) removes tiles from the default set' do
    bag2 = Scrabble::TileBag.new
    number_of_tiles = bag2.bag.length
    bag2.draw_tiles(6)
    expect(bag2.bag.length).must_equal(number_of_tiles - 6)
    number_of_tiles = bag2.bag.length
    bag2.draw_tiles(4)
    expect(bag2.bag.length).must_equal(number_of_tiles - 4)
  end

  it 'Test that .tiles_remaining returns number of tiles remaing in bag' do
    bag3 = Scrabble::TileBag.new
    number_of_tiles = bag3.bag.length
    bag3.draw_tiles(6)
    expect(bag3.tiles_remaining).must_equal(number_of_tiles - 6)
  end

  it 'Test that .draw_tiles(num) does not permit a negative or 0 input for num' do
    bag4 = Scrabble::TileBag.new
    expect( proc {bag4.draw_tiles(0)}).must_raise ArgumentError
    expect( proc {bag4.draw_tiles(-1)}).must_raise ArgumentError
  end

  it 'Test that .draw_tiles(num) does not allow input of 8 or greater' do
    bag5 = Scrabble::TileBag.new
    expect( proc {bag5.draw_tiles(8)}).must_raise ArgumentError
  end

  it 'Test that .draw_tiles(num) does not allow non Fixnum input' do
    bag6 = Scrabble::TileBag.new
    expect( proc {bag6.draw_tiles("LaLaLa")}).must_raise ArgumentError
  end

  it 'Test that each tile in tile bag is exactly one character in length' do
    bag7 = Scrabble::TileBag.new
    bag7.tiles_remaining.times do
      array_of_one_tile = bag7.draw_tiles(1) # ["A"]
      expect(array_of_one_tile.first.length).must_equal(1)
    end
  end

  it 'Test that each tile in tile bag is exclusively alpha' do
    bag8 = Scrabble::TileBag.new
    bag8.tiles_remaining.times do
      array_of_one_tile = bag8.draw_tiles(1) # ["A"]
      expect('ABCDEFGHIJKLMNOPQRSTUVWXYZ').must_include(array_of_one_tile.first.upcase)
    end
  end

end
