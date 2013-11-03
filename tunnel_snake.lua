args = { ... }

local tunnel_size = 6
local tunnel_times = 1
local snake_times = 4
local current_dir = "left"

function fdig()
    while turtle.detect() do
    turtle.dig()
  end

  turtle.forward()
end

function turnDir(d)
  if d == "left" then
    turtle.turnLeft()
  else
    turtle.turnRight()
  end
end

for sn = 1, snake_times, 1 do
  if args[1] then
    tunnel_size = args[1]
  end
  if args[2] then
    tunnel_times = args[2]
  end

  if args[3] then
    snake_times = args[3]
  end

  if args[4] then
    current_dir = args[4]
  end

  for t = 1, tunnel_times, 1 do
    shell.run("tunnel",tunnel_size)
    turtle.up()
    turtle.select(16)
    turtle.placeDown()

    while turtle.detect() do
      turtle.dig()
    end

    turtle.forward()
    turtle.digDown()
    turtle.down()
  end

  turnDir(current_dir)
  turtle.forward()

  fdig()
  fdig()

  turnDir(current_dir)
  fdig()

  if current_dir == "left" then
    current_dir = "right"
  else
    current_dir = "left"
  end

end