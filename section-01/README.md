# Section 1: Customize the game Robot Finds Kitten

In this section, we modify our very first game. [Robot Finds Kitten][rfk] is a
quiet, simple game of exploration and robots. Our robot's kitten is lost and he
needs to navigate through a vast land to find her.

## Getting the source code

Download [this file][corona-source-zip] and save it to your mobile games folder.

Unzip the folder and open the Corona Simulator. Using the File > Open menu,
select the `main.lua` from robotfindskitten. Use Command + Shift + O on Mac OS
or Control + Shift + O on Windows to open the `main.lua` file in Brackets. The
code is also available with an explanation on [this web page][annotated].

## Exploring the map grid

Play the game a few times. Is there a pattern in where the obstacles are placed?
What sayings you see for each obstacle? Is the kitten behind the same obstacle
each time?

## Adding your own sayings

The code for showing sayings starts on line 335. Take a quick look and see if
you understand it. Try explaining what it does to someone nearby.

Once you've got a handle on it, use the search (Command + F on Mac OS and
Control + F on Windows) to find the uses of `saying:update`.

What did you notice about where we use it. Where does the new text for the
saying come from?

The obstacles are created starting at line 396. Try changing one of the sayings
and replay the game. Change the sayings around until you like all of them.

## Adding your own hiding places

Let's add a few more hiding places. Where do you think a kitten would hide?
Go onto the internet and find some small images and save them to your
robotfindskitten folder. Try to add your own obstacles using the existing ones
as a template.

Make sure that you add the `hasKitten` and `put` methods to your obstacles and
make sure you give each a numerical index as well as a name it can be chosen to
hid the kitten.

Lastly, update the maximum random number generated to hide the kitten on line 
431 to the same as the number you gave to the last obstacle.

## Finishing up

I chose to place obstacles in specific squares but you could set it up to be
random, just like the kitten. You should make sure to check that no two
obstacles try and take the same space. You could also create a biiiiig list of
sayings and give each obstacle a random one at the start of the game. All of
these things would make the game more dynamic, interesting, and fun. Pick one of
them and try it.

## Mentor Notes

Check out the [source repository][repo]

[rfk]: http://robotfindskitten.org
[repo]: https://github.com/nuclearsandwich/robotfindskitten-corona
[annotated]: http://nuclearsandwich.com/robotfindskitten-corona/docs/main.html
[corona-source-zip]: https://github.com/nuclearsandwich/robotfindskitten-corona/archive/master.zip
