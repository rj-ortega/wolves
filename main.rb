require "ruby2d"
require_relative "./character.rb"
require_relative "./game.rb"

BACKGROUND = "olive"

game = Game.new(background: BACKGROUND)
game.start
