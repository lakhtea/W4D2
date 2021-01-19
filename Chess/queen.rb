require_relative 'req_file.rb'
require_relative './slideable.rb'
require_relative './piece.rb'
class Queen < Piece
    include Slideable
    attr_accessor :pos, :grid
    def initialize
        @symbol = :Q
        @pos = [2,4]
        @grid = Array.new(8) {Array.new(8)}
        start_pos
    end

    def move_dirs
        return "both"
    end

    def start_pos
        @grid[0].each_with_index do |tile, idx|
            grid[0][idx] = Piece.new
        end
        @grid[1].each_with_index do |tile, idx|
            grid[1][idx] = Piece.new
        end
        @grid[6].each_with_index do |tile, idx|
            grid[6][idx] = Piece.new
        end
        @grid[7].each_with_index do |tile, idx|
            grid[7][idx] = Piece.new
        end
    end

end

q = Queen.new
p q.moves
