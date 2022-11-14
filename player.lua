require("entity")

Player = Entity:new(x, y)

function Player:load_images()
  self.moving_frames = {}
  self.climbing_frames = {}
  table.insert(self.moving_frames, love.graphics.newImage("images/player-a.png"))
  table.insert(self.moving_frames, love.graphics.newImage("images/player-b.png"))
  table.insert(self.moving_frames, love.graphics.newImage("images/player-c.png"))
  table.insert(self.moving_frames, love.graphics.newImage("images/player-b.png"))
  table.insert(self.climbing_frames, love.graphics.newImage("images/climbing-a.png"))
  table.insert(self.climbing_frames, love.graphics.newImage("images/climbing-b.png"))
  table.insert(self.climbing_frames, love.graphics.newImage("images/climbing-c.png"))
  table.insert(self.climbing_frames, love.graphics.newImage("images/climbing-b.png"))
  self.y = self.y + self:CONSTANTS().MOVEMENT * 8
  self.current_frame = 1
  self.current_movement = 0
  self.moving = false
  self.direction = nil
  self.climbing = false
end

function Player:update_player(tick_modifier)
  -- Don't update bugs if they have no direction set
  if self.direction == nil then
    return
  end

  self.pace = self:CONSTANTS().MOVE_PER_TICK * tick_modifier

  -- Move based on the direction of the bug
  if self.direction == "left" then
    if self.x == self:CONSTANTS().MIN_X then return end
    self.x = self.x - self.pace
  elseif self.direction == "right" then
    if self.x == self:CONSTANTS().MAX_X - (self:CONSTANTS().MOVEMENT * 2) then return end
    self.x = self.x + self.pace
  end

  self:update_current_frame(#self.moving_frames)

  -- If the current movement matches our constant value reset the bug
  if self.current_movement % (self:CONSTANTS().MOVEMENT * 2) == 0 then
    self:reset_movement()
  end
end
