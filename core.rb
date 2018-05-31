require_relative 'graphic_renderer.rb'
require_relative 'input_manager.rb'
require_relative 'gameplay.rb'
require_relative 'events.rb'

#snake in 302 line of code
#
def game_core
  #frames counter for each job
  j1_frames = 10
  j2_frames = 10
  j3_frames = 10
  #duration of a "frame" in s
  multiplier = 10
  frame_duration = 0.005
  #loop untill end of the game
  while !$game_over
    if(j3_frames >= frame_duration * multiplier)
      input = get_inputs.downcase
      if(input == "e")
        system 'clear'
        return
      else
        input_handler(input)
      end
      j3_frames = 0
    end
    if(j1_frames >= frame_duration*multiplier)
      draw_graphic()
      j1_frames = 0
    end
    if(j2_frames >= frame_duration*(5-($score/80.01))*multiplier)
      move_player
      event_handler
      j2_frames = 0
    end
    j1_frames += frame_duration
    j2_frames += frame_duration
    j3_frames += frame_duration
    sleep frame_duration
  end
  #we get there only when the game is over
  system 'clear'
  puts "----Game Over----"
  puts "You scored: " + $score.to_s + " points"
  sleep 2
end

game_core()



