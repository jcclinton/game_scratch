function love.conf(t)
	t.title = "test"
	t.version = "0.0.1"

	t.console = true
end

function love.load()
  num = 50
  length = 10
  tiles = buildTiles()
end

function love.draw()
  for y,outer in ipairs(tiles) do
    for x,tile in ipairs(outer) do
      tile:draw()
    end
  end
end

function buildTiles()
  local myarray = {}
  for f=1, num do
      myarray[f] = {}
      for g=1, num do
          myarray[f][g] = Tile.create(g, f)
      end
  end
  return myarray
end

Tile = {}
Tile.__index = Tile
function Tile.create(x, y)
  local tile = {}
  setmetatable(tile, Tile)
  tile.x = x
  tile.y = y
  return tile
end

function Tile:setPos(x, y)
  self.x = x
  self.y = y
end

function Tile:draw()
    --print("tiles: ", dump(tiles))
    print("x: ", self.x, ", y: ", self.y)
    --love.graphics.print("Hello World!", self.x, self.y)
    --love.graphics.print("Hello World!", 400, 300+self.y)
    local cap = 255
    local gap = 9

    local x = self.x * length
    if x > cap then x = x % cap end
    local y = self.y * length
    if y > cap then y = y % cap end
    print("x: ", x, ", y: ", y)
    love.graphics.setColor(x, y, 100, cap)
    love.graphics.rectangle("fill", x, y, length-gap, length-gap)
end







function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
