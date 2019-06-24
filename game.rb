class Game
  def initialize(title:, width:, height:, background:)
    @title = title
    @width = width
    @height = height
    @background = background
  end

  def paint
    Window::set background: @background, width: @width, height: @height, title: @title
  end

  def start
    paint
    Character::place_rifleman(0, 0)
    topbar = Topbar::new width: @width
    topbar.paint
    Window::show
  end
end
