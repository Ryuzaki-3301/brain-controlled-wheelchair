// This is control the wheelchair.
   #define BAUDRATE 57600
 
const int MotR_A = 3;     
const int MotR_B = 5;     
const int MotL_A = 6;     
const int MotL_B = 9;     
byte GetValue;
void setup()
{
  Serial.begin(BAUDRATE);
  pinMode(MotR_A, OUTPUT);
  pinMode(MotR_B, OUTPUT);
  pinMode(MotL_A, OUTPUT);
  pinMode(MotL_B, OUTPUT);
}
byte ReadOneByte()           // One Byte Read Function
{
  int ByteRead;
  while(!Serial.available());
  ByteRead = Serial.read();
  return ByteRead;
}
void loop()
{
    GetValue = ReadOneByte();   
    switch(GetValue)
    {
       case 'L':                  
           Robot_Left();
           delay(4000);
           Robot_Stop();  
           break;
        case 'R': 
           Robot_Right();
           delay(4000);
           Robot_Stop();
           break;
        case 'F':
           Robot_Forword();
           break;
        case 'B':
           Robot_Reverse();
           break;
        case 'G':
           Robot_Forword();
           break;
        case 'S':
           Robot_Stop();
           break;          
    }
}
 
 
 
  void Robot_Forword()
 {
    digitalWrite(MotR_A, LOW);
    digitalWrite(MotR_B, HIGH);
    digitalWrite(MotL_B, LOW);
    digitalWrite(MotL_A, HIGH);
 }
  void Robot_Reverse()
 {
    digitalWrite(MotR_A, HIGH);
    digitalWrite(MotR_B, LOW);
    digitalWrite(MotL_B, HIGH);
    digitalWrite(MotL_A, LOW);
 }
   void Robot_Right()
 {
    digitalWrite(MotR_A,HIGH);
    digitalWrite(MotR_B, LOW);
    digitalWrite(MotL_B, LOW);
    digitalWrite(MotL_A,HIGH);
 }
    void Robot_Left()
 {
    digitalWrite(MotR_A,LOW);
    digitalWrite(MotR_B,HIGH);
    digitalWrite(MotL_B, HIGH);
    digitalWrite(MotL_A, LOW);
 }
     void Robot_Stop()
 {
    digitalWrite(MotR_A, LOW);
    digitalWrite(MotR_B, LOW);
    digitalWrite(MotL_B, LOW);
    digitalWrite(MotL_A, LOW);
 }
 
