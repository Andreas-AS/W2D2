class Bishop < Piece
    include Slideable

    def moves
        possible_moves = []
        diagonal_dirs(pos).each {|space| possible_moves << space}
        possible_moves
    end
end