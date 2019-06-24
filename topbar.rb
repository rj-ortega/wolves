class Topbar
  def initialize(width: 100, money: 0, score: 0)
    @width = width
    @money = money
    @score = score
  end

  def paint
    Rectangle.new(
      x: 0, y: 0,
      width: @width, height: 100,
      color: "teal",
      z: 20,
    )
  end
end
