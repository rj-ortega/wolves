
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

  def self.place_wolf(x, y)
    wolf = Sprite.new(
      "./sprites/wolf.png",
      clip_width: 30,
      width: 80,
      height: 80,
      time: 100,
      loop: true,
      x: x,
      y: y,
    )
    wolf.play
  end

  def self.place_rifleman(x, y)
    rifleman = Sprite.new(
      "./sprites/rifleman_old.png",
      clip_width: 22,
      width: 80,
      height: 80,
      time: 150,
      loop: true,
      x: x,
      y: y,
    )
    rifleman.play
  end

  def self.place_archer(x, y)
    archer = Sprite.new(
      "./sprites/archer.png",
      clip_width: 32,
      width: 80,
      height: 80,
      time: 150,
      loop: true,
      x: x,
      y: y,
    )
    archer.play
  end

  def play
    @player.play
  end
end
