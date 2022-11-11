require("building/floor")
require("building/walls")

Tower = {}

function Tower:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Tower:load()
  self.walls = Wall:new()
  self.floors = {}
  for i = 1, 8 do
    table.insert(self.floors, Floor:new())
  end

  for i = 1, #self.floors do
    self.floors[i]:load()
  end
end

function Tower:update()

end

function Tower:draw()
  self.walls:draw_walls()
  for i = 1, #self.floors do
    self.floors[i]:draw_tiles(i)
  end
end
