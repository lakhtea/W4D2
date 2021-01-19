require_relative 'req_file.rb'
require "byebug"
module Slideable
    DIAGONAL = [[1, 1],[1, -1],[-1, 1],[-1, -1]]
    LINEAR = [[1, 0],[-1, 0],[0,1],[0,-1]]

    def horizontal_dirs
        
    end

    def diagonal_dirs

    end

    def moves
        moves = []
        directions = move_dirs
        case directions # == both
        when "both"
            diag = DIAGONAL.dup
            linear = LINEAR.dup
            diag.each do |move|
                x = move[0]
                y = move[1]
                moves << grow_unblocked_moves_in_dir(x, y)
            end
            linear.each do |move|
                moves << grow_unblocked_moves_in_dir(move[0], move[1])
            end
        when "linear"
            LINEAR.each do |move|
                moves << grow_unblocked_moves_in_dir(move[0], move[1])
            end
        when "diagonal"
            DIAGONAL.each do |move|
                moves << grow_unblocked_moves_in_dir(move[0], move[1])
            end
        end
        #shovel final position from grow_unblocked into an array
        #return an array of the possible and legitimate end positions the piece can move to
        moves
    end

    # private
    def move_dirs

    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        #grid[0][0] grid[0+dx][0+dy] until !grid[0+dx][0+dy].nil?
        #return final position for any direction inputted
        dupe = self.pos.dup
        filled = false
        unblocked_moves = []
        until filled
            debugger
            break if dupe[0] >= 7 || dupe[1] >= 7
            if self.grid[dupe[0] + dx][dupe[1] + dy] == nil
                unblocked_moves << [dupe[0] + dx, dupe[1] + dy]
                dupe[0] += dx
                dupe[1] += dy
            else
                filled = true
            end
        end
        unblocked_moves
    end
end