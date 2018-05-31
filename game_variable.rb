#$VERBOSE = nil
require_relative "vector2d"
require_relative "grid2d"
require_relative "snake"
require_relative "math"

def randomize_char
  chars = (0..9).to_a + ('A'..'Z').to_a
  $food_char = chars.sample
end

def randomize_food_pos
  randomize_char
  exit_loop = false
  while !exit_loop
    exit_loop = true
    $food_pos.Set(rand(0...$fieldSize.x),rand(0...$fieldSize.y))
    #check distance from the new food pos to each body part
    #if the distance from all the body part is > x than return the position
    if($snake != nil)
      $snake.body_part.each do |part|
        exit_loop = false if ManhattanDistance(part.position,$food_pos) < 4
      end
    end
  end

end

$score = 0

$field_char = "."
$food_char = "é"
$player_char = "@"

$game_over = false

$start_pos = Vector2D.new(5,5)
$food_pos = Vector2D.new()

$fieldSize = Vector2D.new(12,12)
$field = Grid2D.new($fieldSize.y,$fieldSize.x,$field_char)

randomize_food_pos

$snake = Snake.new($start_pos,"S")


