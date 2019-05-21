# flutter_presentations

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

## Building on Desktop
* Update your Flutter to latest version of `master` branch with:
  * `flutter channel master`
  * `flutter upgrade`
* Clone [Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding):

`git clone https://github.com/google/flutter-desktop-embedding.git`
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
  * Add to PATH paths to dart and flutter and add `ENABLE_FLUTTER_DESKTOP` set to `true` to env variables
* Copy `flutter-presentations` into `flutter-desktop-embedding` folder
* Check if `flutter devices` now shows your desktop device
* Copy and replace the following folders into `flutter-desktop-embedding/flutter-presentations`:
  * `flutter-desktop-embedding/example/windows`
  * `flutter-desktop-embedding/example/macos`
  * `flutter-desktop-embedding/example/linux`

## Running on Desktop
Enter `flutter-desktop-embedding/flutter-presentations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-desktop-embedding/mobile-flutter-merchant` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app