require './colorize_code_pegs.rb'

module CodePegs
  VALUES = ["blue", "green", "orange", "violet", "red", "yellow"]

  def self.options_msg
    ColorizeCodePegs.color("CODE PEGS: #{VALUES.join(" ")}")
  end
end