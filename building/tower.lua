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
  self.moving = false

  for i = 1, LEVEL_HEIGHT do
    table.insert(self.floors, Floor:new())
  end

  for i = 1, #self.floors do
    self.floors[i]:load(i)
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

function Tower:update()
  for i = 1, #self.floors do
    self.floors[i]:update_floor()
  end
end

function Tower:move_player_up()
  if self:can_climb() then
    for i = 1, #self.floors do
      self.floors[i]:scroll_floor()
    end

    return true
  end

  return false
end

function Tower:can_climb()
  for i = 1, #self.floors do
    for index, data in pairs(self.floors[i]) do
      for key, value in pairs(self.floors[i][index]) do
        if self:player_alignment_to_climb(value) then
          return true
        end
      end
    end
  end

  return false
end

function Tower:player_alignment_to_climb(value)
  if value.x == player.x and value.y == player.y - 80 and value.climbable then
    return true
  end

  return false
end
