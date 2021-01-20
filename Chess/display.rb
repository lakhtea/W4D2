require_relative 'board.rb'
require 'colorize'
# require_relative 'cursor.rb'
class Display
    def initialize(board)
        @board = board
        # @cursor = Cursor.new([0,0], board)
    end
    def render
        @board.grid.each do |row|
            puts row.join(" ")
        end
    end

    def loopy
        while true
        render
        @cursor.get_input
        system "clear"
        end
    end
end

# d = Display.new(Board.new)
# d.loopy