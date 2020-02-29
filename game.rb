require './codemaker.rb'
require './codebreaker.rb'
require './code_pegs.rb'
require './colorize_code_pegs.rb'

LINE_WIDTH = 100

class Game
  attr_accessor :turns_left, :codebreaker_wins
  attr_reader :code

  def initialize
    initialize_role
    @code = @codemaker.code
    @turns_left = 12
    play
  end

  def play
    while !no_turns_left? && !@codebreaker_wins
      puts "Turns left: #{Rainbow(@turns_left).red}".center(LINE_WIDTH)
      guess = @codebreaker.get_guess
      puts turn_result_msg(guess, @codemaker.hint(guess))
      calculate_answer(guess)
      @turns_left -= 1
      puts "\n"
    end
    puts game_result_msg.center(LINE_WIDTH)
  end

  private

  def initialize_role
    human_role = nil
    until human_role == '1' || human_role == '2'
      begin
        puts "Do you want to be a codemaker(1) or a codebreaker(2)"
        human_role = gets.chomp
        puts "\n"
      rescue Interrupt
        puts "\nExiting..."
        exit
      end
    end
    if human_role == '1'
      @codemaker = Codemaker.new("human")
      @codebreaker = Codebreaker.new("computer")
    elsif human_role == '2'
      @codemaker = Codemaker.new("computer")
      @codebreaker = Codebreaker.new("human")
    end
  end

  def no_turns_left?
    @turns_left <= 0
  end

  def turn_result_msg(guess, hint)
    "GUESS: #{ColorizeCodePegs.color(guess)} | HINT: #{hint}"
  end

  def calculate_answer(guess)
    @codebreaker_wins = guess == @code
  end

  def game_result_msg
    if @codebreaker_wins
      "Codebreaker guessed the code, Codebreaker wins!"
    else
      "No turns left, Codemaker wins! | Code: #{ColorizeCodePegs.color(@code)}"
    end
  end
end