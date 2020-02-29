# Mastermind

Game where you have to guess your opponent’s secret code within 12 turns or create the secret code, check it out on [Wikipedia](<https://en.wikipedia.org/wiki/Mastermind_(board_game)>).

## Gameplay and Rules

code pegs = 6 different colors
code = consist of 4 code pegs
guess = consist of 4 code pegs
key pegs/feedback = black or white
black = code peg that is correct in both color and position
white = code peg that is correct in color placed in wrong position

The codemaker creates the code (duplicates allowed) and the codebreaker must guess them withing 12 turns. The codemaker will give feedback on how good the guess was each turn

In this version you can be a codemaker or codebreaker and your opponent is a computer

## Installation

Install bundler

```bash
gem install bundler
```

And install gems

```bash
bundle install
```

## Usage

```bash
ruby mastermind.rb
```
