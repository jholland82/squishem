-- Aliens are the primary enemies of the game.  There are 16 different enemy types as
-- the user progresses through the levels.  As the enemy level increases they spawn as
-- ghosts faster.  Enemies also become "smarter" as the player progresses
--
-- movement_type -- How the alien moves in relation to the character
--   straight = moves across the building to the edge and returns
--   random = moves for a block and then randomly chooses to go left or right
--   follow = tries to stay directly above the enemy
--   hover = stays near the enemy and closest pole the enemy can climb
require("entity")

Alien = Entity:new(x, y)

function Alien:set_direction(dir)
  self.direction = dir
end

function Alien:load_images()
  self.moving_frames = {}
  table.insert(self.moving_frames, love.graphics.newImage("images/bug-1a.png"))
  table.insert(self.moving_frames, love.graphics.newImage("images/bug-1c.png"))
  table.insert(self.moving_frames, love.graphics.newImage("images/bug-1b.png"))
  table.insert(self.moving_frames, love.graphics.newImage("images/bug-1c.png"))
  self.current_frame = 1
  self.current_movement = 0
  self.moving = false
  self.direction = nil
  self.movement_type = "straight"
end

function Alien:scroll()
  self.scroll_alien = true
  self.current_movement = 0
  self.z = 0
end


function Alien:update_alien(tick_modifier)
  self.pace = self:CONSTANTS().MOVE_PER_TICK * tick_modifier

  -- Move based on the direction of the bug
  if self.direction == "left" then
    if self.x == self:CONSTANTS().MIN_X then return end
    self.x = self.x - self.pace
  elseif self.direction == "right" then
    if self.x == self:CONSTANTS().MAX_X - (self:CONSTANTS().MOVEMENT * 2) then return end
    self.x = self.x + self.pace
  end

  if self.scroll_alien == true then
    if self.scroll_alien == true then
      self.y = self.y + self.pace * 2
    end
  end

  self:hit_min_max()

  self:update_current_frame(#self.moving_frames)

  -- If the current movement matches our constant value reset the bug
  if self.current_movement % (self:CONSTANTS().MOVEMENT * 2) == 0 then
    self:reset_movement()
  end
end

function Alien:reset_movement()
  self.current_movement = 0
  self.scroll_alien = false
end
