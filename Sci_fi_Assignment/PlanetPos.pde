class PlanetPos
{
  String name;
  float xPos;
  float yPos;
  
  PlanetPos(TableRow row)
  {
    name = row.getString("name");
    xPos = row.getFloat("xPos");
    yPos = row.getFloat("yPos");
  }
  
 String toString()
 {
   return name
   + "," + xPos
   + "," + yPos
   ;
 }
 
}