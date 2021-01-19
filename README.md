# Flutter Presentations
[![](https://github.com/tomaszpolanski/flutter-presentations/workflows/Analyze/badge.svg)](https://github.com/tomaszpolanski/fast_flutter_driver/actions?query=workflow%3A%22Analyze%22)

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

# Building
Last tested version of Flutter that works with this repo is `1.25.0-8.1.pre`:
  * **Important**: Here is [the guide](https://tomek-polanski.medium.com/running-flutter-desktop-on-stable-channel-c2ee38157e7b) on how to checkout a specific Flutter version 

## Building for Web
Upgrade flutter to minimum `1.25.0-8.1.pre`, enable web compilation and run:
```
flutter config --enable-web
flutter run -d chrome -v
```

## Building for Desktop
* Run `flutter config --enable-linux-desktop --enable-macos-desktop --enable-windows-desktop`
* Check what desktop components are missing by running `flutter doctor`
* Install missing components that you can see under Flutter doctor's  `Linux`/`Window`/`MacOS` section

## Running on Desktop
Enter `flutter-presentations` folder in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.

OR

Open in your ide `flutter-presentations` 
In IntelliJ/VS Code select appropriate device via device picker and run tha app

## Running on Docker
1) Install `docker`
2) Build docker image (will take a couple of minutes)
```
./build_docker.sh 1.25.0-8.1.pre ./
```
3) Run docker container
```
docker run -d tomek/flutter:latest
```
4) Start X11 UI
```
docker exec -d <containerId> sh -c "Xvfb :0 -screen 0 1920x1920x24"
```
5) Execute Flutter tests with screenshots (in case you don't believe that actual application is being run ;))

```
docker exec <containerId> sh -c "cd /home/user/flutter-presentations/ && fastdriver --dart-args "--no-sound-null-safety" --flutter-args "--no-sound-null-safety" -r 1600x1200 -s"
```
6) Copy screenshots to local `screenshots` folder so you can preview them
```
docker cp <containerId>:/home/user/flutter-presentations/screenshots screenshots
```

