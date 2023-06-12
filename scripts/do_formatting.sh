#!/usr/bin/env bash
#set -x
set -e

find lib -type f -name '*.dart' | grep -v 'lib/generated_plugin_registrant.dart' | xargs flutter format --line-length 120