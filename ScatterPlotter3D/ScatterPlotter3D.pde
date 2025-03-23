//Requires Installation of Peasycam and ControlP5 libraries to work. 
//Global Variable Declaration
import peasy.*;
int namePos=0,xPos=0,groupPos=0,birthPos=0,gradePos=0,genderPos=0,yPos=0,strokePos=0,fillPos=0,strokenPos=0,zPos;
String name, gender;
String[] lines; 
int xCord, group, birth,grade,yCord,zCord;
int fillx,filly,strox,stroy,stupx,stupy,stdox,stdoy,exportx,exporty;
boolean fillEn = true, strokEn=true;
int stAmount = 2;
int strokeUp, strokeDown;
int selCol=color(0);
int redCol = color(255,0,0);
int blueCol = color(0,0,255);
int greenCol = color(0,220,0);
int yellowCol = color(255,255,0);
int purpleCol = color(128,0,128);
int barComp=0;
float n;
int shapeComp=0;
int importSt= 0;
int SE = 0;
int SI = 0;
PrintWriter output;
PeasyCam cam;
PGraphics pg;
import controlP5.*;
ControlP5 c5;


void setup(){
size(1200,900,P3D);

fill(0);
PFont font = createFont("arial",20);
   cam = new PeasyCam(this,1000);
  cam.setMinimumDistance(-100000);
  cam.setMaximumDistance(5000);
c5 = new ControlP5(this);
  c5.addButton("Stroke")
  .setValue(1)
  .setPosition(1150,175)
  .setSize(100,100)
    .setFont(font)
  ; 

c5.addButton("Fill")
  .setValue(1)
  .setPosition(1150,75)
  .setSize(100,100)
    .setFont(font)
  ; 

c5.addButton("StrokeP")
  .setValue(0)
  .setPosition(1150,275)
  .setSize(100,100)
    .setFont(font)
  ; 

c5.addButton("StrokeM")
  .setValue(0)
  .setPosition(1150,375)
  .setSize(100,100)
  .setFont(font)
  
  ;
c5.addButton("EXPORT")
  .setValue(1)
  .setPosition(1150,475)
  .setSize(100,100)
    .setFont(font)
  ;
c5.addButton("IMPORT")
  .setValue(0)
  .setPosition(1150,575)
  .setSize(100,100)
    .setFont(font);
  importe(1);
}
void draw(){
  translate(-500,-500);

  //lights();
  ambientLight(100,100,100);
  directionalLight(200,200,200,0,0,-1);
  
  background(211);
  fill(0);
  textSize(30);
  text("Y",-50, height/2);
  text("800",0,75);
  text("600",0,250);
  text("400",0,450);
  text("200",0,650);
  text("0",0,850);
  text("X",width/2-60,height+75);
  text("200",250,height+25);
  text("400",450,height+25);
  text("600",650,height+25);
  text("800",850,height+25);
  text("  1K",1000,height+25);
  text("Z",-75,height-50,450);
  text("200",-10,height-50,200);
  text("400",-10,height-50,400);
  text("600",-10,height-50,600);
  text("800",-10,height-50,800);
  text("1K",-10,height-50,1000);
      if(fillEn==true){fill(0);}else{noFill();}
 strokeWeight(2);
 strox = width - 100;
 stroy = 50;
 fillx = width - 50;
 filly = 50;  
 stdox = width - 100;
 stdoy = 120;
 stupx = width - 50;
 stupy = 120;
 exportx = width- 50;
 exporty= 180;
  if(fillEn==false){noFill();}
textSize(18);

strokeWeight(stAmount);

  n += (1-n)* 0.1; 
  if(fillEn==false){noFill();}
scatterPlot();
}
//Function for importing CSV, includes code for processing exported data
void importe(int x){
  String stringA= "";
  if (x==1){stringA= "scatterdata.csv";}else{stringA="outputdata.csv";}
  strokEn= true;
  fillEn=true;
//Reading first line of csv for column positions.
 lines = loadStrings(stringA);
String [] columns = new String[11];


for (int i = 0; i < 1; i++) {
  columns = split(lines[i], ',');
}
for (int i = 0; i < columns.length; i++){
  
  if (columns[i].equals("Name")){
    namePos = i;
  }else if(columns[i].equals("X")){
    xPos = i;
  }else if(columns[i].equals("Group")){
    groupPos = i;
  }else if(columns[i].equals("Year of Birth")){
    birthPos = i;
  }else if(columns[i].equals("Grade")){
    gradePos = i;
  }else if(columns[i].equals("Gender")){
    genderPos = i;
  }else if(columns[i].equals("Y")){
    yPos = i;
  }else if(columns[i].equals("StrokeWeight")){
     strokePos = i;
  }else if(columns[i].equals("FillEnabled")){
    fillPos = i;
  }else if(columns[i].equals("StrokeEnabled")){
    strokenPos = i;
  }else if(columns[i].equals("Z")){
    zPos = i;
  }
}


textSize(15);
//parsing and storing info in an array
for (int i =1; i < lines.length;i++){
  String[] parts = split(lines[i],',');
  if (columns.length > 8){
    stAmount = int(parts[strokePos]);
    fillEn = parseBoolean(parts[fillPos]);
    strokEn = parseBoolean(parts[strokenPos]);
    
  }


}
}

