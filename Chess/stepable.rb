module Stepable
    KNIGHT = [[2, 1], [1, 2], [-1, 2], [-1, -2], [-2, 1], [-2, -1], [1, -2], [2, -1]].freeze
    KING = [[1,0], [0,1], [-1,0], [0, -1], [1, 1], [-1,-1], [-1,1], [1,-1]].freeze

    def knight_moves
        KNIGHT
    end

    def king_moves
        KING
    end

    def moves
        case move_diffs
        when "knight"
            return knight_movement
        when "king"
            return king_movement
        end
    end

    private
    def move_diffs
        
    end

    def knight_movement
        arr = []
        dupe = self.pos.dup
        knight_moves.each do |move|
            unless dupe[0] + move[0] > 7 || dupe[1] + move[1] > 7 || dupe[0] + move[0] < 0 || dupe[1] + move[1] < 0
                if self.board[dupe[0] + move[0]][dupe[1] + move[1]] == Nullpiece.instance
                    new_x = dupe[0] + move[0]
                    new_y = dupe[1] + move[1]
                    arr << [new_x, new_y]
                elsif self.board[dupe[0] + move[0]][dupe[1] + move[1]].color != self.color
                    new_x = dupe[0] + move[0]
                    new_y = dupe[1] + move[1]
                    arr << [new_x, new_y]
                end
            end
        end
        arr
    end

    def king_movement
        arr = []
        dupe = self.pos.dup
        king_moves.each do |move|
            unless dupe[0] + move[0] > 7 || dupe[1] + move[1] > 7 || dupe[0] + move[0] < 0 || dupe[1] + move[1] < 0
                if self.board[dupe[0] + move[0]][dupe[1] + move[1]] == Nullpiece.instance
                    new_x = dupe[0] + move[0]
                    new_y = dupe[1] + move[1]
                    arr << [new_x, new_y]
                elsif self.board[dupe[0] + move[0]][dupe[1] + move[1]].color != self.color
                    new_x = dupe[0] + move[0]
                    new_y = dupe[1] + move[1]
                    arr << [new_x, new_y]
                end
            end
        end
        arr
    end
end