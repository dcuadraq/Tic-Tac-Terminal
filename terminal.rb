require 'tic_tac_doh'

module TicTacToe
  class Terminal

    def initialize(args={})
      tic_tac_toe
      set_board_size
      next_turn
    end

    def next_turn
      @game.play
    end

    def set_board_size
      puts "What size should the board be?"
      size = gets.chomp.to_i
      size = size > 3 ? size : 3 # refactor
      @game.set_board_size(size)
    end

    def print_grid
      grid.each do |row|
        puts row.join('|')
      end
    end

    def clear_screen
      system 'clear' or system 'cls'
    end

    def tic_tac_toe
      @game = TicTacDoh::Game.new(player1: TicTacDoh::Player.new(mark: 'X'),
                                  player2: TicTacDoh::Player.new(mark: 'O'))
    end
  end

  # continue = 1
  # until continue == 'no'
  #   game.play
  #   puts "Another game? 'no' to quit"
  #   continue = gets.chomp
  # end
end

TicTacToe::Terminal.new

# Set players
# Game over?
  # Next turn

# Who is next?
