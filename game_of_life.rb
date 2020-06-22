class GameOfLife
  attr_accessor :board, :neighborhood

  def initialize(size)
    @board = Array.new(size){Array.new(size)} 
    @neighborhood  = Array.new(size){Array.new(size)}
  end

  def create_board
    for x in 0..@board.size-1
      for y in 0..@board.size-1
        @board[x][y] = ['_', '1'].sample
        @neighborhood[x][y] = 0
      end
    end
  end

  def show_board
    @board.each { |elem| puts "#{elem}" }
  end

  def show_neighborhood
    @neighborhood.each { |elem| puts "#{elem}" }
  end

  def next_state
    for x in 1..@board.size-2
      for y in 1..@board.size-2
        counter=0
        counter += 1 if @board[x-1][y] == '1'
        counter += 1 if @board[x-1][y-1] == '1'
        counter += 1 if @board[x-1][y+1] == '1'
        counter += 1 if @board[x][y-1] == '1'
        counter += 1 if @board[x][y+1] == '1'
        counter += 1 if @board[x+1][y-1] == '1'
        counter += 1 if @board[x+1][y+1] == '1'
        counter += 1 if @board[x+1][y] == '1'

        @neighborhood[x][y] = counter
      end   
    end
  end 

  def find_life
    for x in 1..@board.size-2      
      for y in 1..@board.size-2
        @board[x][y] = (@neighborhood[x][y] == 2 || @neighborhood[x][y] == 3) ? '1' : '_' 
      end
    end  
  end 
end 

game = GameOfLife.new(10)
game.create_board
game.show_board
game.next_state

puts "\nNumber of neighbors of each cell"
game.show_neighborhood

puts "\nNext board state"
game.find_life
game.show_board
