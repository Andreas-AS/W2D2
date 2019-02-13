class King < Piece

    include Steppable

    KING_DIFS = [[0,1], [0,-1], [1, 1], [1,-1], [1,0], [-1, 0], [-1, 1], [-1,-1]]

    def moves
        unblocked_moves(pos, KING_DIFS)
    end

end