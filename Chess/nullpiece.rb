require "singleton"
class Nullpiece < Piece
    include Singleton
    def initialize
    end

    def moves
    end

    def symbol
        :" "
    end

    def inspect
        symbol
    end


end