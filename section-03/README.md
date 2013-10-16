# Create your own game: High Five

Students get to write their first game from scratch. High five is a very
simplified reaction game similar to Simon Says that uses multitouch gestures.

## Starting a new game from the beginning

So far, we have had you download an existing Corona project from the curriculum
instead of create one using Corona. This has allowed us to make more interesting
games without having to explain every part of the game right away. But we want
you to be able to make your own games from scratch if you want to. So we are
going to practice doing that and take a look at some of the other files a Corona
game application.

### Create a new Corona project

Open the Corona Simulator and select New Project.

Name the project "high-five" or something similar.

Choose a "blank" project for now. We're going to create a very simple game and
Corona's templates will just be in the way for now. They are worth trying out
later though!

Set the screen size to "Tablet preset" or "Phone preset" depending on whether
your real device is a phone or tablet.

Set the orientation to Sideways.

Click "Next" and save your new Corona project in your mobile games folder where
you have your previous games.

This creates a new folder with the three standard files in them. Up until now
we have only worked in `main.lua` but the following three files are always
included in a Corona project.

* `main.lua`
* `build.settings`
* `config.lua`

Using the File menu in Brackets select Open Folder and open the high-five
folder.

### Inspect the build settings file

Open the `build.settings` file in Brackets. Even though the name does not end in
`.lua` it's still actually a Lua file! The entire file consists of only a
settings table that has handful of inner tables.

There's a lot of comments that the original creators of the template considered
useful. The downside is that comments don't get updated when things change. So
I like to remove comments that provide information and instead add a comment
with a link to the [documentation][buildsettings docs].

