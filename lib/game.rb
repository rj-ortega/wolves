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
    @title_text = nil
    @controls = nil
    @started = false
  end

  def paint
    Window::set background: @background, width: @width, height: @height, title: @title
  end

  def intro
    @board = Board::new width: @width, height: @topbar_height
    handle_input
    Window::set background: 'teal', width: @width, height: @height, title: @title
    displayTitle
    displayControls
    Window::show
  end

  def handle_input
    Window::on :key_down do |event|
      case event.key
      when "up"
        if @started
          @board.handle_up
        end
      when "down"
        if @started
          @board.handle_down
        end
      when "a"
        if @started
          @board.place_character("archer")
        end
      when "r"
        if @started
          @board.place_character("rifleman")
        end
      when "d"
        if @started
          @board.remove_character
        end
      when "space"
        if !@started
          @started = true
          start
        end
      end
    end
  end

  def start
    @title_text.remove
    @controls.remove
    paint
    @topbar = Topbar::new width: @width, height: @topbar_height
    @topbar.paint
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
    if @wolves[random_position] == nil
      @wolves[random_position] = []
    end
    @wolves[random_position] << Character::place_wolf(board.line_height + (board.row_height * random_position))
  end

  def update(board)
    spawn_time = Time.now
    money_time = Time.now
    move_time = Time.now
    Window::update do
      board.characters.each_with_index do |character, index|
        if character != nil && @wolves[index] != nil && @wolves[index][0] != nil
          character.shoot(@wolves[index][0])
        end
      end
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
    @wolves.each do |row|
      if row != nil
        row.each_with_index do |wolf, index|
          if wolf.health <= 0
            wolf.remove
            row.delete_at(index)
          end
          wolf.x = wolf.x - 3
        end
      end
    end
  end
  def displayTitle
    @title_text= Text.new(
      @title,
      x: 400, y: 200,
      font: "./assets/fonts/shojumaru.ttf",
      size: 50,
      color: "black",
      z: 30,
    )
  end
  def displayControls
    @controls = Text.new(
      '(hit SPACE to start)',
      x: 385, y: 300,
      font: "./assets/fonts/shojumaru.ttf",
      size: 20,
      color: "black",
      z: 30,
    )
  end
end
