require_relative 'req_file.rb'

class Piece
    def initialize()
        @color = "black"
        @symbol = "symbol"
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def Symbol
        @symbol
    end

    def move_into_check?(end_pos)
    end

end