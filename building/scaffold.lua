Scaffold = Entity:new()

function Scaffold:load(x, y)
  self.current_movement = 0
  self.moving = false
  self.direction = nil
  self.climbing = false
  self.x = (x * self:CONSTANTS().MOVEMENT * 2)
  self.y = ((y - LEVEL_HEIGHT + 7) * self:CONSTANTS().MOVEMENT * 2)
end

function Scaffold:draw(x, y)
  love.graphics.draw(self.sprite, self.x, self.y, 0, 2, 2)
end

function Scaffold:random_tile(x, y)
  local random = self:random()
  if random == 0 then
    self.type = 0
    self.sprite = love.graphics.newImage("images/single-scaffold.png")
    self.climbable = false
  else
    self.type = 1
    self.sprite = love.graphics.newImage("images/multi-scaffold.png")
    self.climbable = true
  end

  self:load(x, y)
end

function Scaffold:random()
  return math.floor(math.random(0, 1))
end

function Scaffold:scroll()
  -- Don't update bugs if they have no direction set
  if self.direction == nil then
    return
  end

  self.pace = self:CONSTANTS().MOVE_PER_TICK

  -- Move based on the direction of the bug
  if self.direction == "up" then
    self.y = self.y + self.pace
  end

  self.current_movement = self.current_movement + self:CONSTANTS().MOVE_PER_TICK

  -- If the current movement matches our constant value reset the bug
  if self.current_movement % (self:CONSTANTS().MOVEMENT * 2) == 0 then
    self:reset_movement()
  end
end
