class Game
  def initialize(title:, width:, height:, background:, money: 100, score: 0)
    @title = title
    @width = width
    @height = height
    @background = background
    @money = money
    @score = score
    @topbar_height = 108
    @wolves = []
    @last_placed_wolf = nil
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
    update(@board)
    Window::show
  end

  def update_money_score
    @topbar.display_money_score(@score, @money)
    @score += 50
    @money += 20
  end

  def spawn_wolf(board)
    random_position = rand(board.lines + 1)
    while random_position == @last_placed_wolf
      random_position = rand(board.lines + 1)
    end
    @last_placed_wolf = random_position
    @wolves << Character::place_wolf(board.line_height + (board.row_height * random_position))
  end

  def update(board)
    spawn_time = Time.now
    money_time = Time.now
    move_time = Time.now
    Window::update do
      if Time.now - move_time > 0.1
        move_time = Time.now
        move_wolves
      end
      if Time.now - money_time > 2
        money_time = Time.now
        update_money_score
      end
      if Time.now - spawn_time > 3
        spawn_time = Time.now
        spawn_wolf(board)
      end
    end
  end

  def move_wolves
    @wolves.each do |wolf|
      wolf.x = wolf.x - 3
      puts wolf.health
    end
  end
end
