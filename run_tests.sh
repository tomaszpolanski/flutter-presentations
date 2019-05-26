#!/bin/bash

set -e
git pull
dart lib/test_driver/test_runner.dart
