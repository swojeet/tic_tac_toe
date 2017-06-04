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
end
