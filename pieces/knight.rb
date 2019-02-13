class Knight < Piece

    include Steppable

    KNIGHT_DIFS = [[-2, 1], [2, -1], [-1, 2], [1, -2], [1, 2], [-1, -2], [2, 1], [-2, -1]]

    def moves
        unblocked_moves(pos, KNIGHT_DIFS)
    end
end