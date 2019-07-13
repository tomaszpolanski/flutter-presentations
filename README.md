# Flutter Presentations

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

## Building on Desktop
* Last tested version of Flutter that works with this repo is `v1.7.8+hotfix.3`:
  * `flutter version v1.7.8+hotfix.3`

## Building and running Desktop application
### Linux
- Add the following to `.bash_profile` but replace `/Users/tomek/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:/Users/tomek/flutter/bin"
# Add Dart
export PATH="$PATH:/Users/tomek/flutter/bin/cache/dart-sdk/bin"
export ENABLE_FLUTTER_DESKTOP=true
```
### Mac
- Add the following to `.bash_profile` but replace `/Users/tomek/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:/Users/tomek/flutter/bin"
# Add Dart
export PATH="$PATH:/Users/tomek/flutter/bin/cache/dart-sdk/bin"
export ENABLE_FLUTTER_DESKTOP=true
```
- Update CocoaPods:
```
brew upgrade cocoapods
pod setup
gem install cocoapods
```
### Windows
- Add to PATH paths to dart and flutter and add `ENABLE_FLUTTER_DESKTOP` to env variables

* Check if `flutter devices` now shows your desktop device

## Running on Desktop
Enter `flutter-presentations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-presentations` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app

## Running on Docker
Coming soon!
