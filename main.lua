require("alien")
require("scaffold")
require("walls")
-- require("falling_object")

function checkMovement()
  if love.keyboard.isDown("right") then
    for i=1, #aliens do
      aliens[i]:move_bug("right")
    end
  elseif love.keyboard.isDown("left") then
    for i=1, #aliens do
      aliens[i]:move_bug("left")
    end
  elseif love.keyboard.isDown("up") then
    for i=1, #aliens do
      aliens[i]:move_bug("up")
    end
  elseif love.keyboard.isDown("down") then
    y = y + 1
  elseif love.keyboard.isDown("q") then
    love.event.quit()
  end
end

function recalculate_entites()

end

function love.load()
  print("Height: ", love.window.getMode())
  aliens = {}
  walls = Wall:new()
  scaffold = Scaffold:new()
  y = 0
  table.insert(aliens, Alien:new())
  for i=1, #aliens do
    aliens[i]:load_images()
  end

  bug_1 = love.graphics.newImage("images/bug-1.png")
end

function love.update()
  checkMovement()
  for i=1, #aliens do
    aliens[i]:update_bug()
  end
  --recalculate_entities()
end

function love.draw()
  for i=1, #aliens do
    aliens[i]:draw_bug(bug_1)
  end

  walls:draw_walls()
  scaffold:draw_scaffold()
end
