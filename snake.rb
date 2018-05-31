require_relative 'vector2d'

class BodyPart
  attr_accessor :position

  def initialize(_child = nil, direction)
    @child = _child #body part
    @position = get_child_position - direction #vector pos
  end

  def set_position(_postion)
    @position = _postion
  end

  def get_child_position
    if(@child != nil)
      return @child.position
    else
      return Vector2D.zero
    end
  end
end

class Snake
  attr_accessor :body_part

  def initialize(start_pos,_direction)
    @direction = Vector2D.zero
    set_direction(_direction)

    @body_part = [BodyPart.new(@direction)]
    @body_part[0].set_position(start_pos)
  end

  def move()
    old_child_pos = []

    for i in 1..@body_part.size
      old_child_pos << @body_part[i].get_child_position if @body_part[i] != nil
    end

    @body_part[0].position += @direction

    for i in 1..@body_part.size
      @body_part[i].position = old_child_pos[i-1] if @body_part[i] != nil
    end

  end

  def set_direction(_direction)
    @direction = Vector2D.zero
    case _direction
      when "N"
        @direction.y = -1
      when "S"
        @direction.y = 1
      when "W"
        @direction.x = 1
      when "O"
        @direction.x = -1
    end
  end

  def grow()
    @body_part << BodyPart.new(@body_part.last,@direction)
  end

end
