require "ruby2d"
require_relative "./character.rb"
require_relative "./game.rb"
require_relative "./topbar.rb"

module Wolves
  TITLE = "Wolves"
  WIDTH = 1024
  HEIGHT = 768
  BACKGROUND = "olive"

  class CLI
    def self.start
      game = Game::new(title: TITLE, width: WIDTH, height: HEIGHT, background: BACKGROUND)
      game.start
    end
  end

  class Error < StandardError; end
end
