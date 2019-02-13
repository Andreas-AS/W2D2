class Rook < Piece
   include Slideable
   
   def moves
        possible_moves = []
        horizontal_dirs(pos).each {|space| possible_moves << space}
        possible_moves
    end
end