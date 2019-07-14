#!/bin/bash

set -e
cd /home/user/flutter-presentations
git pull
flutter packages get
dart lib/test_driver/test_runner.dart "$@"
