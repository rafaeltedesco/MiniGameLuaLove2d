screen = {
  width = 320,
  height = 380
}

MAX_METEORS = 12

meteors = {}

myPlane = {
  src = 'imagens/14bis.png',
  width = 64,
  height = 64,
  x = screen.width/2 - 64/2,
  y = screen.height - 64 * 1.3,
  img = ''
}

function removeMeteors()
  for i = #meteors, 1, -1 do
    if meteors[i].y > screen.height then
      table.remove(meteors, i)
    end
  end
end

function createMeteors() 
  meteor = {
    x = math.random(screen.width),
    y = -70,
    weight = math.random(1, 3),
    horizontalDirection = math.random(-1, 1)
  }
  table.insert(meteors, meteor)
end

function moveMeteors()
  for _, meteor in pairs(meteors) do
    meteor.y = meteor.y + meteor.weight
    meteor.x = meteor.x + meteor.horizontalDirection
  end
end

function love.load()
  love.window.setMode(screen.width, screen.height, {resizable = false})
  love.window.setTitle('My First Game!')
  background = love.graphics.newImage('imagens/background.png')
  myPlane.img = love.graphics.newImage(myPlane.src)
  meteorImg = love.graphics.newImage('imagens/meteoro.png')
  math.randomseed(os.time())
end

function movePlane()
  if love.keyboard.isDown('w') then
    myPlane.y = myPlane.y - 1
  end
  if love.keyboard.isDown('s') then
    myPlane.y = myPlane.y + 1
  end
  if love.keyboard.isDown('d') then
    myPlane.x = myPlane.x + 1
  end
  if love.keyboard.isDown('a') then
    myPlane.x = myPlane.x - 1
  end
end

function love.update()
  if love.keyboard.isDown('w', 's', 'd', 'a') then
    movePlane()
  end

  removeMeteors()
  if #meteors < MAX_METEORS then
    createMeteors()
  end
  moveMeteors()
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(myPlane.img, myPlane.x, myPlane.y)
  for _, meteor in pairs(meteors) do
    love.graphics.draw(meteorImg, meteor.x, meteor.y)
  end
end


