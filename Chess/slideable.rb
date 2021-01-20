require_relative 'req_file.rb'
require "byebug"
module Slideable
    DIAGONAL = [[1, 1],[1, -1],[-1, 1],[-1, -1]].freeze
    HORIZONTAL = [[1, 0],[-1, 0],[0,1],[0,-1]].freeze

    def horizontal_dirs
        return HORIZONTAL
    end

    def diagonal_dirs
        return DIAGONAL
    end

    def moves
        move_arr = []
        case move_dirs
        when "both"
            diagonal_dirs.each do |move|
                move_arr += grow_unblocked_moves_in_dir(move[0], move[1]) unless grow_unblocked_moves_in_dir(move[0], move[1]).nil?
            end
            horizontal_dirs.each do |move|
                move_arr += grow_unblocked_moves_in_dir(move[0], move[1]) unless grow_unblocked_moves_in_dir(move[0], move[1]).nil?
            end
        when "horizontal"
            horizontal_dirs.each do |move|
                move_arr += grow_unblocked_moves_in_dir(move[0], move[1]) unless grow_unblocked_moves_in_dir(move[0], move[1]).nil?
            end
        when "diagonal"
            diagonal_dirs.each do |move|
                move_arr += grow_unblocked_moves_in_dir(move[0], move[1]) unless grow_unblocked_moves_in_dir(move[0], move[1]).nil?
            end
        end
        #shovel final position from grow_unblocked into an array
        #return an array of the possible and legitimate end positions the piece can move to
        move_arr
    end

    private
    def move_dirs

    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        #grid[0][0] grid[0+dx][0+dy] until !grid[0+dx][0+dy].nil?
        #return final position for any direction inputted
        dupe = self.pos.dup
        filled = false
        unblocked_moves = []
        until filled
            break if dupe[0] >= 7 || dupe[1] >= 7 || dupe[0] <= 0 || dupe[1] <= 0
            if self.board[dupe[0] + dx][dupe[1] + dy] == Nullpiece.instance
                unblocked_moves << [dupe[0] + dx, dupe[1] + dy]
                dupe[0] += dx
                dupe[1] += dy
            else
                filled = true
            end
        end
        unblocked_moves unless unblocked_moves.empty?
    end
end

