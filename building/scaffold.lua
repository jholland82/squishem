Scaffold = Entity:new()

function Scaffold:load(val)
  print("loading", val)
end

function Scaffold:draw(x, y)
  love.graphics.draw(self.sprite, x, y, 0, 2, 2)
end

function Scaffold:random_tile()
  local random = self:random()
  print("Random: ", random)
  if random == 0 then
    self.type = 0
    self.sprite = love.graphics.newImage("images/single-scaffold.png")
  else
    self.type = 1
    self.sprite = love.graphics.newImage("images/multi-scaffold.png")
  end
end

function Scaffold:random()
  return math.floor(math.random(0, 1))
end
