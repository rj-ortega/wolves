class Wolf < Sprite
  attr_accessor :health
end
class Rifleman < Sprite
  attr_accessor :health
end
class Archer < Sprite
  attr_accessor :health
end

class Character
  def new_character(sprite_path, clip_width: 30, width: 80, height: 80, time: 100, x: 0, y: 0)
    Sprite.new(
      sprite_path,
      clip_width: clip_width,
      width: width,
      height: height,
      time: time,
      loop: true,
      x: x,
      y: y,
    )
  end

  def self.place_wolf(y)
    wolf = Wolf.new(
      "./assets/sprites/wolf.png",
      clip_width: 30,
      width: 80,
      height: 80,
      time: 100,
      loop: true,
      x: 930,
      y: y + 20,
    )
    wolf.health = 500
    wolf.play
    wolf
  end

  def self.place_rifleman(y)
    rifleman = Rifleman.new(
      "./assets/sprites/rifleman_old.png",
      clip_width: 22,
      width: 60,
      height: 60,
      time: 150,
      loop: true,
      x: 18,
      y: y + 35,
    )
    archer.health = 200
    rifleman.play
    rifleman
  end

  def self.place_archer(y)
    archer = Archer.new(
      "./assets/sprites/archer.png",
      clip_width: 32,
      width: 80,
      height: 80,
      time: 150,
      loop: true,
      x: 10,
      y: y + 20,
    )
    archer.health = 100
    archer.play
    archer
  end

  def play
    @player.play
  end
end
