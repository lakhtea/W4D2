module Slideable
    DIAGONAL = [[1, 1],[1, -1],[-1, 1],[-1, -1]]
    LINEAR = [[1, 0],[-1, 0],[0,1],[0,-1]]

    def horizontal_dirs
        
    end

    def diagonal_dirs

    end

    def moves
        case move_dirs # == both
        when both
            return 
        when horizontal
            asnfja
        when diagonal
            asfnajsf
        end
    end

    private
    def move_dirs

    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        #grid[0][0] grid[0+dx][0+dy] until !grid[0+dx][0+dy].nil?
    end
end