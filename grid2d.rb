class Grid2D
attr_accessor :grid

  def initialize(_ysize,_xsize,def_cell_content)
    @grid = Array.new(_ysize) {Array.new(_xsize,def_cell_content)}
    @ysize = _ysize
    @xsize = _xsize
  end

  def Set(y,x,value)
    @grid[y][x] = value
    self
  end

  def Get(y,x)
    @grid[y][x]
  end

  def Reset(value)
    @grid.each_with_index do |v1,y|
      v1.each_with_index do |v2,x|
        @grid[y][x] = value
      end
    end
  end

end
