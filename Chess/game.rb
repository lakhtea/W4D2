require_relative 'board.rb'
require_relative 'display.rb'

class Game
    attr_reader :board
    def initialize()
        board = Board.new
        display = Display.new(board)
    end
    def play
        while true
        display.render
        end
    end

end

g = Game.new
g.play

