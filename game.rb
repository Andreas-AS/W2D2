require "byebug"

class Game
    attr_reader :board

    def initialize
        debugger
        @board = Board.new
        @display = Display.new(board)
        @players
        @current_player
    end


end