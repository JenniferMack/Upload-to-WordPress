# Upload-to-WordPress
A simple Mac Automator drag-and-drop uploader for WordPress blogs.

Sometimes you just don’t want to open up WordPress to upload a file or two. This app makes it simple, just drag the file(s) onto the app icon and they’ll be uploaded and you’ll get a notification of the result.
## Setup
Download the [.zip file][1], then unzip it. 
There will be two files (`Upload-to-Wordpress.zip` and `upload-wp-password.json`) that you need. The rest are optional.

Place the `Upload-to-Wordpress.app` in a convenient location. The Applications folder in your home folder is a good location. Then right click on it and select `Open`. Click the `Open` button in the security warning box. Then click cancel when the posting confirmation box. This  happens because the app wasn’t created on your computer. 

If you don’t want to bypass the security warning this way, open the app file in Automator. Then make a change like adding a space to a blank line and re-save it. Now it should be recognized as something made on your computer and be trusted to run.

**Note:** if you’re already using my [Ulysses Post to WP app][2], this app will use the config file (`.ulysses-wp-password.json`) you already have.

In the `upload-wp-password.json` file, change the placeholder information to what’s needed to log into your blog. Then save your changes.

1. `yourWPblogURL.com`: the base URL of your WordPress blog.
2. `yourWPusername`: the username you use for logging into your blog.
3. `yourWPpassword`: the password you use for logging into your blog.
4. `use_ssl`: If you _do not have SSL enabled_ on your blog (not recommended) change the `true` to `false`.

Now copy the `upload-wp-password.json` file to your home folder **and rename it to** `.upload-wp-password.json`. That’s where the app looks for it. If it’s not there, you’ll get an error message. The best way to do this is from the terminal with this command.

`cp upload-wp-password.json ~/.upload-wp-password.json`

If you’re using the Finder, hold the option key down while dragging to your home folder, then add the leading dot once it’s copied.
## Usage
Just drag a file or files onto the app icon and enjoy not having to open up WordPress.
## Problems & Bugs
Please [open an issue][3] if you find a problem or bug. If you want to contribute, [pull requests][4] are always welcome.

[1]:	https://github.com/JenniferMack/Upload-to-WordPress/archive/master.zip "Direct .zip download."
[2]:	https://github.com/JenniferMack/Ulysses-post-to-WP
[3]:	https://github.com/JenniferMack/Upload-to-WordPress/issues "Issue tracker."
[4]:	https://github.com/JenniferMack/Upload-to-WordPress/pulls "Create a pull request."