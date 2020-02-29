require './player.rb'
require './code_pegs.rb'

class Codemaker < Player
  attr_reader :player, :code

  def initialize(player)
    super(player)
    @code = get_code
  end

  def hint(guess)
    black = [] # Code peg that is correct in both color and position
    white = [] # Code peg that is correct in color placed in wrong position
    
    code_arr = @code.split
    guess_arr = guess.split

    # Determine all blacks
    4.times do |i|
      if guess_arr[i] == code_arr[i]
        black.push(guess_arr[i])
        guess_arr[i] = nil
      end
    end

    # Determine all whites
    4.times do |i|
      if guess_arr.include?(code_arr[i])
        white.push(guess_arr[guess_arr.index(code_arr[i])])
        guess_arr[guess_arr.index(code_arr[i])] = nil
      end
    end

    "Black #{black.length} White #{white.length}"
  end

  private

  def get_code
    if @player == "human"
      input_code_pegs("Type in 4 CODE PEGS seperated by space", "code")
    elsif @player == "computer"
      get_random_code_pegs
    end
  end
end