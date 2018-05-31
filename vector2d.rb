class Vector2D
  attr_accessor :x,:y

  def initialize(_x=0, _y=0)
    @x = _x
    @y = _y
  end

  def Set(_x, _y)
    @x = _x
    @y = _y
  end

  def Constrain_0x(lim_x,lim_y)
    if(@x >= lim_x)
      @x = lim_x
    elsif(@x < 0)
      @x = 0
    end
    if(@y >= lim_y)
      @y = lim_y
    elsif(@y < 0)
      @y = 0
    end
  end

  def ==(b)
   (@x == b.x && @y == b.y)
  end

  def -(b)
    return Vector2D.new(@x - b.x,@y - b.y)
  end

   def +(b)
    return Vector2D.new(@x + b.x,@y + b.y)
  end

  def self.zero
    return Vector2D.new(0,0)
  end

end
