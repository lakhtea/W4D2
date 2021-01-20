require_relative 'req_file.rb'
require_relative 'piece.rb'
require_relative 'nullpiece.rb'

class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(8) {Array.new(8, Nullpiece.instance)}
        start_pos
    end

    def start_pos
        @grid[0].each_with_index do |tile, idx|
            grid[0][idx] = Piece.new("black", @grid, [0,idx])
        end
        @grid[1].each_with_index do |tile, idx|
            grid[1][idx] = Piece.new("black", @grid, [1, idx])
        end
        @grid[6].each_with_index do |tile, idx|
            grid[6][idx] = Piece.new("white", @grid, [6, idx])
        end
        @grid[7].each_with_index do |tile, idx|
            grid[7][idx] = Piece.new("white", @grid, [7, idx])
        end
    end

    def move_piece(color, start_pos, end_pos)
        row, col = start_pos
        row1, col1 = end_pos
        if @grid[row][col].nil?
            raise "There is no piece, fool!"
        end
        unless @grid[row1][col1] == Nullpiece.instance
            raise "Where you think you're going, pal? There is a piece here!"
        end
        @grid[row1][col1], grid[row][col] = grid[row][col], @grid[row1][col1]

    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end


    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

end

b = Board.new
# b.move_piece([1,4], [3,3])
