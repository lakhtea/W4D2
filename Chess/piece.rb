require_relative 'req_file.rb'

class Piece
    attr_reader :board, :color, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves

    end

    def pos=(val)
        @pos = val
    end

    def symbol
        :P
    end

    def move_into_check?(end_pos)
    end

    def inspect
        symbol
    end

end