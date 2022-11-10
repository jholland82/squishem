Entity = {
  x = 80,
  y = 40,
  moving = false,
  level = 0
}

function Entity:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Entity:get_x()
  return self.x
end

function Entity:get_y()
  return self.y
end

function Entity:CONSTANTS()
  return {
    MOVEMENT = 40,
    MOVE_PER_TICK = 1,
    ANIMATION_DELAY = 16,
    MIN_X = 80,
    MIN_Y = 0,
    MAX_X = 720,
    MAX_Y = 520
  }
end
