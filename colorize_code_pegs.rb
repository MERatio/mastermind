require 'rainbow'

module ColorizeCodePegs
  COLORS = {
    blue: Rainbow("blue").blue,
    green: Rainbow("green").green,
    orange: Rainbow("orange").orange,
    violet: Rainbow("violet").violet,
    red: Rainbow("red").red,
    yellow: Rainbow("yellow").yellow
  }

  def self.color(text)
    text.split(" ").map { |word| COLORS[word.to_sym] || word }.join(" ")
  end
end