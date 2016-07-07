class TicTacToe

  def initialize
  	# 1. Welcome message
  	puts "\n"
  	puts "Welcome to Tic Tac Toe!!!"

    # 2. create the players
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    puts "\nPlayer 1 is X's and Player 2 is O's."

    # 3. create the board
    @board = Board.new()

    # 3. Start the game!
    self.play()
  end

  #def play(player1, player2, board)
  def play()
  	winner = false
  	while not winner
	  # player 1 moves
	  @board.show()
	  location = @player1.play()
	  @board.changeLocation(location, @player1.marker)

	  # did he win?
	  winner = @board.checkWinner(@player1.marker)
	  break if winner

	  # player 2 plays
	  @board.show()
	  location = @player2.play()
	  @board.changeLocation(location, @player2.marker)

	  # did he win?
	  winner = @board.checkWinner(@player2.marker)

	end
  @board.show()
  puts "Player #{winner} won the game!"
  end

  class Player
  
    def initialize(marker)
      @marker = marker
    end

    def marker()
      @marker
    end
  
    def play()
  	  puts "Player #{@marker}, where would you like to move?"
  	  location = gets.chomp()
  	  return location.to_i
    end
  end

  class Board

    def initialize()
  	  @board = []
  	  (1..9).each{|x| @board << x}
    end

    def changeLocation(location, marker)
      @board[location-1] = marker
    end

    def show()
      puts "\n"
  	  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  	  puts ' ----------'
  	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  	  puts ' ----------'
  	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  	  puts "\n"
  	end

    def checkWinner(marker)

      winner = false

      winning_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
      					[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

      winning_combos.each do |arr|
        if @board[arr[0]] == marker && @board[arr[1]] == marker && @board[arr[2]] == marker
          winner = marker
        end 
      end

      return winner
    end
  end
end


ttt = TicTacToe.new()

