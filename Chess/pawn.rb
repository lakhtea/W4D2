require_relative 'req_file.rb'
require_relative './piece.rb'
class Pawn < Piece
    def initialize(color, board, pos)
        super(color, board, pos)
          if color == "black"
            @symbol = "♟︎"
        else
            @symbol = "♙"
        end
    end

    def symbol
        @symbol
    end


    def moves
        dupe = self.pos.dup 
        arr = []
        final_move_set = []
        arr += fwd_steps
        arr += side_attacks
        arr.each do |move|
            new_x = dupe[0] + move[0]
            new_y = dupe[1] + move[1]
            final_move_set << [new_x, new_y]
        end
        final_move_set
    end


    private

    def at_start_row?
        return true if self.color == "black" && self.pos[0] == 1
            
        return true if self.color == "white" && self.pos[0] == 6
            
        false
    end

    def fwd_dirr
        return 1 if self.color == "black"
        return -1 if self.color == "white"
    end

    def fwd_steps
        if at_start_row?
            return [1 * fwd_dirr, 0], [2 * fwd_dirr, 0]
        else
            return [[1 * fwd_dirr, 0]]
        end
    end

    def side_attacks   
        return [1 * fwd_dirr, 1], [1 * fwd_dirr, -1]
    end


end