# Flutter Presentations

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

## Building on Desktop
* Update your Flutter to latest version of `master` branch with:
  * `flutter channel master`
  * `flutter upgrade`
* Mac/Linux :
  * Add the following to `.bash_profile` but replace `/Users/tomek/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:/Users/tomek/flutter/bin"
# Add Dart
export PATH="$PATH:/Users/tomek/flutter/bin/cache/dart-sdk/bin"
export ENABLE_FLUTTER_DESKTOP=true
```
* Windows:
  * Need to install Visual Studio 2017 or 2019, including the "Desktop development with C++" workload
  * Add to PATH paths to dart and flutter and add `ENABLE_FLUTTER_DESKTOP` set to `true` to env variables
* Check if `flutter devices` now shows your desktop device

## Running on Desktop
Enter `flutter-presentations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-presentations` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app
