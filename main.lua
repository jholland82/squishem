require("alien")
require("falling_object")

function checkMovement()
  if love.keyboard.isDown("right") then
    x = x + 1
    for i=1, #aliens do
      aliens[i]:move_bug("right")
    end
  elseif love.keyboard.isDown("left") then
    x = x - 1
    for i=1, #aliens do
      aliens[i]:move_bug("left")
    end
  elseif love.keyboard.isDown("up") then
    y = y - 1
  elseif love.keyboard.isDown("down") then
    y = y + 1
  elseif love.keyboard.isDown("q") then
    love.event.quit()
  end
end

function recalculate_entites()

end

function love.load()
  aliens = {}
  x = 0
  y = 0
  table.insert(aliens, Alien:new())
  for i=1, #aliens do
    aliens[i]:load_images()
  end

  fo = FallingObject:new()
  bug_1 = love.graphics.newImage("images/bug-1.png")
end

function love.update()
  checkMovement()
  --recalculate_entities()
end

function love.draw()
  for i=1, #aliens do
    aliens[i]:draw_bug(bug_1)
  end
  --love.graphics.print("Bug Location: "..a:get_x(), 660, 20)
end
