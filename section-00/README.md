# Installation and Introduction to Corona SDK and Lua

This section will focus on the installation and setup of [Corona SDK](http://coronalabs.com/).
Students will:

* Install a code editor
* Setup a Corona SDK account
* Install the Corona SDK software
* Run a sample Corona application on their mobile device or emulator
* Start on a set of Lua practice exercises

## Setting up Corona SDK

### What's Corona? What's an SDK? Why do we need one?

Building programs on modern computers is super challenging. Even cellphones are
richer in features and much more complex than the computers I learned to play
and make games on. Luckily, there are tools that try their best to make writing
games easier again. One of these toolsets is called the Corona SDK. SDK means
**S**oftware **D**evelopment **K**it. One of the neat things about Corona is
that it is *cross platform* meaning it can help you make games for multiple
types of devices. So if you have an Android device or an iOS device, you can
write your game once and have it run in both places.

## Getting a code editor

There are many code editors in the world and everyone eventually picks a
favorite. The simple editors are the best and the editor we'll be using,
[Brackets][] is far and away one of the simplest. Follow [this link][bracketsdl]
to download and install brackets.

[Brackets]: http://brackets.io
[bracketsdl]: http://download.brackets.io

### Setting Brackets as the default code editor.

#### On Mac OS X

Open Brackets and create a new file. If you want you can put some sample text in
it like

    print("Hello, kitty!")

then save it as `test.lua`. Make sure you pay attention to where you saved it.

Once you've saved it, find the file in Finder and select it with a single click.
Then press `command + i` to open the file info. Near the bottom of the info pane
is the "Open with" area. Select Brackets as the code editor and then push the
"Change All.." button.

#### On Windows

Once Brackets is installed. Create a file and save it somewhere easy to keep
track of as `test.lua`. Now find that file in the File Explorer and right click
on it. Select "Open With > Choose Default Program" and make sure Brackets is the
default.

## Creating a Corona Labs account

Go to the [login and registration page](https://developer.coronalabs.com/user/register)
for Corona Labs and create a new account. Make sure your password and email
address are correct. You *will* need them. Once you've created an account, log
in. 

## Downloading the Corona SDK

After you've logged in you can [Download the Corona SDK](https://developer.coronalabs.com/downloads/coronasdk)

Follow the instructions given to install it for your platform.

## Running the Corona Simulator

### Get the starter game

You can download the code for the starter game from [here][starter-dl] and unzip
the downloaded game into a folder.

[starter-dl]: https://github.com/nuclearsandwich/hello-corona/archive/master.zip

### Running it in the simulator

Open the Corona Simulator. Once it's been opened, you will need to log into the
Simulator itself. Once you've done so, you can open the `main.lua` file from the
starting program. As soon as it opens, it will start playing. Check it out!

### Putting a game on your device

#### On Android

Android devices are free to develop for. Make sure the starter app is open in
the Simulator and go to "File > Build > Android".

*:warning: Windows users may not have the Java Development Kit installed. If you
don't, Corona will tell you and direct you to the web page from which you
download the JDK. Make sure you choose the 32 bit download irregardless of
whether your system is 32 bit or 64 bit.* 

If Java is installed you'll see the build window for Android. Select an easy to
remember folder for Corona to build the Android app into and press build.

Once the build is done, select "Reveal in Finder" or "Show in File Explorer" and
copy the apk file to your Android device. This process is different for nearly
every Android phone and may require help from the phone's owner or an
instructor.

After the apk has been copied, you'll need to open it. Again, this process is
different on almost every single Android device. If your phone did not come with
a file browser application, you will need to get one. I trust [this one][fex]
alone because it is open source software. If Android raises an error about
development applications, you can go into your settings and enable apps from
outside Google Play. On Mac OS X, you may also need the [Android File Transer][]

[Android File Transfer]: http://www.android.com/filetransfer/

Once it's installed, open it! You're all set!

[fex]: https://play.google.com/store/apps/details?id=net.appositedesigns.fileexplorer

#### On iOS

Apple normally requires developers to pay a $99 fee and register certificates in
order to build applications. We're going to trade the ability to put apps in the
app store for the ease of sharing one developer certificate among all students.

Bring your iOS device to the lead instructor in order to have the developer
profile installed. Once all the devices iOS devices have been registered, you'll
get a USB drive with the developer certificate and provisioning profile.

To install the certificate, open the USB drive in Finder and double click on it.
You may be asked to enter your password in order to open the keychain. 

Copy the provisioning profile to `~/Library/MobileDevice/Provisioning Profiles/`
The ~ represents your home folder, which has a house next to it in Finder's
sidebar.

Once you've done that, close and re-open the Corona Simulator and select the
starter game from "Open recent" in the File menu. Then select File > Build > iOS

Leave all the options alone except for the Code Signing Identity. Select "iPhone
Developer Steven Ragnarök ... [Coder Dojo SV]", then press the Build button.

*:warning: It's important you don't close or modify the Simulator window while
your app is building*

When it's finished building you will get some warnings about not passing Apple's
standards which you can ignore for now. Click the "Show in Finder..." option
then drag the program to the iTunes icon on the dock. Once you've done this, you
can connect your device to the computer using your USB cable and copy the app to
your device using iTunes.

Lastly, test it out on the device!

## Wrapping up

By now you've got everything set up! You can peruse the game's source, which is
all in the `main.lua` file. You can also check out [the annotated source][anno]
for the game if you're curious but the smart thing to do is check out the Lua
examples below.

[anno]: http://nuclearsandwich.com/hello-corona/main.html

## The Lua Programming Language

Check out this sweet [introduction to Lua][intro]!
[intro]: http://coderdojosv.github.io/mobile-games/section-00/docs/introduction.html

You can also [test Lua in the browser](http://repl.it/languages/lua). Try
copying the [exercises][koans] from here and pasting them in repl.it.

[koans]: https://raw.github.com/CoderDojoSV/mobile-games/master/section-00/koans.lua
