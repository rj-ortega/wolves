class Game
  def initialize(title:, width:, height:, background:, money: 100, score: 0)
    @title = title
    @width = width
    @height = height
    @background = background
    @money = money
    @score = score
    @topbar_height = 108
  end

  def paint
    Window::set background: @background, width: @width, height: @height, title: @title
  end

  def start
    paint
    @topbar = Topbar::new width: @width, height: @topbar_height
    @topbar.paint
    @board = Board::new width: @width, height: @topbar_height
    @board.paint
    update_money_score
    Window::show
  end

  def update_money_score
    t = Time.now
    Window::update do
      if Time.now - t > 2
        @topbar.display_money_score(@score, @money)
        t = Time.now
        @score += 50
        @money += 20
      end
    end
  end
end
