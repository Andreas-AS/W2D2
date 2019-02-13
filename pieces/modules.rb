
require 'byebug'
module Slideable

    HORIZONTAL_DIRS = [[0,1], [0, -1], [1, 0], [-1, 0]]
    DIAGONAL_DIRS = [[-1,-1], [1,1], [1,-1], [-1,1]]

    def diagonal_dirs(start_pos)
        diagonal_moves = []
        DIAGONAL_DIRS.each do |dir|
            diagonal_moves.concat(grow_unblocked_moves_in_dir(start_pos, dir))
        end
        diagonal_moves
    end

    def horizontal_dirs(start_pos)
        horizontal_moves = []
        HORIZONTAL_DIRS.each do |dir|
            horizontal_moves.concat(grow_unblocked_moves_in_dir(start_pos, dir))
        end
        horizontal_moves
    end

    def grow_unblocked_moves_in_dir(start_pos, dir)
        # debugger
        next_pos = [start_pos.first[0] + dir[0], start_pos.first[1] + dir[1]]
        # debugger
        return [] unless board.valid_position?([next_pos])
        if board[next_pos].name != nil 
            if color == board[next_pos].color
                return []
            else
                return [next_pos]
            end
        end
        unblocked_moves = grow_unblocked_moves_in_dir([next_pos],dir)
        unblocked_moves << [next_pos]

    end

end

module Steppable

     def unblocked_moves(start_pos, difs)
        unblocked_moves = []
        difs.each do |dif|
            diff_position = [start_pos.first[0] + dif[0], start_pos.first[1] + dif[1]]
            if board.valid_position?(diff_position) && (board[diff_position].name == nil || color != board[diff_position].color)
                unblocked_moves << diff_position
            end
        end

        unblocked_moves
     end

end