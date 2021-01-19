require_relative "piece.rb"

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        start_pos
    end

    def start_pos
        @grid[0].each_with_index do |tile, idx|
            grid[0][idx] = Piece.new
        end
        @grid[1].each_with_index do |tile, idx|
            grid[1][idx] = Piece.new
        end
        @grid[6].each_with_index do |tile, idx|
            grid[6][idx] = Piece.new
        end
        @grid[7].each_with_index do |tile, idx|
            grid[7][idx] = Piece.new
        end
    end

    def move_piece(start_pos, end_pos)
        row, col = start_pos
        row1, col1 = end_pos
        if @grid[row][col].nil?
            raise "There is no piece, fool!"
        end
        unless @grid[row1][col1].nil? 
            raise "Where you think you're going, pal? There is a piece here!"
        end
        @grid[row1][col1], grid[row][col] = grid[row][col], @grid[row1][col1]

    end

end

b = Board.new
b.move_piece([1,4], [3,3])
p b.grid
