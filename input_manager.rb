require_relative 'gameplay.rb'
require 'io/console'

def get_inputs
  #read input without waiting for it
  system("stty raw -echo")
  c = STDIN.read_nonblock(1) rescue ""
  system("stty -raw echo")
  return c
end

#convert the input in a cardinal char
def input_handler(input)
  case input
    when "w"
      update_direction("N")
    when "s"
      update_direction("S")
    when "a"
      update_direction("O")
    when "d"
      update_direction("W")
  end
end
