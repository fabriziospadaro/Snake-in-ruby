require_relative 'game_variable.rb'
require 'colorize'

def draw_graphic
  #draw ui
  puts ""
  puts "        Score: #{$score} ".yellow
  #draw grid
  $field.grid.map do |cell|
      p cell.join(' ')
      $stdout.flush
  end
  override_screen($fieldSize.y)
end

def override_screen(lines_to_override)
  (lines_to_override + 2).times do
    print "\e[1F"
    print "\e[1K"
  end
end
