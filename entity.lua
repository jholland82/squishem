Entity = {
  x = 64,
  y = 32,
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
    MOVEMENT = 32,
    MOVE_PER_TICK = 2,
    ANIMATION_DELAY = 32,
    MIN_X = 64,
    MIN_Y = 0,
    MAX_X = 672,
    MAX_Y = 480
  }
end
