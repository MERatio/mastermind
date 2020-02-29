require './code_pegs.rb'

class Player
  def initialize(player)
    @player = player
  end
  
  def input_code_pegs(msg, type)
    guess = nil
    until correct_format?(guess)
      begin
        puts CodePegs.options_msg
        puts msg
        print "Input #{type}: " 
        guess = gets.chomp
      rescue Interrupt
        puts "\nExiting..."
        exit
      end
    end
    guess.split.join(" ")
  end

  private

  def get_random_code_pegs
    code_pegs = []
    4.times do
      code_pegs.push(CodePegs::VALUES.shuffle.first)
    end
    code_pegs.join(" ")
  end

  def correct_format?(guess)
    unless guess.instance_of? String
      return false
    end
    arr = guess.split
    return false if arr.length != 4
    arr.each do |code_peg|
      unless CodePegs::VALUES.include?(code_peg)
        return false
      end
    end 
    true
  end
end