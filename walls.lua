Wall = Entity:new(x, y)
WALL_HEIGHT = 15

function Wall:draw_walls()
  wall_sprite = love.graphics.newImage("images/wall.png")
  x1 = 0
  x2 = 18

  for i=0, WALL_HEIGHT do
    love.graphics.draw(wall_sprite, x1 * self:CONSTANTS().MOVEMENT, i * self:CONSTANTS().MOVEMENT * 2, 0, 2, 2)
    love.graphics.draw(wall_sprite, x2 * self:CONSTANTS().MOVEMENT, i * self:CONSTANTS().MOVEMENT * 2, 0, 2, 2)
  end
end
