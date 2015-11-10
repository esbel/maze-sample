module Coordinates
  N, S, E, W = 1, 2, 4, 8
  DIRECTIONS = [ N, S, E, W ]
  DX         = { E => 1, W => -1, N =>  0, S => 0 }
  DY         = { E => 0, W =>  0, N => -1, S => 1 }
  OPPOSITE   = { E => W, W =>  E, N =>  S, S => N }
end
