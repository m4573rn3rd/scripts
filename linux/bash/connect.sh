#!/bin/bash
osascript -e 'display notification "Connecting To Main Server" with title "tooinnovative"'
say "Connecting To Main Server"
ssh ai@tooinnovative.com
say "Connection Terminated"
osascript -e 'display notification "Connection Terminated" with title "tooinnovative"'
