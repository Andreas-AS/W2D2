require 'byebug'
class NotPossibleMove < StandardError; end

class Board
    attr_reader :rows, :display
    
    def initialize
        @rows = Array.new(8) {Array.new(8, nil) }
        @display = Display.new(self)
        populate_board
        # @display.render
    end

    def render
        display.render
    end

    def populate_board
        i = 0
        while i < 8
            self[[0, i]] = Rook.new("rook", self, [[0,i]], "black")
            self[[1, i]] = Pawn.new("pawn", self, [[1,i]], "black")
            self[[2, i]] = NullPiece.new
            self[[3, i]] = NullPiece.new
            self[[4, i]] = NullPiece.new
            self[[5, i]] = NullPiece.new
            self[[6, i]] = Queen.new("queen", self, [[6,i]], "white")
            self[[7, i]] = Rook.new("rook", self, [[7,i]], "white")
            i += 1
        end
    end


    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @rows[x][y] = value
    end

    def move_piece(start_pos, end_pos)
        raise NotPossibleMove unless valid_position?(start_pos) && valid_position?(end_pos)
        raise NotPossibleMove if self[start_pos] == nil || self[end_pos] != nil
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    def valid_position?(pos)
        # debugger
        pos.first[0].between?(0,7) && pos.first[1].between?(0,7)
    end

end