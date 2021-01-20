require "singleton"
class Nullpiece < Piece
    include Singleton
    def initialize
    end

    def moves
    end

    def symbol
        :N
    end

    def inspect
        symbol
    end


end