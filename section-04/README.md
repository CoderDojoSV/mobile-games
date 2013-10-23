# Create your own game: Explorer

So far you have learned *a lot* about making games. One thing that's come up
over and over again is that we've also done a lot of re-typing the same things
over and over again. Some of you were even able to just copy and paste, then
edit the new copy. However, this style of coding is prone to errors. And when
you want to change one thing, you have to change it in a bunch of different
places. Then forgetting to make the change once results in really strange bugs.

We have also seen that Corona has packaged up some common things such as shapes
and text in *libraries* that we can take advantage of. Libraries in Lua and some
other languages are called *modules* In this session we'll explore how to create
and use our own modules using code from some of our previous games.

## Getting the game template

We've set up a game template for you that has the simplified configuration and
build settings we created last week as well as the grid, controlpad, and
character libraries that were extracted from robotfindskitten and speedmaze.

## Learning how to use the libraries

Just like Corona SDK's documentation is available at
<http://docs.coronalabs.com> the documentation for our libraries both on GitHub
at <https://github.com/coderdojosv/corona-game-template/blob/master/docs>. You
can also read the documentation by opening any of the files in docs using your
code editor.

Open the documentation for the [grid][] module and try to add a grid to your
new game.

## Example uses

This section has some examples using the provided modules. None of the examples
are full programs but they should give you a good idea of how to use them in
your own games.

### Checkerboard Grid

Here's an example of a checkerboard map using the [grid][] module if you wanted
to create a Chess or Checkers game instead of an exploration game.

```lua
local grid = require("grid")
local gamegrid = grid.newGrid(8, 8, 700)
gamegrid:eachSquare(function(gridSquare)
	-- Tests if the square is "even".
	if (gridSquare.x + gridSquare.y) % 2 == 0 then
		gridSquare.displayObject:setFillColor(255, 255, 255, 255)
	else
		gridSquare.displayObject:setFillColor(0, 0, 0, 255)
	end
end)
```

### Robot explorer

Here's an example of creating a robot explorer using the [character][] module
and placing him on the grid. If a canEnter method is defined on the robot, it is
automatically used by the enter method. Otherwise characters can enter any grid
square.

```lua
local character = require("character")
local robot = character.newCharacter("robot.png")
robot.canEnter = function(robot, gridSquare)
	return not gridSquare.obstacle
end
robot:enter(grid[0][0])
```

### Controller pad

## Other modules

Corona SDK has quite a few interesting modules that we haven't even mentioned
yet. The [Corona documentation](http://docs.coronalabs.com) has the full list of
Corona modules for you to browse. I think the most interesting ones are

* [widget][] for creating many kinds of interactive tools like color pickers and buttons
* [physics][] for creating screen objects that act according to realistic
	simulated physics
* [storyboard][] for switching to different levels or scenes in a game (I used this module in the [introductory game][introgame])
* [transition][] for adding sophisticated animation to on-screen motion

[widget]: http://docs.coronalabs.com/api/library/widget/index.html
[physics]: http://docs.coronalabs.com/api/library/physics/index.html
[storyboard]: http://docs.coronalabs.com/api/library/storyboard/index.html
[sprite]: http://docs.coronalabs.com/api/library/sprite/index.html
[transition]: http://docs.coronalabs.com/api/library/transition/index.html

Whenever you use a module it takes time to get used to it. Don't be discouraged
by how difficult things seem at first. Imagine trying to do this section on the
very first day. It probably would have felt impossible but you've been learning
this entire time and even though we're nearly at the last section you will still
be learning constantly for the entire time you're a programmer.

[introgame]: https://github.com/nuclearsandwich/hello-corona
[grid]: https://github.com/coderdojosv/corona-game-template/blob/master/docs/grid.md
[character]: https://github.com/coderdojosv/corona-game-template/blob/master/docs/character.md
[controlpad]: https://github.com/coderdojosv/corona-game-template/blob/master/docs/controlpad.md
