require_relative 'game_variable.rb'
require 'pry'

def move_player()
  #re-write all the array with the field character
  $field.Reset($field_char)
  #update snake position based on direction
  $snake.move()
  #constrain just the head on the field
  $snake.body_part[0].position.Constrain_1x($fieldSize.x-1, $fieldSize.y-1)
  #set the food char, in the field on the food position
  $field.Set($food_pos, $food_char)
  #set the snake char, for each part of the snake
  $snake.body_part.each { |part| $field.Set(part.position, $player_char) }
end

def update_direction(_direction)
  $snake.set_direction(_direction)
end

