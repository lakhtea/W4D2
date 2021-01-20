module Stepable
    def moves
        move_arr = []
        case move_diffs
        when "knight"
            move_arr << knight_movement
        when "king"
            move_arr << king_shit
        end
        #shovel final position from grow_unblocked into an array
        #return an array of the possible and legitimate end positions the piece can move to
        move_arr
    end

    private
    def move_diffs
        
    end

    def knight_movement
        self.pos #[2, 1] [1, 2] [-1, 2] [-1, -2] [-2, 1] [-2, -1] [1, -2] [2, -1]
    end

    def king_shit

    end
end