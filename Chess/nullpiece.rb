require "singleton"
class Nullpiece < Piece
    include Singleton
    def initialize
        @symbol = " "
    end

    def moves
    end

    def symbol
        @symbol
    end

    def inspect
        symbol
    end


end