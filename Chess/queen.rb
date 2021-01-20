require_relative 'req_file.rb'
require_relative './slideable.rb'
require_relative './piece.rb'
class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super(color, board, pos)
        if color == "black"
            @symbol = "♛"
        else
            @symbol = "♕"
        end
    end

    def valid_moves
        moves
    end

    def move_dirs
        return "both"
    end

    def inspect
        @symbol
    end
end