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

## Plan your main loop

## Showing hands

## Detecting different touch types

## Creating the timer
