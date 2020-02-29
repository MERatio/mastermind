require './player.rb'
require './code_pegs.rb'

class Codebreaker < Player
  attr_reader :player
  def initialize(player)
    super
  end

  def get_guess
    if @player == "human"
      input_code_pegs("Type in 4 CODE PEGS seperated by space", "guess")
    elsif @player == "computer"
      get_random_code_pegs
    end
  end
end