PImage water;
PImage red;
PImage yellow;
PImage green;
int [] numbers = new int [25];
int [] flowerHp = new int [5];

void setup()
{
    size(500,500);
    water = loadImage("water.png");
    red = loadImage("flower_danger.png");
    yellow = loadImage("flower_warning.png");
    green = loadImage("flower_safe.png");
}

void draw()
{
  background(255);
  for(int i=0; i<numbers.length; ++i){
    image(water, numbers[i], i*20);
  }
  
  for(int i=0; i<flowerHp.length; ++i){
    if(50*i*80 < numbers[24] && numbers[24] < 50+(i+1)*80){
      flowerHp[i] += 5;
      if(flowerHp[i] >= 100){
        flowerHp[i] = 100;
      }
    }
    
    if(flowerHp[i]>80){
      image(green, 50+i*80, height-red.height);
    }else if(flowerHp[i]<=80 && flowerHp[i]>40){
      image(yellow, 50+i*80, height-red.height);
    }else{
      image(red, 50+i*80, height-red.height);
    }
  }
  
  for(int i=24; i>=0; i--){
    if(i==0){
      numbers[i] = mouseX;
    }else{
      numbers[i] = numbers[i-1];
    }
  }
}
