require_relative 'req_file.rb'
require_relative './stepable.rb'
require_relative './piece.rb'
class King < Piece
    include Stepable
    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = :K
    end

    def valid_moves
        moves
    end

    def move_diffs
        return "king"
    end


end