class Grid2D
attr_accessor :grid

  def initialize(_ysize,_xsize,def_cell_content)
    @grid = Array.new(_ysize) {Array.new(_xsize,def_cell_content)}
    @ysize = _ysize
    @xsize = _xsize
  end

  def Set(vector,value)
    @grid[vector.y][vector.x] = value
  end

  def Reset(value)
    @grid.each_with_index do |v1,y|
      v1.each_index do |x|
        if(x==0||x==@xsize-1)
          @grid[y][x] = "|"
        elsif(y==0||y==@ysize-1)
          @grid[y][x] = "-"
        else
          @grid[y][x] = " "
        end

      end
    end
  end

end
