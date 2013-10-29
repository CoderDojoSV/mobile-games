# Create your own game: Avoid All the Things

Avoid All the Things is exactly what it sounds like. Guide your character
through a screen full of objects trying to get you.

## Creating a new project

Go ahead and download the [game template][template] and rename the folder
something like "avoid-all-the-things".

Open the `main.lua` file in your code editor.

## Navigating the player character by touch

The first thing we need to do is create a player character. I used the
`ship.png` image from the template game files. We also set the reference point
to the center of the ship. This will help us later when we continuously change
the ship's location. We also place it in the center.

```lua
local ship = display.newImageRect("ship.png", 100, 100)
ship:setReferencePoint(display.CenterReferencePoint)
ship.x = display.contentCenterX
ship.y = display.contentCenterY
```

Next we add create a touch event that handles each of the three phases of a
touch. At first we just flag the ship as in motion, then as you drag your
finger, creating "moved" events, we set the ship's location to match the new
position of your finger. Lastly, when you lift your finger up and an "ended"
event is created, we update the position a final time and stop the ship.

```lua
ship.touch = function(event)
	if event.phase == "began" then
		ship.onTheMove = true
	elseif event.phase == "moved" and ship.onTheMove then
		ship.x = event.x
		ship.y = event.y
	elseif event.phase == "ended" then
		ship.x = event.x
		ship.y = event.y
		ship.onTheMove = nil
	end
end

ship:addEventListener("touch", ship.touch)
```

## Setting up flying obstacles

We'll set obstacles to appear every five seconds (5000 milliseconds) and use a
random image from a list of possible obstacle images.

Each obstacle gets a random pair of "delta" values. Delta is used in physics and
computer programming to refer to change of various kinds. You can think of each
delta value as speed. You can also read delta as "change in" so `deltaX` means
"change in X" and `deltaY` means "change in Y". The `deltaAngle` will allow us
to rotate our objects as they fly around. We also define an eachObstacle method
so we can iterate over each obstacle. The reason for specifying negative one or
one is so that our flying obstacles don't all begin flying in the same
direction.

```lua
local obstacleImages = { "icecream.png", "yarn.png", "penguin.png" }
local obstacles = {}

obstacles.eachObstacle = function(obstacles, doEach)
	for i = 1, #obstacles do
		doEach(obstacles[i])
	end
end

local newObstacle = function()
	local obstacle = display.newImageRect(obstacleImages[math.random(1, #obstacleImages)], 50, 50)
	local negativeOneOrOne = {1, -1}
	obstacle:setReferencePoint(display.CenterReferencePoint)
	obstacle.x = 50
	obstacle.y = 200
	obstacle.deltaX = math.random(5,10) * negativeOneOrOne[math.random(1,2)]
	obstacle.deltaY = math.random(5,10) * negativeOneOrOne[math.random(1,2)]
	obstacle.deltaAngle = 20
	obstacles[(#obstacles + 1)] = obstacle
end

local newObstacleTimerID = timer.performWithDelay(2000, newObstacle, 0)
```

In days gone by, we might have had a big loop with all of our game code in it.
With Corona we use "event-based" programming. Consider our touch events. We've
used a lot of them but they're just one type of event. We've also created timers
that use events. There's an event that runs at each animated frame of our game.

We'll treat that function as our main "loop".

We need to move obstacles before each animation of the screen. In order to keep
obstacles from flying off the screen, we check if they're inside the screen
bounds and reflect them in the opposite direction.

```lua
local eachFrame = function()
	for i = 1, #obstacles do
		local o = obstacles[i]
		if (o.x + o.deltaX > display.contentWidth) or (o.x + o.deltaX < 0) then
			o.deltaX = -1 * o.deltaX
			o.deltaAngle = -1 * o.deltaAngle
		end

		if (o.y + o.deltaY > display.contentHeight) or (o.y + o.deltaY < 0) then
			o.deltaY = -1 * o.deltaY
			o.deltaAngle = -1 * o.deltaAngle
		end

		o.x =  o.x + o.deltaX
		o.y =  o.y + o.deltaY
		o:rotate(o.deltaAngle)
	end
end
Runtime:addEventListener("enterFrame", eachFrame)
```

## Detecting collisions

If we were to write this game using Corona's [physics][] library. We could use
it to detect collisions. However, the physics library adds additional complexity
that we don't need just yet. So we'll detect collisions by assuming that all of
our objects are circular and check if the distance between two objects is less
than the combined radius of the objects. If it is, they've collided and we
should restart the game. You can read more about collision detection techniques
on [this corona tutorial][corona collisions].


We'll add collision detection to our ship with a `collidedWith` method.

```lua
ship.collidedWith = function(ship, obstacle)
	if not obstacle then return false end

	local distanceX = ship.x - obstacle.x
	local distanceY = ship.y - obstacle.y

	local distance = math.sqrt(distanceX * distanceX + distanceY * distanceY)

	local collisionRadius = (ship.contentWidth / 2) + (obstacle.contentWidth / 2)

	if (distance < collisionRadius) then
		return true
	end
	return false
end
```

Then write a `detectCollisions` function that checks if the ship collides with
any obstacles and make sure it's called by our `eachFrame` function. If any
obstacle collides with the ship, call `resetGame`.

```lua
local detectCollisions = function()
	obstacles:eachObstacle(function(obstacle)
		if ship:collidedWith(obstacle) then
			resetGame()
		end
	end)
end
```

## Tuning the difficulty

Game design is a tricky art. If your game is too easy it gets stale and boring
quickly. If it's too hard, your players lose interest. Difficulty tuning is a
huge part of game design. There are also other strategies you can use. The game
[Super Hexagon][] is amazingly challenging but compensates for this by making
the game over to restart transition instant. [Katamari Damacy][] on the other
hand is a fairly easy game to play but the fun is in picking up different and
larger objects and exploring each world.

To tune the difficulty of your game, adjust the delta ranges of obstacles as
well as the timer value. Once you feel good about your difficulty level. Build
your game and have someone else at your table play it. Challenge your mentor to
play it.

[template]: https://github.com/CoderDojoSV/corona-game-template/archive/master.zip
[physics]: http://docs.coronalabs.com/api/library/physics/index.html
[corona collisions]: http://www.coronalabs.com/blog/2013/07/23/tutorial-non-physics-collision-detection/
[Super Hexagon]: http://superhexagon.com/
[Katamari Damacy]: https://en.wikipedia.org/wiki/Katamari_damacy
