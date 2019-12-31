# Flutter Presentations

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

# Building
Last tested version of Flutter that works with this repo is `v1.12.13+hotfix.5`:
  * **Important**: Use `version` otherwise desktop won't be picked up: `v1.12.13+hotfix.5`

## Building for Web
Upgrade flutter to minimum `v1.12.13+hotfix.5`, enable web compilation and run:
```
flutter version v1.12.13+hotfix.5
flutter config --enable-web
flutter run -d chrome -v
```

## Building for Desktop
Enable desktop builds by running in the terminal:
```
flutter config --enable-linux-desktop --enable-macos-desktop --enable-windows-desktop
```
### Linux
- Add the following to `.bash_profile` but replace `$HOME/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
```
### Mac
- Add the following to `.bash_profile` but replace `$HOME/flutter/` with path to your Flutter folder
```
# Add Flutter
export PATH="$PATH:$HOME/flutter/bin"
# Add Dart
export PATH="$PATH:$HOME/flutter/bin/cache/dart-sdk/bin"
```
- Update CocoaPods:
```
brew upgrade cocoapods
pod setup
gem install cocoapods
```
### Windows
- Install Visual Studio Community 2019 with [Desktop development with C++](https://devblogs.microsoft.com/cppblog/windows-desktop-development-with-c-in-visual-studio/#installation). 
Make sure that those components are installed:
* `MSVC v142 - VS 2019 C++ x64/x86 build tools (v14.23)`	
* `Windows 10 SDK (10.0.17763.0)` 

## Running on Desktop
Enter `flutter-presentations` in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-presentations` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app

## Running on Docker
1) Install `docker`
2) Build docker image (will take a couple of minutes)
```
./build_docker.sh v1.12.13+hotfix.5 ./
```
3) Run docker container
```
docker run -d tomek/flutter:latest
```
4) Copy the container id that `docker run` returned
5) Execute Flutter tests with screenshots (in case you don't belie that actual application is being run ;))

```
docker exec <containerId> sh -c "cd /home/user/flutter-presentations/ && ./run_tests.sh -s"
```
6) Copy screenshots to local `screenshots` folder
```
docker cp <containerId> :/home/user/flutter-presentations/screenshots screenshots
```

(optional) Doing screenshots slow down Flutter driver tests, if you want to skip the screenshots just execute tests withou `-s`
```
docker exec <containerId> sh -c "cd /home/user/flutter-presentations/ && ./run_tests.sh"
```
