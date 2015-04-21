class Item
{
  String modType;
  float modValue;
  float modDuration;
  String type;
  PImage sprite;
  
  Item(String modType, float modValue, float modDuration, String type)
  {
    this.modType=modType;
    this.modValue=modValue;
    this.modDuration=modDuration;
    this.type="Item."+type;
    sprite = spriteManager.getSprite(type);
  }
  
  void draw()
  {
    
  }
  
  String getModType()
  {
    return this.modType;
  }
  
  void setModType(String modType)
  {
    this.modType=modType;
  }
  
  float getModValue()
  {
    return this.modValue;
  }
  
  void setModValue(float modValue)
  {
    this.modValue=modValue;
  }
  
  float getModDuration()
  {
    return this.modDuration;
  }
  
  void setModDuration()
  {
    this.modDuration=modDuration;
  }
  
  String getType()
  {
    return this.type;
  }
}
