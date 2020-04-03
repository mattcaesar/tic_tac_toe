require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game
 
    def initialize(n, player_marks_hash= nil)
        @players = []
        
        player_marks_hash.each do |mark, player_type|
           if player_type
            @players << ComputerPlayer.new(mark, n)
           else
            @players << HumanPlayer.new(mark, n) 
           end
        end

        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players[ (@players.index(@current_player) + 1) % (@players.length) ]
    end

    def play
        while @board.empty_positions?
            @board.print
            @position = @current_player.get_position(@board.legal_positions)
            @board.place_mark(@position, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "goaaaaalllll!!! I mean.. winner!"
                return
            else
                self.switch_turn
            end
        end
        p "stalemate. BOOOOOOOORINGGGG"
    end

end


#tests

machine_civil_war = Game.new(3, h: true, u: true, e: true)
machine_civil_war.play