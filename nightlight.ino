#include <Arduino.h>

#include "octave/gamma.h"
#include "ArduinoPWM16.h"

const uint8_t pinLed = 9; 
const uint8_t pinPot = A0;

void setup() {
    setupPWM16();
    pinMode(A0, INPUT);
}

void loop() {
    analogWrite16(pinLed, GammaCorrection(analogRead(pinPot)));
}