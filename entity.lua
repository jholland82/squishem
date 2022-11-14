Entity = {
  x = 80,
  y = 160,
  moving = false,
  level = 0,
  movement_type = "straight"
}

function Entity:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Entity:get_x()
  return self.x
end

function Entity:get_y()
  return self.y
end

function Entity:move(dir)
  -- Only accept new movement if we aren't currently moving
  if self.moving == false then
    block_player_movement = true
    -- Flip the moving bit and set the direction
    self.moving = true
    self.direction = dir
    if self.direction == "up" then
      self.climbing = true
    end
  end
end

function Entity:draw()
  if self.climbing == true then
    love.graphics.draw(self.climbing_frames[self.current_frame], self.x, self.y, 0, 2, 2)
  else
    love.graphics.draw(self.moving_frames[self.current_frame], self.x, self.y, 0, 2, 2)
  end
end

function Entity:update_current_frame(frames)
  -- Update the bug's movement
  self.current_movement = self.current_movement + self:CONSTANTS().MOVE_PER_TICK

  if self.current_movement % self:CONSTANTS().ANIMATION_DELAY == 0 then
    self.current_frame = self.current_frame + 1
    if self.current_frame == frames + 1 then
      self.current_frame = 1
    end
  end
end

-- Reset movement values for direction and animation checks
function Entity:reset_movement()
  self.current_movement = 0
  self.direction = nil
  self.moving = false
  self.climbing = false
  block_player_movement = false
end

function Entity:flip_direction()
  if self.direction == "right" then
    return "left"
  else
    return "right"
  end
end

function Entity:hit_min_max()
  if self.x == self:CONSTANTS().MIN_X or
    self.x == self:CONSTANTS().MAX_X - self:CONSTANTS().MOVEMENT * 2 then
    self.direction = self:flip_direction()
  end
end

function Entity:CONSTANTS()
  return {
    MOVEMENT = 40,
    MOVE_PER_TICK = 1,
    ANIMATION_DELAY = 10,
    MIN_X = 80,
    MIN_Y = 0,
    MAX_X = 720,
    MAX_Y = 520
  }
end
