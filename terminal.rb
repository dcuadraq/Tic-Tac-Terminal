require 'tic_tac_doh'

module TicTacToe
  class Terminal

    def initialize(args={})
      tic_tac_toe
      set_board_size
      set_players
      play
    end

    def set_players
      continue = 'yes'
      until continue == 'no'
        if add_player
          if @game.players.count > 1
            puts "Another player? no to star game"
            continue = gets.chomp.rstrip.downcase
          end
        else
          puts "Invalid user, try picking another mark"
        end
      end
    end

    def play
      loop do
        match
        clear_screen
        print_grid
        puts "#{@game.winner[:nickname]} won"
        puts "Another match? no to quit"
        @game.reset
        break if gets.chomp.rstrip.downcase == 'no'
      end
    end

    def match
      until @game.game_over?
        clear_screen
        print_grid
        puts "#{@game.who_is_next[:nickname]}'s turn"
        next_turn
      end
    end

    def add_player
      player_number = @game.players.count + 1
      puts "Player #{player_number}: nickname"
      nickname = gets.chomp.rstrip
      puts "Player #{player_number}: mark"
      mark = gets.chomp.rstrip
      @game.add_player(nickname: nickname, mark: mark)
    end

    def next_turn
      @game.next_turn(gets.chomp.to_i)
    end

    def set_board_size
      puts 'What size should the board be?'
      size = gets.chomp.to_i
      size = size > 3 ? size : 3 # refactor
      @game.set_board_size(size)
    end

    def show_scoreboard
      longest_nickname = 0
      @game.scoreboard.each { |player| longest_nickname = player[:nickname].size > longest_nickname ? player[:nickname].size : longest_nickname}
      puts '-----------------'
      @game.scoreboard.each do |player|
        puts "#{player[:nickname].rjust(longest_nickname, ' ')}:#{player[:score]}"
      end
      puts '-----------------'
    end

    def print_grid
      max_digits = (@game.grid.size * @game.grid.size - 1).to_s.size
      @game.grid.each do |row|
        line = []
        row.each do |cell|
          if cell.is_a? Numeric
            line << cell.to_s.rjust(max_digits, '0')
          else
            line << cell.to_s.center(max_digits)
          end
        end
        puts line.join('|')
      end
    end

    def clear_screen
      system 'clear' or system 'cls'
    end

    def tic_tac_toe
      @game = TicTacDoh::Game.new()
    end
  end
end

TicTacToe::Terminal.new
