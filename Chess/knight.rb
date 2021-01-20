require_relative 'req_file.rb'
require_relative './stepable.rb'
require_relative './piece.rb'
class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super(color, board, pos)
        if color == "black"
            @symbol = "♞"
        else
            @symbol = "♘"
        end
    end
    def symbol
        @symbol
    end
    def valid_moves
        moves
    end

    def move_diffs
        return "knight"
    end
    
    def inspect
        @symbol
    end

end