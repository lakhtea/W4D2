require_relative 'req_file.rb'
require_relative 'piece.rb'
require_relative 'nullpiece.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'

class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(8) {Array.new(8, Nullpiece.instance)}
        start_pos
    end

    def start_pos
        (0...grid.length).each do |idx|
            grid[0][idx] = array_of_pieces("black", @grid, [0,idx])[idx]
        end
        (0...grid.length).each do |idx|
            grid[1][idx] = Pawn.new("black", @grid, [1, idx])
        end
        (0...grid.length).each do |idx|
            grid[6][idx] = Pawn.new("white", @grid, [6, idx])
        end
        (0...grid.length).each do |idx|
            grid[7][idx] = array_of_pieces("white", @grid, [7, idx]).reverse[idx]
        end
    end

    def array_of_pieces(color, board, pos)
        arr = [
            Rook.new(color, board, pos),
            Knight.new(color, board, pos),
            Bishop.new(color, board, pos),
            Queen.new(color, board, pos),
            King.new(color, board, pos),
            Bishop.new(color, board, pos),
            Knight.new(color, board, pos),
            Rook.new(color, board, pos)
        ]
    end

    def move_piece(color, start_pos, end_pos)
        row, col = start_pos
        row1, col1 = end_pos
        raise "Outside Board" if row1 > 7 || row1 < 0 || col1 > 7 || col1 < 0
        if @grid[row][col] == Nullpiece.instance 
            raise "There is no piece, fool!"
        end
        unless @grid[row1][col1] == Nullpiece.instance
            raise "Where you think you're going, pal? There is a piece here!"
        end
        @grid[row1][col1], grid[row][col] = grid[row][col], @grid[row1][col1]

        @grid[row1][col1].pos = end_pos
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end


    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

end

b = Board.new
# pawn = Pawn.new("black", b.grid, [1, 4])
# b[[1, 4]] = pawn

# p pawn.moves

# b.move_piece("orange", [2,4], [2,6])

p b.grid
