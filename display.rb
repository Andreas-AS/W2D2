require "colorize"

class Display 
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board, self)
    end

    def render
        while true
            board.rows.each_with_index do |row,ri|
            print "#{8 - ri}  ".colorize(:green)
            row.each_with_index do |col,ci|
                case board[[ri, ci]].name
                when nil
                    char = " _ "
                when "pawn"
                    char = " P "
                when "queen"
                    char = " Q "
                when "king"
                    char = " K "
                when "rook"
                    char = " R "
                when "knight"
                    char = " Kn "
                when "bishop"
                    char = " B "
                end
                if board[[ri,ci]].selected == true 
                    print char.colorize(:red)
                elsif [ri, ci] == cursor.cursor_pos
                    print char.colorize(:yellow)
                else
                    print char
                end
                
            end
            puts "\n"
        end
        puts "\n"
        print "    A  B  C  D  E  F  G  H".colorize(:green)
        cursor.get_input
        end
    end

end