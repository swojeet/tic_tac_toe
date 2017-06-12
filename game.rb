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
      player = players_turn
      print "\n#{player.name}'s turn. Enter your move: "
      coordinates = gets.chomp.downcase
      indices = map_coordinates(coordinates)
      if indices.nil?
        puts "Invalid Move! Try Again!"
        next
      end
      coordinate1, coordinate2 = indices[0], indices[1]
      unless move(player.sign, coordinate1, coordinate2)
        puts "Already Exists!"
        next
      end
      break if winner != nil
      if player == @player1
        @player1.turn, @player2.turn = false, true
      else
        @player1.turn, @player2.turn = true, false
      end
    end
  end

  private
  def players_turn
    if @player1.turn
      return @player1
    else
      return @player2
    end
  end

  def game_incomplete?
    @tictactoe_board.board.each do |x|
      x.each do |y|
        return true if y == " "
      end
    end
    puts "DRAW!"
    false
  end

  def winner
    the_winner = nil
    the_winner = check_horizontally || check_vertically || check_diagonally
    puts "#{the_winner} Wins!" if the_winner != nil
    return the_winner
  end

  def check_horizontally
    i = 0
    winning_sign = nil
    if (@tictactoe_board.board[0][i] == @tictactoe_board.board[0][i+1] &&  @tictactoe_board.board[0][i+1] == @tictactoe_board.board[0][i+2])
      winning_sign = @tictactoe_board.board[0][i]
    elsif (@tictactoe_board.board[1][i] == @tictactoe_board.board[1][i+1] &&  @tictactoe_board.board[1][i+1] == @tictactoe_board.board[1][i+2])
      winning_sign = @tictactoe_board.board[1][i]
    elsif (@tictactoe_board.board[2][i] == @tictactoe_board.board[2][i+1] &&  @tictactoe_board.board[2][i+1] == @tictactoe_board.board[2][i+2])
      winning_sign = @tictactoe_board.board[2][i]
    end
    winning_sign = nil unless (winning_sign.eql?("X") || winning_sign.eql?("O"))
    return winning_sign
  end

  def check_vertically
    i = 0
    winning_sign = nil
    if (@tictactoe_board.board[i][0] == @tictactoe_board.board[i+1][0] &&  @tictactoe_board.board[i+1][0] == @tictactoe_board.board[i+2][0])
      winning_sign = @tictactoe_board.board[i][0]
    elsif (@tictactoe_board.board[i][1] == @tictactoe_board.board[i+1][1] &&  @tictactoe_board.board[i+1][1] == @tictactoe_board.board[i+2][1])
      winning_sign = @tictactoe_board.board[i][1]
    elsif (@tictactoe_board.board[i][2] == @tictactoe_board.board[i+1][2] &&  @tictactoe_board.board[i+1][2] == @tictactoe_board.board[i+2][2])
      winning_sign = @tictactoe_board.board[i][2]
    end
    winning_sign = nil unless (winning_sign.eql?("X") || winning_sign.eql?("O"))
    return winning_sign
  end

  def check_diagonally
    i = 0
    winning_sign = nil
    if (@tictactoe_board.board[i][i] == @tictactoe_board.board[i+1][i+1] &&  @tictactoe_board.board[i+1][i+1] == @tictactoe_board.board[i+2][i+2])
      winning_sign = @tictactoe_board.board[i][i]
    elsif (@tictactoe_board.board[i][i+2] == @tictactoe_board.board[i+1][i+1] &&  @tictactoe_board.board[i+1][i+1] == @tictactoe_board.board[i+2][i])
      winning_sign = @tictactoe_board.board[i+2][i]
    end
    winning_sign = nil unless (winning_sign.eql?("X") || winning_sign.eql?("O"))
    return winning_sign
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
    return nil unless @tictactoe_board.board[coordinate1][coordinate2].include?(" ")
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
