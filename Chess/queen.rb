require_relative 'req_file.rb'
require_relative './slideable.rb'
require_relative './piece.rb'
class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = :Q
    end

    def valid_moves
        moves
    end

    def move_dirs
        return "both"
    end


end