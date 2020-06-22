require 'minitest/autorun'
require './game_of_life'

class TestGame < Minitest::Test
  def setup
    @game = GameOfLife.new(10)
  end

  def test_initialize
    matrix = Array.new(10){Array.new(10)}
    assert_equal matrix, @game.board
    assert_equal matrix, @game.neighborhood
  end
end