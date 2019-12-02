class Board
  attr_reader :lines, :row_height, :line_height, :characters

  def initialize(width:, height:)
    @row_width = width
    @row_height = height
    @line_height = 110
    @current_position = 0
    @lines = 5
    @box = []
    @characters = []
  end
  def paint
    self.handle_input
    self.draw_lines
    self.draw_box
  end
  def handle_input
    Window::on :key_down do |event|
      case event.key
      when "up"
        @current_position -= 1
        if @current_position < 0
          @current_position = 0
        end
        self.draw_box
      when "down"
        @current_position += 1
        if @current_position > @lines
          @current_position = @lines
        end
        self.draw_box
      when "a"
        self.place_character("archer")
      when "r"
        self.place_character("rifleman")
      when "d"
        self.remove_character
      else
        puts event.key
      end
    end
  end
  def place_character(character)
    self.remove_character
    # TODO: check for funds and remove cost
    if character == "archer"
      @characters[@current_position] = Character::place_archer(@line_height + (@row_height * @current_position))
    elsif character == "rifleman"
      @characters[@current_position] = Character::place_rifleman(@line_height + (@row_height * @current_position))
    end
  end
  def remove_character
    current_character = @characters[@current_position]
    if current_character
      current_character.remove
      # TODO: return money
    end
  end
  def draw_lines
    i = 1
    while i <= @lines
      displacement = @row_height + (@line_height * i)
      Line.new(
        x1: 0, y1: displacement,
        x2: 1024, y2: displacement,
        width: 1,
        color: 'silver',
        z: 1
      )
      i += 1
    end
  end
  def draw_box
    self.clear_box
    y = @row_height + (@line_height * @current_position)
    offset = 2
    @box[0] = Line.new(
      x1: offset, y1: y - offset,
      x2: offset, y2: y + @line_height - offset,
      width: 1,
      color: 'orange',
      z: 2
    )
    @box[1] = Line.new(
      x1: offset, y1: y + @line_height - offset,
      x2: @line_height - offset, y2: y + @line_height - offset,
      width: 1,
      color: 'orange',
      z: 2
    )
    @box[2] = Line.new(
      x1: @line_height - offset, y1: y - offset,
      x2: @line_height - offset, y2: y + @line_height - offset,
      width: 1,
      color: 'orange',
      z: 2
    )
    @box[3] = Line.new(
      x1: offset, y1: y + offset,
      x2: @line_height - offset, y2: y + offset,
      width: 1,
      color: 'orange',
      z: 2
    )
  end
  def clear_box
    for line in @box do
      line.remove
    end
  end
end