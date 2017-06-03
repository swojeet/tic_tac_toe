class Board
  def initialize
    @board = [["1","2","3"],
              ["4","5","6"],
              ["7","8","9"]]
    set_board
  end

  def set_board
    # print "\n------\n"
    @board.each_with_index do |x, outer_pos|
      x.each_with_index do |y,pos|
        if pos == 2
          print"#{y}"
        else
          print"#{y}|"
        end
      end
      print "\n------\n" unless outer_pos==2
    end
  end
end

Board.new
