# How to use these icons #

Most of them will work without any work besides placing them in the same folder
as your `main.lua`.

The only one that needs special consideration is the `iTunesArtwork` file.
To enable it open the `config.lua` file in your Corona application folder and
make sure that the `iphone` table has a `plist` subtable that matches the
following:

```
iphone = {
		plist = {
			CFBundleIconFiles = {
				"iTunesArtwork"
			}
}
```
