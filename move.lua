local dirs = {
  u = function () return turtle.up() end,
  U = function ()
    while turtle.detectUp() do
      turtle.digUp()
    end
    turtle.up()
    return true
  end,
  d = function () return turtle.down() end,
  D = function ()
    while turtle.detectDown() do
      turtle.digDown()
    end
    turtle.down()
    return true
  end,
  f = function () return turtle.forward() end,
  F = function ()
    while turtle.detect() do
      turtle.dig()
    end
    return turtle.forward()
  end,
  b = function () return turtle.back() end,
  i = function () return turtle.dig() end,
  I = function ()
    while turtle.detect() do
      turtle.dig()
    end
    return true
  end,
  o = function () return turtle.digDown() end,
  p = function () return turtle.digUp() end,
  a = function () return turtle.place() end,
  l  = function () return (turtle.turnLeft() and turtle.forward()) end,
  r = function () return (turtle.turnRight() and turtle.forward()) end,
}

function go_dir(dir)
  dirs[dir]()
end

arg = { ... }

local str = table.concat(arg, " ")

str = str:gsub("(%d+)%((.+)%)",
  function(n,c) return c:rep(n) end)

-- print(str)

str = str:gsub("%s(%a)","1%1")

-- print(str)

str = str:gsub("%s(%d)","%1")



-- print(str)

str = str:gsub("(%d+)(%a+)",
  function(n,c) return c:rep(n) end)

-- print(str)

for dir in str:gmatch "." do
  go_dir(dir)
end