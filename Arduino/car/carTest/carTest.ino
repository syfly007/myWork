#include "InfraredRemote.h"

#define motor1pin 4
#define motor1pwm 5
#define  motor2pin 7
#define motor2pwm 6
 
void setup()
{
  Serial.begin(9600); 
  pinMode(IR_IN,INPUT_PULLUP);//设置红外接收引脚为输入
  Serial.flush(); //清除串口缓冲器内容函数。 
  timer1_init();//定时器初始化 
 }
void loop()
{
  remote_decode(); //译码
  deal(); // 处理
}

void deal(){
  if( adrL_code == 0x40 )
  {
    Serial.println("+");
    foward();      
  }
  else if( adrL_code == 0x19)
  {
    Serial.println("-");
    back();      
  }
  else if( adrL_code == 0x07 )
  {
    Serial.println("Left"); 
    left();    
  }
  else if( adrL_code == 0x09 )
  {
    Serial.println("Right");  
    right();    
  }
  else if( adrL_code == 0x15)
  {
    Serial.println("Stop");
    stop();     
  }
}

void foward(){
  motor(motor1pin,motor1pwm,2,255);      //电机1以180的速度正转,45口控制电机1
  motor(motor2pin,motor2pwm,2,255);      //电机2以180的速度正转，67口控制电机2
}

void back(){
  motor(motor1pin,motor1pwm,1,255);      //电机1以180的速度反转
  motor(motor2pin,motor2pwm,1,255);      //电机2以180的速度反转
}

void stop(){
  motor(motor1pin,motor1pwm,0,0);      
  motor(motor2pin,motor2pwm,0,0);     
}

void left(){
  motor(motor1pin,motor1pwm,2,255);      
  motor(motor2pin,motor2pwm,0,0);     
}

void right(){
  motor(motor1pin,motor1pwm,0,0);      
  motor(motor2pin,motor2pwm,2,255);     
}


void motor(char pin,char pwmpin,char state,int val)//参数pin是输入的高低电平的IO口，pwmpin表示输入的PWM波形的IO口，state指电机状态(正转或反转)，val是调速值大小0-255
{
  pinMode(pin, OUTPUT);    
  if(state==1)                             //当state为1时正转
  {  
    analogWrite(pwmpin,val);
    digitalWrite(pin,1);
   }
  else if(state==2)                     //当state为2时反转
{  
   analogWrite(pwmpin,val);
   digitalWrite(pin,0);
}
else if(state==0)                     //当state为0时停止
{
    analogWrite(pwmpin,0);
    digitalWrite(pin,0);
}
}
