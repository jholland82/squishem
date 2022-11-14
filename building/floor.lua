require("building/scaffold")

Floor = {}

function Floor:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Floor:load(row)
  self.tiles = {}
  for i = 1, 8 do
    table.insert(self.tiles, Scaffold:new())
  end

  self:load_tiles(row)
end

function Floor:load_tiles(row)
  for i = 1, #self.tiles do
    self.tiles[i]:random_tile(i, row)
  end
end

function Floor:draw_tiles(y)
  for i = 1, #self.tiles do
    self.tiles[i]:draw()
  end
end

function Floor:scroll_floor()
  for i = 1, #self.tiles do
    self.tiles[i]:move("up")
    self.tiles[i]:scroll()
  end
end

function Floor:update_floor()
  for i = 1, #self.tiles do
    self.tiles[i]:scroll()
  end
end
