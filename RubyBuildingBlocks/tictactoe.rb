class TicTacToe

  def initialize
    @places = {
    "a1"=>" ", "a2"=>" ", "a3"=>" ",
    "b1"=>" ", "b2"=>" ", "b3"=>" ",
    "c1"=>" ", "c2"=>" ", "c3"=>" "
    }

    @columns = [
      ['a1','a2','a3'],
      ['b1','b2','b3'],
      ['c1','c2','c3'],
      ['a1','b1','c1'],
      ['a2','b2','c2'],
      ['a3','b3','c3'],
      ['a1','b2','c3'],
      ['c1','b2','a3']
    ]

    @cpu = rand() > 0.5 ? 'X' : 'O'
    @user = @cpu == 'X' ? 'O' : 'X'

    @cpu_name = 'Ruby'
    put_line
    puts "RUBY TIC TAC TOE"
    puts "What is your name?"
    STDOUT.flush
    @user_name = gets.chomp
    put_bar

    if (@user == 'X')
      user_turn
    else
      cpu_turn
    end
  end

  def put_line
    puts "____________________________________"
  end

  def put_bar
    puts "#####################################}"
    puts "#####################################}"
  end

  def draw_game
    puts ""
    puts "#{@cpu_name}: #{@cpu}"
    puts "#{@user_name}: #{@user}"
    puts ""
    puts "  a b c"
    puts ""
    puts " 1 #{@places["a1"]}|#{@places["b1"]}|#{@places["c1"]}"
    puts "   -----"
    puts " 2 #{@places["a2"]}|#{@places["b2"]}|#{@places["c2"]}"
    puts "   -----"
    puts " 3 #{@places["a3"]}|#{@places["b3"]}|#{@places["c3"]}"
  end

end

board = TicTacToe.new

board.draw_game