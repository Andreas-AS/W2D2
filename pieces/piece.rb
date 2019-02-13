

class Piece
    attr_reader :name, :board, :color
    attr_accessor :selected, :pos

    def initialize(name = nil, board, pos, color)
        @name = name
        @selected = false
        @board = board
        @pos = pos
        @color = color
    end


    def inspect
       @name.inspect 
    end
    
end