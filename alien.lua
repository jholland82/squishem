require("entity")

Alien = Entity:new(x, y)

function Alien:load_images()
  print("Loading Alien")
  frames = {}
  table.insert(frames, love.graphics.newImage("images/bug-1a.png"))
  table.insert(frames, love.graphics.newImage("images/bug-1b.png"))
  current_frame = 1
  current_movement = 0
  moving = false
  direction = nil
end

function Alien:draw_bug(bug)
  love.graphics.draw(frames[current_frame], self.x, self.y, 0, 2, 2)
end

function Alien:move_bug(dir)
  moving = moving and false or true
  direction = dir
end

function Alien:update_bug()
  -- Don't update bugs if they have no direction set
  if direction == nil then
    return
  end

  -- Move based on the direction of the bug
  if direction == "left" then
    if self.x == self:CONSTANTS().MIN_X then return end
    self.x = self.x - self:CONSTANTS().MOVE_PER_TICK
  elseif direction == "right" then
    if self.x == self:CONSTANTS().MAX_X - (self:CONSTANTS().MOVEMENT * 2) then return end
    self.x = self.x + self:CONSTANTS().MOVE_PER_TICK
  elseif direction == "up" then
    if self.y == self:CONSTANTS().MAX_Y then return end
    self.y = self.y + self:CONSTANTS().MOVE_PER_TICK
  end

  -- Update the bug's movement
  current_movement = current_movement + self:CONSTANTS().MOVE_PER_TICK

  if current_movement % self:CONSTANTS().ANIMATION_DELAY == 0 then
    current_frame = current_frame + 1
    if current_frame == 3 then
      current_frame = 1
    end
  end

  -- If the current movement matches our constant value reset the bug
  if current_movement % self:CONSTANTS().MOVEMENT == 0 then
    self:reset_movement()
  end
end

-- Reset movement values for direction and animation checks
function Alien:reset_movement()
  current_movement = 0
  direction = nil
  moving = false
end
