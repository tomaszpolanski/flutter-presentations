#!/bin/bash

set -e

export VM_SERVICE_URL=$1
dart test_driver/main_test.dart