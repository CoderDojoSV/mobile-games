# Mentor Notes for Section 00

This first section is focused entirely on getting the necessary tools set up.
All developer tools are a pain to set up and not allocating an entire 90 minute
session to do so would be naive and disastrous.

This is going to be the hardest class to keep all the students at the same pace.
We'll be encouraging any students who are stuck in the process to ask for help
and those who are too shy to do so, make sure they don't flail and that they're
making progress.

For those who do finish early, we have a set of Lua exercises which you should
definitely do when they're ready so you're prepared to answer questions.

The introductory explanation of Lua is here for now:
http://coderdojosv.github.io/mobile-games/section-00/docs/introduction.html

Encourage the students to move to the exercises once they've played through the
Hello game a few times. The Lua exercises are distributed and run using repl.it
because Corona doesn't ship with a usable standalone Lua interpreter and the
overhead of setting one up is too high for a single night's work.


## Dealing with Apple Developer Certs

The absolute worst part of the experience for folks starting out with Corona on
iOS devices is getting the certs in place. For one, it's needlessly expensive
just to play around and the process is arcane even by developer standards. To
spare the students from this, the lead instructor should create an Apple
Developer account specifically for their Dojo to use and pay the $99 fee *once*
per Dojo per year per one hundred devices.

The students need two things to build and install apps on their iOS device.
1. An Apple Signed developer cert
2. A provisioning profile installed on their device

The lead instructor will provide both of these to every student.

The [Corona SDK docs](http://docs.coronalabs.com/guide/distribution/iOSBuild/index.html) 
on provisioning and building iOS were my primary source for doing all this
stuff.

### Gathering UDIDs for Provisioning Profiles

It is going to be a lot easier to generate a single provisioning profile for all
apps and all devices used by a dojo than it will be to try and isolate them.
This means we miss out on stuff like iCloud storage but we're cross-platform
with Android anyway so we're not sacrificing much.

At the first session, have each student bring forth their device and USB cable,
collect their UDID using XCode or iTunes and add it to the Apple developer
account.

### Creating and Distributing the Provisioning Profile

Once all student devices have been collected, create a wildcard app provisioning
profile and make sure you select every UDID.

Download the provisioning profile and save it to a USB drive with the developer
cert.

Use the USB drive to distribute this to each iOS student, install the cert by
double clicking on it and put the provisioning profile in
`~/Library/MobileDevice/Provisioning Profiles`

## Caveats and Addendums

There's basically no better way to do this because of Apple's rules. Students
can continue to use these profiles for up to a year after the course is finished
but will be unable to add new devices to the provisioning profiles unless they
track down the lead instructor or whoever has the credentials. If they wish to
submit applications to the app store or create apps to distribute to their
friends' devices, they'll need to convince someone to pony up the $99 and go
through the cert/provisioning gauntlet.
