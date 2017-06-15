class Board
  attr_accessor :board

  def initialize
    @board = [[" "," "," "],
              [" "," "," "],
              [" "," "," "]]

    # @board = [["1","2","3"],
    #           ["4","5","6"],
    #           ["7","8","9"]]
    # display_board
  end

  def board_positions
    puts " 1 2 3"
    puts "a | | "
    puts "-------"
    puts "b | | "
    puts "-------"
    puts "c | | "
  end

  def display_board
    # print "\n------\n"
    @board.each_with_index do |x, outer_pos|
      x.each_with_index do |y,pos|
        if pos == 2
          print"#{y}\n"
        else
          print"#{y}|"
        end
      end
      print "------\n" unless outer_pos==2
    end
    # p @board
  end


  def check_horizontally
    i = 0
    winning_sign = nil
    if (@board[0][i] != " " && @board[0][i] == @board[0][i+1] &&  @board[0][i+1] == @board[0][i+2])
      winning_sign = @board[0][i]
    elsif (@board[1][i] != " " && @board[1][i] == @board[1][i+1] &&  @board[1][i+1] == @board[1][i+2])
      winning_sign = @board[1][i]
    elsif (@board[2][i] != " " && @board[2][i] == @board[2][i+1] &&  @board[2][i+1] == @board[2][i+2])
      winning_sign = @board[2][i]
    end
    winning_sign = nil unless (winning_sign.eql?("X") || winning_sign.eql?("O"))
    return winning_sign
  end

  def check_vertically
    i = 0
    winning_sign = nil
    if (@board[i][0] == @board[i+1][0] &&  @board[i+1][0] == @board[i+2][0])
      winning_sign = @board[i][0]
    elsif (@board[i][1] == @board[i+1][1] &&  @board[i+1][1] == @board[i+2][1])
      winning_sign = @board[i][1]
    elsif (@board[i][2] == @board[i+1][2] &&  @board[i+1][2] == @board[i+2][2])
      winning_sign = @board[i][2]
    end
    winning_sign = nil unless (winning_sign.eql?("X") || winning_sign.eql?("O"))
    return winning_sign
  end

  def check_diagonally
    i = 0
    winning_sign = nil
    if (@board[i][i] == @board[i+1][i+1] &&  @board[i+1][i+1] == @board[i+2][i+2])
      winning_sign = @board[i][i]
    elsif (@board[i][i+2] == @board[i+1][i+1] &&  @board[i+1][i+1] == @board[i+2][i])
      winning_sign = @board[i+2][i]
    end
    winning_sign = nil unless (winning_sign.eql?("X") || winning_sign.eql?("O"))
    return winning_sign
  end

end