//Function for plotting points/shapes, labeling and visual attribute allocation
void scatterPlot(){
//Graph Line
  stroke(0);
  strokeWeight(2);
  line(50,height-50,width-200,height-50);
  line(50,height-50,50,50);
  line(50,height-50,0,50,height-50,1000);

for (int i =1; i < lines.length;i++){
    String[] parts = split(lines[i],',');
  name = parts[namePos];
  xCord = int(parts[xPos]);
  group = int(parts[groupPos]);
  birth = int(parts[birthPos]);
  grade = int(parts[gradePos]);
  gender = parts[genderPos];
  yCord = int(parts[yPos]);
  zCord = int(parts[zPos]);
  //Visual attribute allocation, group = color, gender = bar and shape = birth year
  if (fillEn==true){
  
  if (group==0){
      selCol = redCol;
  }else if(group==1){
    selCol=blueCol;
  } else if(group==2){
    selCol=greenCol;}
    else if(group==3){
      selCol=yellowCol;}
    else if(group==4){
      selCol=purpleCol;}else{noFill();}}
  if (gender.equals("Male")){
    barComp=1;}else{barComp=0;}
  if (birth < 2003){shapeComp=1;}else{shapeComp=0;}
    
  
  
  stroke(0);
    if(strokEn==false){noStroke();}else{strokeWeight(stAmount);stroke(selCol);}
  if(fillEn==true){fill(selCol);}else if(strokEn==true){noFill();stroke(0);}else{noFill();}
  //Drawing the shapes and labels
  textAlign(CENTER,BOTTOM);
if(yCord> height-50){
 pushMatrix();
  translate(50,75,zCord);
  if (shapeComp==1){box(15);
    if(fillEn==true){fill(0);}else{noFill();}
         if(barComp==1){line(-20,12,20,12);}
         fill(0);
         text(name,0,33); 
         if(fillEn==true){fill(0);}else{noFill();}
 
 }else{
      sphere(15);
     if(fillEn==true){fill(0);}else{noFill();}
     textSize(20);
     if(barComp==1){line(-20,18,20,18);}
     fill(0);
     text(name,0,40);
         if(fillEn==true){fill(0);}else{noFill();}
     }
 popMatrix();
    
  }else if(yCord < 50){

  pushMatrix();
  translate((xCord+50),(height-50),zCord);
  if (shapeComp==1){box(15);
    if(fillEn==true){fill(0);}else{noFill();}
         if(barComp==1){line(-20,12,20,12);}
         fill(0);
         text(name,0,33); 
         if(fillEn==true){fill(0);}else{noFill();}
 
 }else{
      sphere(15);
     if(fillEn==true){fill(0);}else{noFill();}
     textSize(20);
     if(barComp==1){line(-20,18,20,18);}
     fill(0);
     text(name,0,40);
     if(fillEn==true){fill(0);}else{noFill();}
     }

   popMatrix();
    
  


  }else{
    

  
  pushMatrix();
  translate(xCord+50,(height-yCord)+50, zCord);
  if (shapeComp==1){box(15);
    if(fillEn==true){fill(0);}else{noFill();}
         if(barComp==1){line(-20,12,20,12);}
         fill(0);
     text(name,0,33);
         if(fillEn==true){fill(0);}else{noFill();}
 
 }else{
      sphere(15);
     if(fillEn==true){fill(0);}else{noFill();}
     textSize(20);
         if(barComp==1){line(-20,18,20,18);}
         fill(0);
     text(name,0,40);
         if(fillEn==true){fill(0);}else{noFill();}
     }

   popMatrix();
 // if(barComp==1){line(xCord+30,(height-yCord)+65,xCord+70,(height-yCord)+65);}
    
  if(fillEn==true){fill(0);}else{noFill();}
    //text(name,xCord+50,(height-yCord)+80); 

    
  }
}
  
}




public void Stroke(){
      if(strokEn==true){strokEn=false;}else{strokEn=true;}
}
public void Fill(){
   if(fillEn==false){fillEn=true;}else{fillEn=false;
}
}

public void StrokeP(){
stAmount++;}
public void StrokeM(){
if(stAmount==1){}else{stAmount--;}}
public void EXPORT(){

shouldExport();
}
public void IMPORT(){
  
shouldImport();
}
void shouldImport(){
SI +=1;
if(SI > 1){importe(4);};
}
void shouldExport(){
  SE+=1;
  if (SE > 1){export();}
}





//exports current view into csv file, including currently selected stroke and fill properties
void export(){
  output = createWriter("outputdata.csv");
  String [] linesb = loadStrings("scatterdata.csv");

  output.println("Name,X,Year of Birth,Grade,Y,Z,Gender,Group,StrokeWeight,StrokeEnabled,FillEnabled");
  for (int i =1; i < linesb.length;i++){
  String[] parts = split(linesb[i],',');
  name = parts[namePos];
  xCord = int(parts[xPos]);
  group = int(parts[groupPos]);
  birth = int(parts[birthPos]);
  grade = int(parts[gradePos]);
  gender = parts[genderPos];
  yCord = int(parts[yPos]);
  zCord = int(parts[zPos]);
  String outputline = name + "," + xCord + "," + birth + "," + grade + "," + yCord + "," + zCord + "," + gender + "," + group + "," + stAmount + "," + strokEn + "," + fillEn;
  output.println(outputline);


}
  output.flush();
  output.close();
}
