local dirs = {
  u = function () return turtle.up() end,
  d = function () return turtle.down() end,
  f = function () return turtle.forward() end,
  b = function () return turtle.back() end,
  i = function () return turtle.dig() end,
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

local str = arg[1]:gsub("(%d+)(%l+)",
  function(n,c) return c:rep(n) end)

for dir in str:gmatch "." do
  go_dir(dir)
end