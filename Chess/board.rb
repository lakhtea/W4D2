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
            grid[0][idx] = black_pieces("black", @grid, [0,idx])[idx]
        end
        (0...grid.length).each do |idx|
            grid[1][idx] = Pawn.new("black", @grid, [1, idx])
        end
        (0...grid.length).each do |idx|
            grid[6][idx] = Pawn.new("white", @grid, [6, idx])
        end
        (0...grid.length).each do |idx|
            grid[7][idx] = white_pieces("white", @grid, [7, idx])[idx]
        end
    end

    def white_pieces(color, board, pos)
        white_arr = [
            w_r1 = Rook.new(color, board, pos),
            w_h1 = Knight.new(color, board, pos),
            w_b1 = Bishop.new(color, board, pos),
            w_q = Queen.new(color, board, pos),
            w_k = King.new(color, board, pos),
            w_b2 = Bishop.new(color, board, pos),
            w_h2 = Knight.new(color, board, pos),
            w_r2 = Rook.new(color, board, pos)
        ]
    end
    def black_pieces(color, board, pos)
        black_arr = [
            b_r1 = Rook.new(color, board, pos),
            b_h1 = Knight.new(color, board, pos),
            b_b1 = Bishop.new(color, board, pos),
            b_k = King.new(color, board, pos),
            b_q = Queen.new(color, board, pos),
            b_b2 = Bishop.new(color, board, pos),
            b_h2 = Knight.new(color, board, pos),
            b_r3 = Rook.new(color, board, pos)
        ]
    end

    def white_pieces_arr
            [   
            w_r1,
            w_h1,
            w_b1,
            w_q,
            w_k,
            w_b2,
            w_h2,
            w_r2
            #any_pawn_instance
        ]
    end
    def black_pieces_arr
        [
            b_r1,
            b_h1,
            b_b1,
            b_q,
            b_k,
            b_b2,
            b_h2,
            b_r2
            #any_pawn_instance
        ]
    end

    def valid_pos?(pos)
        return false if pos[1] > 7 || pos[1] < 0 || pos[0] > 7 || pos[0] < 0
        true
    end


    def move_piece(color, start_pos, end_pos)
        row, col = start_pos
        row1, col1 = end_pos
        raise "Outside Board" if row1 > 7 || row1 < 0 || col1 > 7 || col1 < 0
        if @grid[row][col] == Nullpiece.instance 
            raise "There is no piece, fool!"
        end
        unless @grid[row1][col1] == Nullpiece.instance || @grid[row1][col1].color != @grid[row][col].color  
            raise "Where you think you're going, pal? There is a piece here!"
        end
        moveset = @grid[row][col].moves
        if !moveset.include?(end_pos)
            raise "That shit aint kosher!"
        end
        @grid[row1][col1] = grid[row][col]
        grid[row][col] = Nullpiece.instance

        @grid[row1][col1].pos = end_pos
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end


    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end


    def in_check?(color)
        if color == "black"
            white_pieces_arr.each do |piece|
                if piece.moves.include?(b_k.pos)
                    return true
                end
            end
        else
            black_pieces_arr.each do |piece|
                if piece.moves.include?(w_k.pos)
                    return true
                end
            end
        end
    end

    # def checkmate?(color)
    #     if color == "black"
    #         b_k.moves.any? { |move| 

    #     end

    # end

end


b = Board.new

# # b.move_piece("orange", [2,4], [2,6])

# p b.grid
