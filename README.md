# GenesisFeathersDemo
Genesis Haxe / OpenFL / Feathers UI Demo

## Compiling and Building the app

### HTML5

Run the following command in terminal to build the HTML5 app

`> openfl build html5`

### macOS

Run the following command in terminal to build the macOS app

`> openfl build mac`

### Windows

Run the following command in terminal to build the Windows app

`> openfl build windows`

### Linux

Run the following command in terminal to build the Linux app

`> openfl build linux`

### iOS

#### Build using XCode

Run the following command in terminal to build the iOS/iPadOS app's XCode project.

> **Important**: You may define your Apple Developer Team ID in order to build the app and pre-select the signing credentials in XCode. Just replace `{yourteamid}` with your Apple Developer Team ID which can be found [here](https://developer.apple.com/account/#MembershipDetailsCard). This parameter can be omitted if you're building an XCode project only, and will manually select your team in XCode.

`> openfl update ios -Dteamid={yourteamid}`

After this command, launch XCode and open the generated project in the `Export/ios` directory. Alternatively run the following command to automatically open XCode after a successful compilation.

`> openfl update ios -Dteamid={yourteamid} -xcode`

Build and launch the app on the selected device in XCode.

#### Build in terminal

Run the following command in terminal to build the iOS/iPadOS app.

> **Important**: You must define your Apple Developer Team ID in order to build the app successfully in terminal. Just replace `{yourteamid}` with your Apple Developer Team ID which can be found [here](https://developer.apple.com/account/#MembershipDetailsCard)

`> openfl build ios -Dteamid={yourteamid}`

Notes:
- The minimum supported iOS SDK version is 12
- iOS SDK Version 16 (and above) no longer supports the armv7 architecture, so it has been disabled in the project config file

#### Create iOS Payload (IPA)

By default, OpenFL generates an *.app* file after a successful iOS build. To generate the *.ipa* file that you can copy to your iOS device, use the `createpayload` build parameter:

`> openfl build ios -Dteamid={yourteamid} -Dcreatepayload`

> **Important**: You can only copy and install the generated IPA on your device if [Developer Mode](https://stackoverflow.com/questions/73733701/how-to-enable-developer-mode-in-ios-16-0) is enabled. Needless to say, enabling Developer Mode is a potentially unsafe procedure.

## Optional Build Parameters

### Package ID

By default the app is being built with `net.prominic.genesis.feathersdemo` package ID. To build with your own desired package id, just replace `{yourpackageid}` in the following command:

`> openfl update ios -Dteamid={yourteamid} -Dpackageid={yourpackageid}`

## Debugging

Add the `-debug` parameter to the command line to create debug build of the app. E.g.:

`> openfl build windows -debug`
