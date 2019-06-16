require "ruby2d"
require_relative "./character.rb"

set background: "olive"

wolf = Character.new("./sprites/wolf.png",
                     clip_width: 30,
                     x: 100)
archer = Character.new("./sprites/wolf.png",
                       clip_width: 32,
                       time: 200,
                       x: 50)
rifleman = Character.new("./sprites/rifleman_old.png",
                         clip_width: 22)

archer.play
rifleman.play
wolf.play

show
