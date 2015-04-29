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
    sprite = spriteManager.getSprite(this.type);
  }
  
  void draw()
  {
  }
  
  String getModType()
  {
    return modType;
  }
  
  void setModType(String modType)
  {
    this.modType = modType;
  }
  
  float getModValue()
  {
    return modValue;
  }
  
  void setModValue(float modValue)
  {
    this.modValue = modValue;
  }
  
  float getModDuration()
  {
    return modDuration;
  }
  
  void setModDuration(float modDuration)
  {
    this.modDuration = modDuration;
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
