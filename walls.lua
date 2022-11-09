Wall = Entity:new(x, y)
WALL_HEIGHT = 20

function Wall:load_walls()
  walls = {}
  for i=1, WALL_HEIGHT * 4 do
    table.insert(walls, Wall:new())
  end

  return walls
end

function Wall:draw_wall(index)
  if index / WALL_HEIGHT < 1 then
    x = 0
    y = index
  elseif index / WALL_HEIGHT < 2 then
    x = 1
    y = index - WALL_HEIGHT
  elseif index / WALL_HEIGHT < 3 then
    x = 23
    y = index - WALL_HEIGHT * 2
  elseif index / WALL_HEIGHT < 4 then
    x = 24
    y = index - WALL_HEIGHT * 3
  end

  wall_sprite = love.graphics.newImage("images/wall.png")
  love.graphics.draw(wall_sprite, x * self:CONSTANTS().MOVEMENT, y * self:CONSTANTS().MOVEMENT)
end
