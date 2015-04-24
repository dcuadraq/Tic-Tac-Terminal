require 'tic_tac_doh'

game = TicTacDoh::Game.new(size: 3,
                           player1: TicTacDoh::Player.new(mark: 'X'),
                           player2: TicTacDoh::Player.new(mark: 'O'))
continue = 1
until continue == 'no'
  game.play
  puts "Another game? 'no' to quit"
  continue = gets.chomp
end
