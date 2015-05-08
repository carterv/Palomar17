class Item
{
  String type;
  PImage sprite;
  ArrayList<Stat> stats;
  
  Item(String type, ArrayList<Stat> stats)
  {
    this.type="Item."+type;
    this.stats = stats;
    sprite = spriteManager.getSprite(this.type);
  }
  
  void draw()
  {
  }
  
  String getType()
  {
    return type;
  }
  
  void setMods(String modType, float modValue, float modDuration)
  {
    this.modType = modType;
    this.modValue = modValue;
    this.modDuration = modDuration;
  }
}
