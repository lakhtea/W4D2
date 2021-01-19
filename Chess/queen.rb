require_relative './slideable.rb'
require_relative './piece.rb'
class Queen < Piece
    include Slideable
    def initialize
        @symbol = :Q
    end

    def move_dirs
        return both
    end

end