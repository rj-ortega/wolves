class Game
  def initialize(background:)
    @background = background
  end

  def paint
    Window::set background: @background
  end

  def start
    paint
    Character::place_rifleman(0, 0)
    Window::show
  end
end
