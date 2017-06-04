class Game
  require_relative 'board'
  require_relative 'player'

  def initialize
    @tictactoe_board = Board.new()
    name = askName()
    # Player1 goes first so passing true
    @player1 = Player.new(name, "X", true)
    name = askName()
    @player2 = Player.new(name, "O")
    puts "GAME READY!"
  end

  def play_game
    @tictactoe_board.display_board
    while game_incomplete? do
      if @player1.turn
        print "\n#{@player1.name}'s turn. Enter your move: "
        coordinates = gets.chomp.downcase
        indices = map_coordinates(coordinates)
        coordinate1 = indices[0]
        coordinate2 = indices[1]
        move(@player1.sign, coordinate1, coordinate2)
        @player1.turn, @player2.turn = false, true
      else
        print "\n#{@player2.name}'s turn. Enter your move: "
        coordinates = gets.chomp.downcase
        indices = map_coordinates(coordinates)
        coordinate1 = indices[0]
        coordinate2 = indices[1]
        move(@player2.sign, coordinate1, coordinate2)
        @player1.turn, @player2.turn = true, false
      end
    end
  end

  private

  def game_incomplete?
    true
  end

  def map_coordinates(coordinates)
    map_hash = { "a1" => [0, 0],
                  "a2" => [0, 1],
                  "a3" => [0, 2],
                  "b1" => [1, 0],
                  "b2" => [1, 1],
                  "b3" => [1, 2],
                  "c1" => [2, 0],
                  "c2" => [2, 1],
                  "c3" => [2, 2]}
    map_hash[coordinates]
  end

  def move(sign, coordinate1, coordinate2)
    puts coordinate1
    puts coordinate2
    @tictactoe_board.board[coordinate1][coordinate2] = sign
    @tictactoe_board.display_board
  end

  def askName
    puts "Enter name of player"
    name = gets.chomp.upcase
    name
  end
end

obj = Game.new()
obj.play_game
