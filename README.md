# GenesisFeathersDemo
Genesis Haxe / OpenFL / Feathers UI Demo

### Building the HTML5 app

Run the following command in terminal to build the HTML5 app

`> openfl build html5`

### Building the macOS app

Run the following command in terminal to build the macOS app

`> openfl build mac`

### Building the Windows app

Run the following command in terminal to build the Windows app

`> openfl build windows`

### Building the Linux app

Run the following command in terminal to build the Windows app

`> openfl build linux`

### Building the iOS app

Run the following command in terminal to build the iOS/iPadOS app.

> **Important**: You have to define your Apple Developer Team ID in order to build the app successfully. Just replace `{yourteamid}` with your Apple Developer Team ID which can be found [here](https://developer.apple.com/account/#MembershipDetailsCard)

`> openfl build ios -Dteamid={yourteamid}`

Notes:
- The minimum supported iOS SDK version is 12
- iOS SDK Version 16 (and above) no longer supports the armv7 architecture, so it has been disabled in the project config file

### Optional Package ID

By default the app is being built with `net.prominic.genesis.feathersdemo` package ID. To build with your own desired package id, just replace `{yourpackageid}` in the following command:

`> openfl build ios -Dteamid={yourteamid} -Dpackageid={yourpackageid}`

### Debugging

Add the `-debug` parameter to the command line to create the debug build of the app. E.g.:

`> openfl build windows -debug`