Add a comment (a line beginning with `--` at the top of the file that says
something like the following:

```lua
-- For a description of the build settings read http://docs.coronalabs.com/guide/distribution/buildSettings/index.html
```

Make sure to use words *you* understand. Comments are explanations to your
future self. Write comments like the person reading them is you right after you
get out of bed in the morning. You are still groggy.  You don't remember what
you had for dinner last night yet. Be descriptive but clear.

This is like citing a primary source instead of a secondary source if you have
ever had to do research.

In order to simplify our build settings file we are going to remove some
unnecessary things.

* Remove the comments about supported orientation types
* Remove the `androidPermissions` table and surrounding comments
* Remove the `CFBundleURLTypes` table and surrounding comments

[buildsettings docs]: http://docs.coronalabs.com/guide/distribution/buildSettings/index.html

### Inspect the configuration file

Next open the `config.lua` file.

We want to find Corona documentation for project configuration files. If you go
to <http://docs.coronalabs.com/> can you find the correct document? I'll give
you two hints:

1. It's somewhere on the Guides page
2. It's somewhere in the Corona Basics section

Take a quick read through the settings file and then copy the url in the browser
tab and paste it in a comment for your future self to read.

Again, to simplify our file we're going to remove the `imageSuffix` table and 
surrounding comments and the `notification` table and surrounding comments.

### Add icon files and configuration

Thanks to one of our mentors, we have awesome Coder Dojo icons to use for our
games. You can download them from [here][coderdojoicons] and add the following
to your `iphone` table in `config.lua`:

```lua
-- ... start of configuration

iphone = {
	plist = {
		CFBundleIconFiles = {
			"iTunesArtwork"
		},
	},
}

-- ... possible further configuration
```

[coderdojoicons]: https://github.com/CoderDojoSV/mobile-games/releases/download/icons-2013-10-14/coderdojosv-icons.zip

## Plan your game

At this point, it's important to think about what you want your game to do. The
hardest part of planning is estimating how much time your game will take to
make. When I started making games I would assume that everything takes ten times
longer than I expected it to. So if I thought it was going to take five minutes
to do, in reality it would probably be have been an hour.

The lesson there is plan for the amount of time you have. Tonight's session is
90 minutes long and you've already spent some of it learning about build
settings and configuration.

In your `main.lua` file write in comments the things you want your game to do.

Here's my plan but yours can be different:

### Compose a plan

```lua
-- Show a hand for a high five
-- If the Player taps with one finger then the high five disappears and a high ten appears
-- If the Player taps with two fingers apart then the high ten disappears and a fist bump appears
-- If the Player taps with two fingers together then the fist bump disappears and a high five appears

-- (Only if I have time) If the player waits too long to tap, the game starts over
-- (Only if I have time) Every time they get to the high five again, the amount of time they have to tap gets shorter
```

### Determine how to accomplish your plan

Now that I have what I *want* to do. It's time to start thinking about how to do
it. I usually do that in outline form right in my comments.

```lua
-- Show a hand for a high five
-- * To do this I'll need to use display.newImageRect
-- * I will have to figure out how to get this roughly centered in the screen

-- If the Player taps with one finger then the high five disappears and a high ten appears
-- * I decided that I want the player to be able to tap anywhere, not just on the hand so I need my touch event listener on Runtime not the highFive

-- If the Player taps with two fingers apart then the high ten disappears and a fist bump appears
-- * In order to enable touching the screen in different places at the same time I need to enable multitouch
-- * Then I need to check that there's at least a finger's distance between my two fingers for the "apart" portion of the check

-- If the Player taps with two fingers together then the fist bump disappears and a high five appears
-- * I need to check that there's very little distance between my two fingers for the "together" portion of the check
-- * Since this takes me back to the start I probably need a function I can call over and over again

-- (Only if I have time) If the player waits too long to tap, the game starts over
-- * I can use the timer library to do this

-- (Only if I have time) Every time they get to the high five again, the amount of time they have to tap gets shorter
-- * I'll need to change the amount of time the timer waits each time I get to the end.
```

### Sanity check your plan

I like to run my plan by someone else. I'm usually told that I'm too ambitious
and that I should make something smaller work first. Most people say that if you
want to build a skyscraper then build a skyscraper not a small office. However,
with programming, there's nothing to lose by starting small because adding stuff
to a small game always works! In fact, there's a lot of value in starting small
and building big because it gives you the chance to test parts of your game
quickly. 

Maybe you find out that this isn't that fun and you need to change something to
make it more exciting. Maybe checking the distance between two touches will
prove too challenging for me and I'll have to switch to detecting touches on the
high five, high ten, and fist bump directly.

Share your plan with someone at your table, then share it with your mentor.

## Build the game according to your plan

Follow the plan and test it as you go. From here on out, there are only side
quests. The rest of the game is up to you! Don't be afraid if you get stuck. I
got stuck a ton writing the first three games for this class. It took me *days*
to write them. The mentors are here to help you get unstuck. Keep this game
small for now then make it a skyscraper later if you feel like it.

You might want to dive right in, or you might want to browse the side quests
below for ideas. Either way, have fun!  

## Side Quest: Game Structure

Our games so far don't have a lot of *structure* because they are very simple.
However, they still had some structure. In case you don't know what we mean when
we talk about *structure*, we're talking about common parts that most games need
in some form. These are like the walls of a room. Every room has a different set
of things in it, but it still needs four walls (and hopefully) a door to be be
called a room.

Our first two games ([robotfindskitten][rfk] and [speedmaze][speedmaze]) both
had `play()` functions that did most of the work. The purpose of the play
function was to give us the ability to start the game over. Remember the sample
game from the very first night? It had no play function and thus when you got to
the end, you were stuck there. We want to avoid that for our game.

We could use a while loop to do this, but if our game restarts somewhere in the
middle. Such as during a game over, there is no clean way to go back to the
start of the loop. Instead, it's best to use a function that encompasses all of
our game code after the initial setup and calls itself repeatedly to start the
game over.

The very last line of our game code is calling the function for the first time.

[rfk]: http://nuclearsandwich.github.io/robotfindskitten-corona/docs/main.html
[speedmaze]: http://nuclearsandwich.github.io/speedmaze-corona/docs/main.html

## Side Quest: Detecting different touch types

Detecting multiple touches is still more of an art than a science. In Corona,
multitouch support is not enabled by default because it takes up additional
resources on some devices. Multitouch is enabled by adding the directive

```lua
system.activate("multitouch")
```

You only need to do this once so it shouldn't go in your main game function but
rather at the top of your file with any other initialization you do.

In the past we've dealt with only one type of touch event. We check the
`event.phase` attribute and make sure we only act at when the event phase is
"began". There are other attributes of event that we haven't used. One of them
is the `event.id` property. Each individual touch event has a unique id so that
when you move your finger without picking it up, or pick it up after holding it
down, you can determine that it was the same touch as when you started paying
attention.

This has many different uses but the one we're aiming for today is detecting
two-finger touches. To do this we need to make sure that there are at least two
different touch events happening concurrently.

#### Two simultaneous touches

One way to detect two simultaneous touches on an object is to store the touch
event id and a touch count on the target object whenever an event is started and
remove it at the end of the touch event. Check out the following touch event
handler example.

```lua
touchScreen = function(event)
	local target = event.target
	if target.touches == nil then
		target.touches = {count = 0	}
	end

	if event.phase == "began" then
		target.touches[event.id] = true
		target.touches.count = target.touches.count + 1
	elseif event.phase == "ended"
		target.touches[event.id] = nil
		target.touches.count = target.touches.count - 1
	end

	if target.touches.count >= 2 then
		-- Houston we have multitouch!
	end
end
```

#### Tracking the distance between two touches

Now that we have two simultaneous touches, can we detect if those are two
fingers together or two fingers apart?

The best way I've found to do it with Corona SDK is store where each touch
event occurs and calculate the distance between the two events. Storing the
event coordinates could be as simple as saving the *x* and *y*
coordinates of the event when it is began instead of just saving the event
on the object as `true`. Our line above would change to

```lua
		target.touches[event.id] = { x = event.x, y = event.y }
```

This means you also need to check for "moved" events to update the *x* and
*y* coordinates of the event as your player moves their fingers.

```lua
elseif event.phase == "moved" then
	target.touches[event.id].x = event.x
	target.touches[event.id].x = event.y
elseif event.phase == "ended"
```

You could then use a mathematical [distance function][dist] to compute how
far the two touches are from each other. You can log this distance by
printing it out to the console using `print()` which is easy on Windows or you
can create some text on the screen that prints the distance between two touches.
This would be useful for testing. Can you build a little game whose only purpose
is touch testing?

[dist]: https://en.wikipedia.org/wiki/Distance_formula#Geometry

In Lua a distance function might look like
```lua
distance = function(x1, y1, x2, y2)
	return math.sqrt( (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) )
end
```

## Side Quest: Difficulty tuning the timer

If you decided that your game should get more challenging as time goes on, you
will need to set some parameters. Perhaps these are *global* variables that we
discussed in the [introduction to Lua][intro] but we would be far better off if
we included the parameter as an actual parameter to the `play` function. (see the
[Game Structure][structure] side quest). If you set a parameter which is related
to the amount of time the user has to respond, you can control the speed just by
modifying the parameter on each run.

Suppose your play function looked like this

```lua
local play = function(rate, score)
-- all the guts of your function
end
```

and at the end of your `main.lua` file you call the function with the initial
parameters.
```lua
play(1, 0)
```

Then at the end of your function, you could have something like:

```lua
if userSuccessful then
	play(rate + difficultyIncrease, score + 1)
else
	play(1, 0)
end
```

In the above pseudocode, each time you run through the game, things will get
a little harder and you can adjust how much harder by adjusting the size of the 
`difficultyIncrease`. The best way to evaluate a difficulty constant is to play
yourself. Are you bored? Make it harder. Do you struggle to keep after just a
few rounds. Reduce the `difficultyIncrease` until you find a sweet spot.

[intro]: http://coderdojosv.github.io/mobile-games/docs/introduction.html
