#include < RCSwitch.h >

unsigned long on1 = 4281651;
unsigned long off1 = 4281660;
unsigned long on2 = 4281804;
unsigned long off2 = 4281795;
unsigned long on3 = 4282115;
unsigned long off3 = 4282124;
unsigned long on4 = 4281795;
unsigned long off4 = 4283660;
unsigned long on5 = 4289795;
unsigned long off5 = 4289804;

RCSwitch mySwitch = RCSwitch();

void setup() {
  Serial.begin(9600);
  mySwitch.enableTransmit(10);
  mySwitch.setProtocol(1);
  mySwitch.setPulseLength(201);
  mySwitch.setRepeatTransmit(5);
}

void loop() {
  if (Serial.available() > 0) {
    int inByte = Serial.read();
    switch (inByte) {
    case '1':
      mySwitch.send(on1, 24);
      break;
    case 'q':
      mySwitch.send(off1, 24);
      break;
    case '2':
      mySwitch.send(on2, 24);
      break;
    case 'w':
      mySwitch.send(off2, 24);
      break;
    case '3':
      mySwitch.send(on3, 24);
      break;
    case 'e':
      mySwitch.send(off3, 24);
      break;
    case '4':
      mySwitch.send(on4, 24);
      break;
    case 'r':
      mySwitch.send(off4, 24);
      break;
    case '5':
      mySwitch.send(on5, 24);
      break;
    case 't':
      mySwitch.send(off5, 24);
      break;
    default:
      break;
    }
    Serial.write(inByte);
  }
}
