# Flutter Presentations
[![](https://github.com/tomaszpolanski/flutter-presentations/workflows/Analyze/badge.svg)](https://github.com/tomaszpolanski/fast_flutter_driver/actions?query=workflow%3A%22Analyze%22)

Presentations made with Flutter
This presentation is run on desktop with use of
[Flutter Desktop Embedding](https://github.com/google/flutter-desktop-embedding).

This application should be run on high resolution device or a desktop - currently it does not rented properly on small screens.

# Building
Last tested version of Flutter that works with this repo is `3.10.0`:
  * **Important**: Here is [the guide](https://tomek-polanski.medium.com/running-flutter-desktop-on-stable-channel-c2ee38157e7b) on how to checkout a specific Flutter version 

## Building for Web
Upgrade flutter to minimum `3.10.0`, enable web compilation and run:
```
flutter config --enable-web
flutter run -d chrome -v
```

## Building for Desktop
* Check what desktop components are missing by running `flutter doctor`
* Install missing components that you can see under Flutter doctor's  `Linux`/`Window`/`MacOS` section

## Running on Desktop
Enter `flutter-presentations` folder in your terminal and run `flutter run`. 
You might need to use `-d` to pick desktop if you have any other device connected.


### Melos
[Melos](https://melos.invertase.dev/) is a CLI tool used to help manage Dart projects with multiple packages.
It simplifies the selection of modules for testing and building.

To run use `melos` please activate it:

```bash
dart pub global activate melos 2.7.1
```

To get access to all available scripts for the project please run:

```bash
melos run
```

It will show the list of available scripts with the ability to select desired through the command line.

You can also run favorite scripts directly by their names:

```bash
melos run pr_check:all
```

### Mason

[Mason](https://pub.dev/packages/mason_cli) is a template generator which helps teams generate files quickly and consistently.

We store our bricks in `.bricks` directory in the root of the project.
It needs to be a private (`.`) directory to not be considered when we perform `dart format`.

Please refer to the [documentation](https://pub.dev/packages/mason_cli) for the usage description.

Example usage:

```bash
dart pub global activate mason_cli

mason upgrade

mason make talk_module
```
