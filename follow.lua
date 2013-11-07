function check_forward()
  if turtle.detect() then
    return false
  else
    turtle.forward()
    if turtle.compareDown() then
      return true
    else
      turtle.back()
      return false
    end
  end
end

function step()
  -- if from_dir then
  -- else
  --   from_dir = 0
  -- end

  if check_forward() then
    -- return from_dir
    return true
  else
    turtle.turnRight()
    if check_forward() then
      return true
    else
      turtle.turnLeft()
      turtle.turnLeft()
      return check_forward()
    end
  end
end
turtle.select(1)

on_path = turtle.compareDown()
if on_path then
  repeat
    on_path = step()
  until not on_path
    turtle.turnRight()
  print "done walking path"
else
  print "not on path!"
end