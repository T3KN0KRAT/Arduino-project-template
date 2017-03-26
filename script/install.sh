#!/usr/bin/env bash

command -v arduino >/dev/null 2>&1 || { echo >&2 "I can't find arduino.  Halt."; exit 1; }
command -v avr-gcc >/dev/null 2>&1 || { echo >&2 "I can't find avr-gcc.  Halt."; exit 1; }
echo "Good. arduino and avr-gcc found. I can continue..."
# source "$SCRIPTS_DIR/runtests.sh"
exit

echo "Installing dependencies needed to build the sources and tests..."

ARDUINO_BASENAME="arduino-1.8.3"
ARDUINO_FILE="$ARDUINO_BASENAME-linux64.tgz"
ARDUINO_URL="http://arduino.cc/download.php?f=/$ARDUINO_FILE"

AVR_GCC_BASENAME="arduino-4.9.2"
AVR_GCC_FILE="$AVR_GCC_BASENAME-linux64.tgz"
AVR_GCC_URL="http://arduino.cc/download.php?f=/$AVR_GCC_FILE"

echo "Installing Arduino 1.8.3..."

wget "$ARDUINO_URL" -O "$ARDUINO_FILE"
tar -xzf "$ARDUINO_FILE"
sudo mv "$ARDUINO_BASENAME/" "$ARDUINO"

echo "Installing avr-gcc from Arduino 4.9.2..."

wget "$AVR_GCC_URL" -O "$AVR_GCC_FILE"
tar -xzf "$AVR_GCC_FILE"
sudo mv "$AVR_GCC_BASENAME/hardware/tools/avr" "$AVR_GCC"

echo "Installation of dependencies is complete, we are now going to run some tests..."

source "$SCRIPTS_DIR/runtests.sh"
