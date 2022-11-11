require("building/scaffold")

Floor = {}

function Floor:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Floor:load()
  self.tiles = {}
  for i = 1, 8 do
    table.insert(self.tiles, Scaffold:new())
  end

  self:load_tiles()
end

function Floor:load_tiles()
  for i = 1, #self.tiles do
    self.tiles[i]:random_tile()
  end
end

function Floor:draw_tiles(y)
  for i = 1, #self.tiles do
    self.tiles[i]:draw(i * 80, y * 80)
  end
end
