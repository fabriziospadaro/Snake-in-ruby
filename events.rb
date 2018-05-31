require_relative 'game_variable'

def event_handler
  #check if we can eat the "food"
  if($snake.body_part[0].position == $food_pos)
    randomize_food_pos
    #grow the snake
    $snake.grow
    #add score
    $score += 10
  end
  #check if the head touches any body part, if so, game over
  for i in 1..$snake.body_part.size
    if $snake.body_part[i] != nil
        $game_over = true if $snake.body_part[i].position == $snake.body_part[0].position
    end
  end
end
