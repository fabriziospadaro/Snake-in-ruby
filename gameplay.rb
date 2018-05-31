require_relative 'game_variable.rb'
require 'pry'

def move_player()
  #re-write all the array with the field character
  $field.Reset($field_char)
  #update snake position based on direction
  $snake.move()
  #constrain just the head on the field
  $snake.body_part[0].position.Constrain_0x($fieldSize.x-1,$fieldSize.y-1)
  #set the food char, in the field on the food position
  $field.Set($food_pos.y,$food_pos.x,$food_char)
  #set the snake char, for each part of the snake
  $snake.body_part.each do |part|
    $field.Set(part.position.y,part.position.x,$player_char)
  end
end

def update_direction(_direction)
  $snake.set_direction(_direction)
end

