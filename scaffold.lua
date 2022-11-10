Scaffold = Entity:new()

function Scaffold:draw_scaffold()
  scaffold_sprite = love.graphics.newImage("images/single-scaffold.png")
  for i = 1, (self:CONSTANTS().MAX_X / (self:CONSTANTS().MOVEMENT * 2)) - 1 do
    love.graphics.draw(scaffold_sprite, i * self:CONSTANTS().MOVEMENT * 2, 3 * self:CONSTANTS().MOVEMENT, 0, 2, 2)
  end
end
