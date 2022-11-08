require("entity")

Alien = Entity:new()

function Alien:load_images()
  print("Loading Alien")
  frames = {}
  table.insert(frames, love.graphics.newImage("images/bug-1a.png"))
  table.insert(frames, love.graphics.newImage("images/bug-1b.png"))
  current_frame = 1
end

function Alien:draw_bug(bug)
  love.graphics.draw(frames[current_frame], self.x, self.y, 0, 2, 2)
end

function Alien:move_bug(direction)
  if direction == "left" then
    if self.x == self:CONSTANTS().MIN_X then return end
    self.x = self.x - self:CONSTANTS().MOVEMENT
  elseif direction == "right" then
    if self.x == self:CONSTANTS().MAX_X then return end
    self.x = self.x + self:CONSTANTS().MOVEMENT
  end

  current_frame = current_frame + 1
  if current_frame == 3 then
    current_frame = 1
  end
end
