
class Character
  def initialize(sprite_path, clip_width: 30, width: 80, height: 80, time: 100, x: 0, y: 0)
    @player = Sprite.new(
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

  def play
    @player.play
  end
end
