class Topbar
  def initialize(width: 100)
    @width = width
    @money = Text.new(
      "100",
      x: 50, y: 55,
      font: "./assets/fonts/roboto.ttf",
      size: 20,
      color: "black",
      z: 30,
    )
    @score = Text.new(
      "%09d" % 0,
      x: 870, y: 55,
      font: "./assets/fonts/roboto.ttf",
      size: 20,
      color: "black",
      z: 30,
    )
    @money_head = Text.new(
      "Money",
      x: 50, y: 20,
      font: "./assets/fonts/roboto.ttf",
      size: 20,
      color: "black",
      z: 30,
    )
    @score_head = Text.new(
      "Score",
      x: 920, y: 20,
      font: "./assets/fonts/roboto.ttf",
      size: 20,
      color: "black",
      z: 30,
    )
  end

  def paint
    Rectangle.new(
      x: 0, y: 0,
      width: @width, height: 100,
      color: "teal",
      z: 20,
    )
  end

  def display_money_score(score, money)
    @score.text = "%09d" % score
    @money.text = money
  end
end
