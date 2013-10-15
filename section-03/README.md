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
-- * Since this takes me back to the start I probably need a while loop to go over and over again

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

Have fun!

## Side Quest: Detecting different touch types

## Side Quest: Difficulty tuning the timer
