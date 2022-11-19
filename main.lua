require("alien")
require("player")
require("building/tower")
-- require("falling_object")

LEVEL_HEIGHT = 40

function checkMovement()
  if block_player_movement == false then
    if love.keyboard.isDown("right") then
      player:move("right")
    elseif love.keyboard.isDown("left") then
      player:move("left")
    elseif love.keyboard.isDown("up") then
      if tower:move_player_up() then
        for i=1, #aliens do
          aliens[i]:scroll()
        end
        player:move("up")
      end
    elseif love.keyboard.isDown("down") then
      y = y + 1
    elseif love.keyboard.isDown("q") then
      love.event.quit()
    end
  end
end

function love.load()
  aliens = {}
  player = Player:new()
  tower = Tower:new()
  block_player_movement = false

  tower:load()
  player:load_images()

  table.insert(aliens, Alien:new())

  for i=1, #aliens do
    aliens[i]:load_images()
    aliens[i]:set_direction("right")
  end
end

function love.update()
  checkMovement()
  tower:update()
  player:update_player(1)
  for i=1, #aliens do
    aliens[i]:update_alien(.5)
  end
end

function love.draw()
  tower:draw()
  player:draw()

  for i=1, #aliens do
    aliens[i]:draw()
  end
end
