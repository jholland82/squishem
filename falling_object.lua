require("entity")

FallingObject = Entity:new()

function FallingObject:special_x()
  return self.x + 2
end
