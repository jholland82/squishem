Entity = { x = 0, y = 0, moving = false }

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
    MIN_X = 0,
    MAX_X = 768
  }
end
